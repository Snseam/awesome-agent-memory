#!/usr/bin/env python3
"""Scrape awesome-list repos -> dedup_v2.json. v2 handles HTML <tr>/<td>."""
import re, os, json, glob
from collections import defaultdict, Counter

REPOS_DIR = "/tmp/aam-scrape/repos"
OUT_PATH = "/tmp/aam-scrape/dedup_v2.json"

REPO_SHORT = {"IAAR-Shanghai_Awesome-AI-Memory": "IAAR-Shanghai",
    "TsinghuaC3I_Awesome-Memory-for-Agents": "TsinghuaC3I",
    "Shichun-Liu_Agent-Memory-Paper-List": "Shichun-Liu",
    "TeleAI-UAGI_Awesome-Agent-Memory": "TeleAI-UAGI",
    "AgentMemoryWorld_Awesome-Agent-Memory": "AgentMemoryWorld",
    "qianlima-lab_awesome-lifelong-llm-agent": "qianlima-lab",
    "DEEP-PolyU_Awesome-GraphMemory": "DEEP-PolyU",
    "VoltAgent_awesome-ai-agent-papers": "VoltAgent",
    "NirDiamant_Agent_Memory_Techniques": "NirDiamant"}
VOLT_KW = ["memory", "recall", "retriev", "episod", "context", "lifelong",
           "persist", " kg", "graph mem", "consolidat", "forget"]

RE_ARXIV = re.compile(r"arxiv\.org/(?:abs|pdf)/(\d{4}\.\d{4,5})(?:v\d+)?", re.I)
RE_ACL = re.compile(r"aclanthology\.org/([\w.-]+)", re.I)
RE_OR = re.compile(r"openreview\.net/(?:forum|pdf)\?id=(\w+)", re.I)
RE_NRP = re.compile(r"proceedings\.neurips\.cc/paper[^)\s\]]+", re.I)
RE_SS = re.compile(r"semanticscholar\.org/paper/([\w-]+)", re.I)
RE_MDLINK = re.compile(r"\[([^\]]+)\]\(([^)]+)\)")
RE_URL = re.compile(r"https?://[^\s)\]<>]+")
RE_TD = re.compile(r"<td[^>]*>(.*?)</td>", re.I | re.S)
RE_TR_S = re.compile(r"<tr[\s>]", re.I)
RE_TR_E = re.compile(r"</tr>", re.I)
RE_STRONG = re.compile(r"<strong[^>]*>(.*?)</strong>", re.I | re.S)
RE_TAG = re.compile(r"<[^>]+>")
RE_IMG = re.compile(r"!\[[^\]]*\]\([^)]*\)")
PUNCT = re.compile(r"[^\w\s]")
WS = re.compile(r"\s+")


def norm_title(t):
    if not t: return ""
    return WS.sub(" ", PUNCT.sub(" ", t.lower())).strip()


def slugify(t, n=60):
    if not t: return ""
    s = re.sub(r"-+", "-", PUNCT.sub("-", t.lower())).strip("-")
    return s[:n].rstrip("-")


def year_from_arxiv(aid):
    if not aid: return None
    m = re.match(r"(\d{2})(\d{2})\.", aid)
    return 2000 + int(m.group(1)) if m else None


def find_keys(text):
    out = []
    for m in RE_ARXIV.finditer(text):
        out.append(("arxiv", m.group(1), f"https://arxiv.org/abs/{m.group(1)}"))
    for m in RE_ACL.finditer(text):
        k = m.group(1).rstrip("/.")
        out.append(("acl", k, f"https://aclanthology.org/{k}"))
    for m in RE_OR.finditer(text):
        out.append(("openreview", m.group(1), f"https://openreview.net/forum?id={m.group(1)}"))
    for m in RE_NRP.finditer(text):
        u = m.group(0).rstrip(".,;")
        k = u.split("/")[-1].split("?")[0].split("#")[0]
        out.append(("neurips", k, u))
    for m in RE_SS.finditer(text):
        out.append(("ss", m.group(1), f"https://www.semanticscholar.org/paper/{m.group(1)}"))
    return out


