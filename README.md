# Using Git with Kony Visualizer

## Quick Start

TLDR: To prevent git from versioning changes made by Visualizer, we need to add some git filters.

## Dependencies

For the filters to work we need to install `jq`. Depending on the OS, here are a few options:

* Linux: Use your default pacakge manager ie. `apt install jq`
* macOS: Install [MacPorts](https://www.macports.org) or [brew](https://brew.sh) ^(recommended) package managers and then `brew install jq` or `port install jq`
* Windows: Install [Chocolatey](https://chocolatey.org) or [Scoop](https://scoop.sh) ^(recommended) package managers and install `jq`

## Setup

If you have `bash` installed, (macOS and Linux have it by default) just open a terminall and run `./filters.sh` script.
This will install all the git filters which you can check with `git config --list`

**For Windows users**: If you already have `git`, you might have `git-bash` installed too, otherwise installing it from aforementioned package managers will let you run the script.

## Caveats & Tips

* The filters are not efficient, big changes will take longer to commit (brand new OBL import takes about 20min)
* Commit very often
* If you ever need to disable the filters, you can comment them out in `.gitattributes` file or edit your git config with `git config -e`.

## Changes from orignal project by Mig82

* Filters aren't gobal anymore
* Removed `git visinit` alias 

## [Original Project](https://github.com/mig82/visualizer-and-git)