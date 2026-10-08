#!/bin/sh
# The comments API answers from MongoDB.
set -e
H=http://web:5000
curl -fsS "$H/comments/" | grep -q '"comments"'
