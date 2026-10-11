#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) (placeholder: the NoSQL injection does not read files);
# without one (CI, a run by hand) the development flag.
dev='FLAG{dev-skf-nosql}'
printf '%s\n' "${CTF_FLAG_MAIN:-$dev}" > /ctf/flag
chmod 444 /ctf/flag
