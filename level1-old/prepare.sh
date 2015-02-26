#!/bin/bash

set -eu

if [ "$#" != 2 ]; then
    echo >&2 "Usage: $0 <clone_url> <public_username>

A VERY SLOW mining implementation. This should give you an idea of
where to start, but it probably won't successfully mine you any
Gitcoins.

Arguments:

<clone_url> is the string you'd pass to git clone (i.e.
  something of the form username@hostname:path)

<public_username> is the public username provided to you in
  the CTF web interface."
    exit 1
fi

export clone_spec=$1
export public_username=$2

rm -rf temp
git clone $clone_spec temp
cd temp
perl -i -pe 's/($ENV{public_username}: )(\d+)/$1 . ($2+1)/e' LEDGER.txt
grep -q "$public_username" LEDGER.txt || echo "$public_username: 1" >> LEDGER.txt

git add LEDGER.txt
