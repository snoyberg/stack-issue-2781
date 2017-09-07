#!/usr/bin/env bash

set -eux

rm -rf .stack-work
rm -rf foo/.stack-work
rm -rf bar/.stack-work

cp foo/v1/Foo.hs foo/src/Foo.hs
stack bench
cp foo/v2/Foo.hs foo/src/Foo.hs
stack bench