def clean_td(s):
    if not s: return ""
    s = RE_IMG.sub(" ", s)
    s = re.sub(r"<a[^>]*>(.*?)</a>", r"\1", s, flags=re.I | re.S)
    s = RE_TAG.sub(" ", s).replace("&amp;", "&").replace("&nbsp;", " ")
    return WS.sub(" ", s).strip()


def title_from_tr(tr):
    for cell in RE_TD.findall(tr):
        m = RE_STRONG.search(cell)
        if m:
            t = clean_td(m.group(1))
            if t and len(t) >= 8 and not t.lower().startswith("paper"):
                return t
    best = ""
    for cell in RE_TD.findall(tr):
        if "href=" in cell.lower(): continue
        t = clean_td(cell)
        if re.match(r"^\d{4}-\d{2}(?:-\d{2})?$", t): continue
        if len(t) > len(best): best = t
    if len(best) >= 10 and not best.lower().startswith("paper"):
        return best
    return None


def html_rows(text):
    pos = 0
    while True:
        m = RE_TR_S.search(text, pos)
        if not m: break
        m2 = RE_TR_E.search(text, m.end())
        if not m2: break
        tr = text[m.start():m2.end()]
        pos = m2.end()
        keys = find_keys(tr)
        if not keys: continue
        title = title_from_tr(tr)
        urls = {u.rstrip('".,;)\\') for u in RE_URL.findall(tr)}
        ctx = clean_td(tr)[:300]
        yield title, urls, keys, ctx


def volt_ok(s):
    low = (s or "").lower()
    return any(k in low for k in VOLT_KW)


def process_repo(repo_dir, short, errors):
    is_volt = short == "VoltAgent"
    is_nir = short == "NirDiamant"
    files = sorted(glob.glob(os.path.join(repo_dir, "*.md")))
    files = [f for f in files if os.path.basename(f).upper() not in
             ("LICENSE.MD", "LICENSE", "CONTRIBUTING.MD")]
    if is_nir:
        files = [f for f in files if os.path.basename(f).upper() == "README.MD"]
    for fp in files:
        try:
            text = open(fp, encoding="utf-8", errors="replace").read()
        except Exception as e:
            errors.append(f"{short}:{fp}: {e}"); continue
        emitted = set()
        if "<tr" in text.lower():
            for title, urls, keys, ctx in html_rows(text):
                for kt, kk, canon in keys:
                    yield kt, kk, title, urls | {canon}, ctx
                    emitted.add((kt, kk))
        lines = text.splitlines()
        head = ""
        for idx, line in enumerate(lines):
            s = line.strip()
            if s.startswith("#"):
                head = s.lstrip("#").strip(); continue
            if not s: continue
            if is_volt and not (volt_ok(head) or volt_ok(s)): continue
            keys = find_keys(line)
            if not keys: continue
            mdl = [(t.strip(), u.strip()) for t, u in RE_MDLINK.findall(line)]
            u2t = {u: t for t, u in mdl}
            mtab = None
            if line.lstrip().startswith("|") and line.count("|") >= 3:
                cells = [c.strip() for c in line.strip().strip("|").split("|")]
                best = ""
                for c in cells:
                    if "http" in c or "![" in c or "shields.io" in c: continue
                    if re.match(r"^\d{4}[-/]\d{2}(?:[-/]\d{2})?$", c): continue
                    if len(c) > len(best): best = c
                if len(best) >= 8: mtab = best
            def _pick(pat):
                m = re.search(pat, line)
                if not m: return None
                c = m.group(1).strip().strip("*").lstrip("[").strip()
                c = re.split(r"\]\(", c)[0].strip().rstrip("]").strip()
                if len(c) < 8 or c.lower().startswith("paper") or "shields.io" in c \
                   or c.startswith("!") or re.match(r"^\d{4}[-/]\d{1,2}", c):
                    return None
                return c

            def _local(kk):
                m_local = re.search(r"\[([^\]\[]{2,200})\]\([^)]*" + re.escape(kk), line)
                if not m_local: return None
                c = m_local.group(1).strip().strip("*")
                if c and "shields.io" not in c and not c.startswith("!") and c.lower() != "paper":
                    return c
                return None
            line_title = (_pick(r"\*\*([^*]{8,200})\*\*")
                          or _pick(r"\]\s+([^\[\n]+?)\.?\s*\[\[paper")
                          or _pick(r"([A-Z][^\]\[\n]{8,200})\]\(https?://"))
            multi_keys = len(keys) > 1
            for kt, kk, canon in keys:
                if (kt, kk) in emitted: continue
                title = (_local(kk) if multi_keys else None) or mtab or line_title
                if not title:
                    for t, _u in mdl:
                        if t and not t.startswith("!") and "shields.io" not in t \
                           and len(t) >= 6 and t.lower().strip("[") != "paper":
                            title = t; break
                urls = {canon}
                for u in u2t:
                    if kk in u: urls.add(u)
                for m in RE_URL.finditer(line):
                    if kk in m.group(0): urls.add(m.group(0).rstrip(".,;)"))
                yield kt, kk, title, urls, s[:200]


