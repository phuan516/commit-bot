# Commit Bot

Ever dreamed of having you github acticity all filled up with those green squares but don't want to actually code? Dream no more. This script will will solve all your problems by pushing a single line of text to a file.

## Description

A script that will automically add, commit, and push to a repo, allowing you to fill up those green squas with a single command.

If you are even more lazy, schedule the script as a task and never worrie about missing a day.

## Getting Started

1. Create a new repository and create a text file that the script will be editing.
2. Copy the `commit.sh` script (you can put it anywhere)
3. Inside `commit.sh` add `REPO_PATH` as a variable under `FILE_NAME`

```
REPO_PATH = "absolute path to your repo"
```
4. That is all fokes, run `commit.sh` and your commit for the day is done.
5. Use crontab to schedule the script to run daily (optional)

```
30 20 * * * [absolute path to the script]
```
