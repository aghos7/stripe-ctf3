# Gitcoin

Welcome to the wonderful world of Gitcoin!

## Overview

The balances are all contained in `LEDGER.txt`.

The only commits that can be pushed are ones that:

- Increments an existing ledger entry by 1, or adds a new ledger entry
  with balance: 1; and
- Has a SHA1 lexicographically less than the value in `difficulty.txt`.

Add yourself to `LEDGER.txt` to pass the level (worth 50 points), at
which points the bots will stop.

Once you're done, check your account page to advance to the global
Gitcoin instance, where you can earn unbounded numbers of leaderboard
points.

Note that until you pass the level we'll periodically start a new
Gitcoin instance, at which point you'll have to run `git reset --hard
origin/master` to reset your clone's state.

## Catalog

- `difficulty.txt`: A strict upper bound on valid Gitcoin SHA1 values.

- `miner`: A Gitcoin miner.

- `LEDGER.txt`: The current Gitcoin balances.

- `README.md`: This file.
