# Overlay of SKF labs' python/NoSQL/Dockerfile (vendored unchanged in app/). Differences:
# - COPY requirements.txt and COPY . read from app/ (the vendored lab sits in app/ of this build folder);
# - pip installs requirements.txt with constraints.txt, which pins Flask's dependencies to their
#   versions of 2023-03-06 (unpinned upstream, Werkzeug 3 breaks Flask 2.0.3: ImportError: cannot
#   import name 'url_quote' from 'werkzeug.urls').

### Static layers

FROM mongo:6.0.2 AS skf-mongo

# Installing needed binaries and deps. Then removing unneeded deps:
RUN apt update && apt install -y python3 python3-dev python3-pip dos2unix

### Dynamic layers
FROM skf-mongo

WORKDIR /home/app/NoSQL

COPY app/requirements.txt .

# Installing needed binaries and deps
# Overlay: install with the pinned constraints (see constraints.txt).
COPY constraints.txt /tmp/constraints.txt
RUN pip3 install --no-cache-dir  --user -c /tmp/constraints.txt -r requirements.txt 

COPY app/ .

# Fixing Windows line endings for our students:
RUN find . -name "*.sh" -o -name "*.py" -o -name "*.css" -o -name "*.js" | xargs dos2unix

# Setting chmod +x on the scripts:
RUN find . -name "*.sh" -o -name "*.py" | xargs chmod +x

RUN ["chmod", "+x", "./entry.sh"]
ENTRYPOINT ["./entry.sh"]
