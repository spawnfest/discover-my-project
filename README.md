### Spawnfest
# Discover My Project

![](guides/uno.png)

*Author: @carlogilmar*

**Project made for Spawnfest 2019 🇲🇽**

## Setup

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

#### Dependencies

![](guides/dos.png)

## Development

I implemented a git hook for add some valuable tools, so please for development then to clone this repo, run the *install_credo_hooks.sh* script. This script will install a *pre-push* git hook in this repo.

The main goal for this hook is run credo before to make a push to the remote repository, if there are some credo suggestions, the push will be stopped, if you don't have suggestions the push will be uploaded.

Example

![](guides/credo_hook.gif)

I made this for ensure quality in the code analysis made by *Credo*

## Discover My Project

The main goal is explore an open source project through the git data and the github information. It's inspired in [Git Stats Ruby Gem](https://github.com/tomgi/git_stats).

![](guides/tres.png)

## How the project works

Then to run the phoenix server, open `http://localhost:4000/`.

I choosed the Phoenix Live Views as the repo for test  the main flow, you  can try it too!

> https://github.com/phoenixframework/phoenix_live_view.git

![](guides/seis.jpg)

Then you will have the analysis:

Features:

- GitHub Repo Information (org image, repo full name, description, default branch, and language)
- Branches in repo
- Contributors in repo
- More useful words in commits
- More useful words in issues GitHub
- More useful words in PR GitHub

![](guides/cuatro.png)

- GitHub Contributors
- Commits frequency by day %
- Heapmat frequency by hour in day

![](guides/cinco.png)

## Features

- Cloning a repo from a https git url
- Get all commits as structs
- Get more useful words from commits structs
- Get the list of branches in the cloned repo
- Generate the commits frequency by day
- Generate the % by commits made in day
- Get info from the GitHub API
- Get Issues, PR, contributors and repo info from GitHub API
- Get more useful words from issues
- Get more useful words from PR

## TO DO

- Get commits frequency by author
- Get commits frequency by branch
- Get commits frequency by month
- Generate the workflow chart for show the repo construction
- Analize the words used in commits vs words used in PR vs words used in issues
