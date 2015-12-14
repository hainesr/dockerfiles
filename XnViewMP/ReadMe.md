# XnView MP

## Synopsis

This image contains [XnView MP](http://www.xnview.com/en/xnviewmp/).

## Running XnView MP

XnView MP requires access to your local X server to display its interface. Also, it is worth mounting a couple of hidden directories in your home directory so that preferences are preserved between uses.

The following seems to work very well. It starts XnView MP with the current directory as the source of files to work with:

```shell
docker run -it --rm \
  --name xnview \
  --volume=$HOME/.config/.xnviewmp:/home/xnview/.config/.xnviewmp \
  --volume=$HOME/.cache:/home/xnview/.cache \
  --volume=$(pwd):/home/xnview/pics \
  --volume=/tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -u $UID \
  hainesr/xnview xnview
```

See below for a more complex incantation.

### Running other programs in the image

You can run any other program that is installed in the image by simply calling it as normal. For example, to run `bash`:

```shell
docker run -it --rm hainesr/xnview /bin/bash [args]
```

Any arguments you specify will be passed to the program you are running as normal.

## Using Bash functions to run the tools more natively

I like to wrap the command to run the image in a function so that I can run XnView as if it were installed in my `PATH` as normal:

```shell
xnview() {
  local pics_dir=$(pwd)
  if [[ -d "$1" && -r "$1" ]]; then
    pics_dir="$1"
  fi

  docker run -it --rm \
    --name xnview \
    --volume=$HOME/.config/.xnviewmp:/home/xnview/.config/.xnviewmp \
    --volume=$HOME/.cache:/home/xnview/.cache \
    --volume="$pics_dir":/home/xnview/pics \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -u $UID \
    hainesr/xnview xnview
}
```

With this you can run `xnview` as follows:

```shell
$ xnview [directory]
```

If the directory argument is provided, and it is readable, xnview will use this as its pictures directory. Otherwise it will use the current directory.

See [my dotfiles](https://github.com/hainesr/dotfiles) for more details.
