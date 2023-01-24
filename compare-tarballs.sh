#!/bin/bash -eu
TARBALL_A=$1
TARBALL_B=$2
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT
DIR_A=$TMP_DIR/a
DIR_B=$TMP_DIR/b
mkdir $DIR_A $DIR_B
tar xaf $TARBALL_A -C $DIR_A
tar xaf $TARBALL_B -C $DIR_B
cd $TMP_DIR
diff --ignore-space-change -Nru a b
