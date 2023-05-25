#!/usr/bin/env bash

set -ex

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO_DIR=`realpath $BIN_DIR/..`

cd $REPO_DIR

mkdir -p tmp

SITE=$1

shift

echo Build $SITE.json
spl build $SITE -o .

echo Test
cd ../site-parser

npm run parse -- $REPO_DIR -o $REPO_DIR/tmp/${SITE}_out.json "$@"