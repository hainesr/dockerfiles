# Perforce Helix Clients

## Synopsis

This image contains the suite of free [Perforce Helix Clients](https://www.perforce.com/downloads/helix#clients):

* Helix administration tool (`p4admin`). Enables system administrators to easily manage and monitor Perforce Helix users and SCM operations.
* Visual merge tool (`p4merge`). Provides graphical three-way merging and side-by-side file comparisons.
* Visual client (`p4v`). Provides access to versioned files through a graphical interface and also includes tools for merging and visualizing code evolution.
* Command-line tool (`p4vc`). Provides access to all Perforce features and functions as an interface for scripting and automated operations.

## Building the image

Download the `p4v` package from the [Perforce website](https://www.perforce.com/downloads/helix#clients) and save it in this directory. Then run:

```
docker build -t <tag> .
```

## Running the tools

Use the following incantations to run each of the tools within this image. Note that the tools that have graphical interfaces need to be able to open a window on your local X server.

The tools all run as the user `p4v` within the container but you can tell `docker` to run the container as another user with the `-u` switch, as shown in the examples below.

### Helix administration tool

```shell
docker run -it --rm \
  --name p4admin \
  --volume=$HOME/.p4admin:/home/p4v/.p4admin \
  --volume=$HOME/.cache:/home/p4v/.cache \
  --volume=/tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -u $UID \
  hainesr/p4v p4admin
```

### Visual merge tool

```shell
docker run -it --rm \
  --name p4merge \
  --volume=$HOME/.p4merge:/home/p4v/.p4merge \
  --volume=$HOME/.cache:/home/p4v/.cache \
  --volume=$(pwd):/opt/work \
  --volume=/tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -u $UID \
  hainesr/p4v p4merge [args]
```

Replace `[args]` with `-h` for more information.

### Visual client

```shell
docker run -it --rm \
  --name p4v \
  --volume=$HOME/.p4qt:/home/p4v/.p4qt \
  --volume=$HOME/.cache:/home/p4v/.cache \
  --volume=/tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -u $UID \
  hainesr/p4v p4v
```

### Command-line tool

```shell
docker run -it --rm \
  --name p4vc \
  --volume=$(pwd):/opt/work \
  -u $UID \
  hainesr/p4v p4vc [args]
```

Replace `[args]` with `help` for more details.

### Running other programs in the image

You can run any other program that is installed in the image by simply calling it as normal. For example, to run `bash`:

```shell
docker run -it --rm hainesr/p4v /bin/bash [args]
```

Any arguments you specify will be passed to the program you are running as normal.

## Using Bash functions to run the tools more natively

I like to wrap the commands above in a function so that I can run them as if the tools were installed in my `PATH` as normal. For example (`p4merge`):

```shell
p4merge() {
  docker run -it --rm \
    --name p4merge \
    --volume=$HOME/.config/p4merge:/home/p4v/.p4merge \
    --volume=$HOME/.cache:/home/p4v/.cache \
    --volume=$(pwd):/opt/work \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -u $UID \
    hainesr/p4v p4merge "$@"
}
```

This runs `p4merge`, passing arguments through as required.

See [my dotfiles](https://github.com/hainesr/dotfiles) for more details.
