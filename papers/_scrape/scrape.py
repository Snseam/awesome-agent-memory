#!/usr/bin/env python3
"""Extract paper references from awesome-list repos and produce deduped index."""
import re
import os
import json
import glob
from collections import defaultdict, Counter

REPOS_DIR = "/tmp/aam-scrape/repos"
OUT_PATH = "/tmp/aam-scrape/dedup.json"

REPO_SHORT = {
    "IAAR-Shanghai_Awesome-AI-Memory": "IAAR-Shanghai",
    "TsinghuaC3I_Awesome-Memory-for-Agents": "TsinghuaC3I",
    "Shichun-Liu_Agent-Memory-Paper-List": "Shichun-Liu",
    "TeleAI-UAGI_Awesome-Agent-Memory": "TeleAI-UAGI",
    "AgentMemoryWorld_Awesome-Agent-Memory": "AgentMemoryWorld",
    "qianlima-lab_awesome-lifelong-llm-agent": "qianlima-lab",
    "DEEP-PolyU_Awesome-GraphMemory": "DEEP-PolyU",
    "VoltAgent_awesome-ai-agent-papers": "VoltAgent",
    "NirDiamant_Agent_Memory_Techniques": "NirDiamant",
}

VOLT_KEYWORDS = ["memory", "recall", "retriev", "episod", "semantic memory",
                 "context", "lifelong", "persist", " kg", "graph mem",
                 "consolidat", "forget"]

# Regex patterns
RE_ARXIV = re.compile(r"arxiv\.org/(?:abs|pdf)/(\d{4}\.\d{4,5})(?:v\d+)?", re.I)
RE_ACL = re.compile(r"aclanthology\.org/([\w.-]+)", re.I)
RE_OR = re.compile(r"openreview\.net/(?:forum|pdf)\?id=(\w+)", re.I)
RE_NEURIPS = re.compile(r"proceedings\.neurips\.cc/paper[^)\s\]]+", re.I)
RE_SS = re.compile(r"semanticscholar\.org/paper/([\w-]+)", re.I)

# Markdown link pattern: [title](url)
RE_MDLINK = re.compile(r"\[([^\]]+)\]\(([^)]+)\)")
# Bare URL
RE_URL = re.compile(r"https?://[^\s)\]<>]+")

PUNCT_RE = re.compile(r"[^\w\s]")
WS_RE = re.compile(r"\s+")


def norm_title(t):
    if not t:
        return ""
    t = t.lower()
    t = PUNCT_RE.sub(" ", t)
    t = WS_RE.sub(" ", t).strip()
    return t


def slugify(t, maxlen=60):
    if not t:
        return ""
    s = t.lower()
    s = PUNCT_RE.sub("-", s)
    s = re.sub(r"-+", "-", s).strip("-")
    return s[:maxlen].rstrip("-")


def year_from_arxiv(aid):
    if not aid:
        return None
    m = re.match(r"(\d{2})(\d{2})\.", aid)
    if not m:
        return None
    yy = int(m.group(1))
    # arXiv new-style IDs started 2007. Map 07-99 -> 2007-2099, 00-06 -> 2100+ unlikely
    return 2000 + yy


def find_paper_keys(text):
    """Return list of (key_type, key, full_url) tuples for one text blob."""
    out = []
    for m in RE_ARXIV.finditer(text):
        aid = m.group(1)
        url = f"https://arxiv.org/abs/{aid}"
        out.append(("arxiv", aid, url))
    for m in RE_ACL.finditer(text):
        key = m.group(1).rstrip("/.")
        url = f"https://aclanthology.org/{key}"
        out.append(("acl", key, url))
    for m in RE_OR.finditer(text):
        key = m.group(1)
        url = f"https://openreview.net/forum?id={key}"
        out.append(("openreview", key, url))
    for m in RE_NEURIPS.finditer(text):
        url = m.group(0).rstrip(".,;")
        # use last path segment as key
        key = url.split("/")[-1].split("?")[0].split("#")[0]
        out.append(("neurips", key, url))
    for m in RE_SS.finditer(text):
        key = m.group(1)
        url = f"https://www.semanticscholar.org/paper/{key}"
        out.append(("ss", key, url))
    return out


def extract_line_context(line):
    """Try to extract [title](url) pairs from a line; return list of (title, url)."""
    return [(t.strip(), u.strip()) for t, u in RE_MDLINK.findall(line)]


def volt_keyword_ok(context_text):
    low = context_text.lower()
    return any(k in low for k in VOLT_KEYWORDS)


