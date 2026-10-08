# Upstream

| | |
| --- | --- |
| Project | OWASP Security Knowledge Framework labs (SKF labs) |
| Repository | https://github.com/blabla1337/skf-labs |
| Lab | `python/NoSQL` (Python) |
| Version | master (SKF labs has no releases) |
| Commit | 35199b6f49658b75f860530c0f09b91e985198aa |
| Licence | Apache-2.0 |

| Here | SKF labs path |
| --- | --- |
| `build/web/app/` | [`python/NoSQL`](https://github.com/blabla1337/skf-labs/tree/35199b6f49658b75f860530c0f09b91e985198aa/python/NoSQL) |

The vendored folder is that commit's lab folder, unchanged, without its Git history.

`build/web/Dockerfile` is the lab's Dockerfile with `COPY ./` changed to `COPY app/`, and: `COPY requirements.txt .` and `COPY . .` read from `app/`; pip installs with `build/web/constraints.txt`, which pins Flask's dependencies (Werkzeug, Jinja2, itsdangerous, click, MarkupSafe) to their versions of 2023-03-06, the date of the lab's last change. Unpinned, pip takes Werkzeug 3, and Flask 2.0.3 fails to start (`ImportError: cannot import name 'url_quote' from 'werkzeug.urls'`).

To update, replace the vendored folder with a newer SKF labs commit, then change this file.
