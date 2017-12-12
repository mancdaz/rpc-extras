#!/bin/bash -xe
export BASE_DIR="$(readlink -f $(dirname ${0}))"
source "scripts/functions.sh"
ln -sf "ansible-role-${RPC_PRODUCT_RELEASE}-requirements.yml" "ansible-role-requirements.yml"

rpc-differ --debug -r "$REPO_URL" --update "$PREVIOUS_TAG" "$NEW_TAG" --file diff_notes.rst
pandoc --from rst --to markdown_github < diff_notes.rst > diff_notes.md
