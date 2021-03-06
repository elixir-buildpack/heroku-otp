# Erlang OTP For Heroku [![Sync OTP Releases](https://github.com/elixir-buildpack/heroku-otp/workflows/Sync%20OTP%20Releases/badge.svg)](https://github.com/elixir-buildpack/heroku-otp/actions/workflows/release-sync.yml) [![Build New OTP Release](https://github.com/heroku-elixir/otp-builds/workflows/Build%20New%20OTP%20Release/badge.svg)](https://github.com/elixir-buildpack/heroku-otp/actions/workflows/build-new-release.yml)

The [Heroku Elixir Buildpack](http://github.com/elixir-buildpack/heroku-buildpack) uses
pre-compiled builds of Erlang OTP for fast deployments. The binaries it uses are
built and stored in this repository. Erlang is compiled in a GitHub action that
uses the official Heroku Docker images to ensure maximum compatability. After a
given version of Erlang is compiled, it is saved as a GitHub release asset.

## Adding New Versions of Erlang

This repo has a workflow that should run every 20 minutes that builds any new OTP releases.
The code in `release_sync/Rakefile` handles the sync interactions with the GitHub API.

## Adding New Heroku stacks

1. Create a `heroku-xx.Dockerfile` in the `stacks` directory.
2. Add the new version to the
   [`.github/workflows/build-new-release.yml`](.github/workflows/build-new-release.yml)
   file in the `cache-docker-images` and `build` jobs.

## Standing on The Shoulders of Giants

A special thanks to everyone who worked on the
[original version](https://github.com/HashNuke/heroku-buildpack-elixir-otp-builds)
of this build system. This version was built in ~5 hours, and that wouldn't have been
possible without using the original as a reference point.

## License

This project is licensed under the Apache 2.0 license, see the full text [here](LICENSE).

&copy; [Kaz Walker](https://github.com/KazW) 2020
