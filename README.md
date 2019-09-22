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

* There are information from GitHub API, the words, branches and contributors was generated by cloning the  repo.

![](guides/cuatro.png)

- GitHub Contributors
- Commits frequency by day %
- Heapmat frequency by hour in day

![](guides/cinco.png)