def process_repo(repo_dir, short_name, errors):
    """Yield (paper_key, title, url, context_line) tuples."""
    is_volt = short_name == "VoltAgent"
    is_nir = short_name == "NirDiamant"
    md_files = sorted(glob.glob(os.path.join(repo_dir, "*.md")))
    md_files = [f for f in md_files if os.path.basename(f).upper() != "LICENSE.MD"
                and os.path.basename(f).upper() != "LICENSE"
                and os.path.basename(f).upper() != "CONTRIBUTING.MD"]
    if is_nir:
        md_files = [f for f in md_files if os.path.basename(f).upper() == "README.MD"]

    for fp in md_files:
        try:
            with open(fp, "r", encoding="utf-8", errors="replace") as f:
                lines = f.readlines()
        except Exception as e:
            errors.append(f"{short_name}:{fp}: {e}")
            continue

        current_heading = ""
        for line in lines:
            stripped = line.strip()
            if stripped.startswith("#"):
                current_heading = stripped.lstrip("#").strip()
                continue
            if not stripped:
                continue

            # VoltAgent filter: heading + line must have memory-related keyword
            if is_volt:
                if not (volt_keyword_ok(current_heading) or volt_keyword_ok(stripped)):
                    continue

            keys = find_paper_keys(line)
            if not keys:
                continue

            md_links = extract_line_context(line)
            # Map url -> title for this line
            url_to_title = {}
            for t, u in md_links:
                url_to_title[u] = t

            for key_type, key, canon_url in keys:
                # find best title: look for any md_link whose url contains the key
                title = None
                for u, t in url_to_title.items():
                    if key in u:
                        title = t
                        break
                if not title and md_links:
                    # fallback: first md link on the line
                    title = md_links[0][0]

                # Collect all URLs on the line that match this key
                urls = set([canon_url])
                for u in url_to_title.keys():
                    if key in u:
                        urls.add(u)
                # Also raw URLs
                for m in RE_URL.finditer(line):
                    if key in m.group(0):
                        urls.add(m.group(0).rstrip(".,;)"))

                ctx = stripped[:200]
                yield (key_type, key, title, urls, ctx)


def main():
    errors = []
    # papers indexed by canonical key
    papers = {}  # canon_key -> dict
    # secondary index: norm_title -> canon_key (for title-based dedup of non-arxiv)
    title_index = {}
    coverage = defaultdict(set)  # short_name -> set of canon_keys

    for repo_name, short in REPO_SHORT.items():
        repo_dir = os.path.join(REPOS_DIR, repo_name)
        if not os.path.isdir(repo_dir):
            errors.append(f"missing repo: {repo_name}")
            continue
        for key_type, key, title, urls, ctx in process_repo(repo_dir, short, errors):
            # Canonical key: prefer arxiv id
            if key_type == "arxiv":
                canon = ("arxiv", key)
            else:
                # Try title-based merge
                nt = norm_title(title) if title else ""
                if nt and nt in title_index:
                    canon = title_index[nt]
                else:
                    canon = (key_type, key)

            if canon not in papers:
                papers[canon] = {
                    "arxiv_id": key if key_type == "arxiv" else None,
                    "title": title or "",
                    "urls": set(),
                    "sources": set(),
                    "context_snippets": [],
                    "_norm_titles": set(),
                }
                if title:
                    nt = norm_title(title)
                    if nt:
                        title_index[nt] = canon
                        papers[canon]["_norm_titles"].add(nt)

            p = papers[canon]
            # Possibly upgrade arxiv_id if we now see one and didn't before
            if key_type == "arxiv" and not p["arxiv_id"]:
                p["arxiv_id"] = key
            # Title: keep longest
            if title and len(title) > len(p["title"]):
                p["title"] = title
            if title:
                nt = norm_title(title)
                if nt and nt not in p["_norm_titles"]:
                    p["_norm_titles"].add(nt)
                    title_index[nt] = canon
            p["urls"].update(urls)
            p["sources"].add(short)
            if len(p["context_snippets"]) < 3 and ctx not in p["context_snippets"]:
                p["context_snippets"].append(ctx)
            coverage[short].add(canon)

    # Build output list
    out = []
    for canon, p in papers.items():
        title = p["title"] or ""
        arxiv_id = p["arxiv_id"]
        if title:
            slug = slugify(title)
        elif arxiv_id:
            slug = f"arxiv-{arxiv_id}"
        else:
            slug = f"{canon[0]}-{canon[1]}"[:60]
        year = year_from_arxiv(arxiv_id)
        out.append({
            "slug": slug,
            "arxiv_id": arxiv_id,
            "title": title or None,
            "year": year,
            "urls": sorted(p["urls"]),
            "sources": sorted(p["sources"]),
            "context_snippets": p["context_snippets"],
        })

    out.sort(key=lambda x: (-(x["year"] or 0), -len(x["sources"]), x["slug"]))

    with open(OUT_PATH, "w", encoding="utf-8") as f:
        json.dump(out, f, ensure_ascii=False, indent=2)

    # Summary
    print(f"Total unique papers: {len(out)}")
    yc = Counter(x["year"] for x in out)
    print("Count by year:")
    for y in sorted(yc.keys(), key=lambda k: (k is None, -(k or 0))):
        print(f"  {y}: {yc[y]}")

    top = sorted(out, key=lambda x: -len(x["sources"]))[:10]
    print("\nTop-10 papers by source-repo count:")
    for p in top:
        t = (p["title"] or p["slug"])[:80]
        print(f"  [{len(p['sources'])}] {t}  ({p['arxiv_id']})  sources={p['sources']}")

    with_a = sum(1 for x in out if x["arxiv_id"])
    print(f"\nWith arxiv_id: {with_a} | Without: {len(out) - with_a}")

    print("\nCoverage per repo:")
    for short in REPO_SHORT.values():
        print(f"  {short}: {len(coverage[short])}")

    if errors:
        print("\nErrors:")
        for e in errors:
            print(f"  {e}")

    print("\nFirst 5 entries:")
    for p in out[:5]:
        print(f"  - {p['title']!r} | arxiv={p['arxiv_id']} | sources={p['sources']}")
    print("\nLast 5 entries:")
    for p in out[-5:]:
        print(f"  - {p['title']!r} | arxiv={p['arxiv_id']} | sources={p['sources']}")


if __name__ == "__main__":
    main()
