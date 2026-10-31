# Third-party notices

This file records third-party material included in this repository. Original workshop content is covered by `LICENSE`; upstream material remains governed by its own license. `tools/sync_upstream.R` regenerates the vendored-file inventory, metadata, and the applicable upstream license text.

## Vendored skill inventory

Upstream repository: [RConsortium/pharma-skills](https://github.com/RConsortium/pharma-skills)  
Pinned commit: `e5db96d54ef5a79cbfd06e2339a3351e4583f8da`  
License: MIT  
Copyright holder stated in the upstream skill license: Jeff Dickinson, Navitas Data Sciences.

| Local file (after sync) | Upstream path |
| --- | --- |
| `.agents/skills/admiral-adsl/references/admiral-SKILL.md` | `admiral/SKILL.md` |
| `.agents/skills/admiral-adsl/SKILL.md` | `admiral/admiral-adsl/SKILL.md` |
| `.agents/skills/admiral-adsl/DESIGN.md` | `admiral/admiral-adsl/DESIGN.md` |
| `.agents/skills/admiral-adsl/LICENSE` | `admiral/admiral-adsl/LICENSE` |
| `.agents/skills/admiral-adsl/UPSTREAM-README.md` | `admiral/admiral-adsl/README.md` |
| `.agents/skills/admiral-adsl/benchmarks/*` | `admiral/admiral-adsl/benchmarks/*` |
| `.agents/skills/admiral-adsl/references/*` | `admiral/admiral-adsl/references/*` |

The wildcard rows are expanded into one entry per file by the sync script. No files or text from `jeffreyad/rpharma-2026-workshop` are included.

## Upstream MIT license

The following license text is reproduced verbatim from `admiral/admiral-adsl/LICENSE` at the pinned commit:

```text
MIT License

Copyright (c) 2026 Jeff Dickinson, Navitas Data Sciences

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

The vendored `admiral` skill is intentionally absent until the sync script is run; its local placeholder README is original workshop content, not copied upstream material.