def main():
    errors = []
    papers = {}
    tidx = {}
    cov = defaultdict(set)
    for repo, short in REPO_SHORT.items():
        rd = os.path.join(REPOS_DIR, repo)
        if not os.path.isdir(rd):
            errors.append(f"missing repo: {repo}"); continue
        for kt, kk, title, urls, ctx in process_repo(rd, short, errors):
            if kt == "arxiv":
                canon = ("arxiv", kk)
            else:
                nt = norm_title(title) if title else ""
                canon = tidx[nt] if (nt and nt in tidx) else (kt, kk)
            if canon not in papers:
                papers[canon] = {"arxiv_id": kk if kt == "arxiv" else None,
                                 "title": title or "", "urls": set(),
                                 "sources": set(), "context_snippets": [],
                                 "_nt": set()}
                if title:
                    nt = norm_title(title)
                    if nt: tidx[nt] = canon; papers[canon]["_nt"].add(nt)
            p = papers[canon]
            if kt == "arxiv" and not p["arxiv_id"]: p["arxiv_id"] = kk
            if title and len(title) > len(p["title"]): p["title"] = title
            if title:
                nt = norm_title(title)
                if nt and nt not in p["_nt"]:
                    p["_nt"].add(nt); tidx[nt] = canon
            p["urls"].update(urls)
            p["sources"].add(short)
            if len(p["context_snippets"]) < 3 and ctx not in p["context_snippets"]:
                p["context_snippets"].append(ctx)
            cov[short].add(canon)
    out = []
    for canon, p in papers.items():
        t = p["title"] or ""
        a = p["arxiv_id"]
        slug = slugify(t) if t else (f"arxiv-{a}" if a else f"{canon[0]}-{canon[1]}"[:60])
        out.append({"slug": slug, "arxiv_id": a, "title": t or None,
                    "year": year_from_arxiv(a), "urls": sorted(p["urls"]),
                    "sources": sorted(p["sources"]),
                    "context_snippets": p["context_snippets"]})
    out.sort(key=lambda x: (-(x["year"] or 0), -len(x["sources"]), x["slug"]))
    json.dump(out, open(OUT_PATH, "w", encoding="utf-8"), ensure_ascii=False, indent=2)
    untitled = sum(1 for x in out if not x["title"])
    with_a = sum(1 for x in out if x["arxiv_id"])
    print(f"total={len(out)} untitled={untitled} with_arxiv={with_a}")
    print("years:", dict(Counter(x["year"] for x in out)))
    print("coverage:", {s: len(cov[s]) for s in REPO_SHORT.values()})
    if errors: print("errors:", errors)


if __name__ == "__main__":
    main()
