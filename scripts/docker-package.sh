#!/usr/bin/env bash

set -ex

BRANCH=$(git rev-parse --abbrev-ref HEAD)

DIR=$(dirname "$0")

# If the branch comes out as HEAD then we're probably checked out to a tag, so if the thing is *not*
# coming out as HEAD then we're on a branch. When we're on a branch, we want to resolve ourselves to
# a few SHAs rather than a version.
if [[ $BRANCH != HEAD && ! $BRANCH =~ heads/v.+ ]]
then
    DIST_VERSION=$("$DIR"/get-version-from-git.sh)
else
    # Remote Docker Git contexts are often detached at a pinned custom commit
    # with no tag refs. Preserve traceability instead of failing the build.
    DIST_VERSION=$(git describe --abbrev=0 --tags 2>/dev/null || git rev-parse --short HEAD)
fi

DIST_VERSION=$("$DIR"/normalize-version.sh "$DIST_VERSION")

VERSION=$DIST_VERSION pnpm --dir apps/web build
