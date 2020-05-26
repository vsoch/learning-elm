# Learning Elm

I started working on the [Elm App Catalog](https://github.com/vsoch/elm-app-catalog/)
and to supplement this project, I wanted to do a bunch of exercises on exorcism.io.
This repository will be a collection of those lessons, and I'll be using a shared
Docker base with elm so I don't need to install it locally. I'll be using the same
setup to build a docker base from the included [Dockerfile](Dockerfile) and then
start a container and nginx web server with the included [docker-compose.yml](docker-compose.yml)

## Docker

To build both containers:

```bash
docker-compose build
```

and bring them up:

```bash
$ docker-compose ps
         Name                      Command             State         Ports       
---------------------------------------------------------------------------------
elm-app-catalog_elm_1     /code/docker/entrypoint.sh   Up      8080/tcp          
elm-app-catalog_nginx_1   nginx -g daemon off;         Up      0.0.0.0:80->80/tcp
```

Shell into the container and see that elm is installed:

```bash
$ docker exec -it learning-elm_elm_1 bash
root@be1e8bc80748:/code# elm
Hi, thank you for trying out Elm 0.19.1. I hope you like it!
...
```

The present working directory should be bound to /code in the container,
so we are all set to compile, and then render a web interface. If there 
are permissions issues with files I can do a `chown -R $USER .`.
Here is how to compile a file:

```bash
# elm make src/Main.elm
Success! Compiled 1 module.

    Main ───> index.html

# python -m SimpleHTTPServer 8000
```

and how to analyze or auto-format code:

```bash
elm-format
elm-analyse
```

## Exercism

There are clear instructions for configuring exercism. You'll want to update
your workspace to be the repository;

```bash
$ exercism configure --workspace $PWD 
```

And then confirm it is correct!

```bash
$ exercism workspace
/home/vanessa/Desktop/Code/learning-elm
```
For each exercise, we will want to download code like:

```bash
exercism download --exercise=hello-world --track=elm
/home/vanessa/Desktop/Code/learning-elm/elm/hello-world
```

and it should be downloaded to a subfolder "elm" and the exercise name
in your workspace. When we are done an exercise, we submit like:

```bash
exercism submit /path/to/file [/path/to/file2 ...]
```

See the subfolders of [elm](elm) for the exercises.

## General Commands

For each exercise, we generally want to install dependencies:

```bash
root@b1ffb026f6ab:/code/elm/hello-world# elm make
Starting downloads...

  ● elm/json 1.0.0
  ● elm/time 1.0.0
  ● elm/html 1.0.0
  ● elm/random 1.0.0
  ● elm/url 1.0.0
  ● elm/regex 1.0.0
  ● elm-explorations/test 1.0.0
  ● elm/virtual-dom 1.0.0
  ● elm/browser 1.0.0
  ● elm/core 1.0.0

Dependencies ready!           
-- NO INPUT --------------------------------------------------------------------

What should I make though? I need specific files like:

    elm make src/Main.elm
    elm make src/This.elm src/That.elm

I recommend reading through https://guide.elm-lang.org for guidance on what to
actually put in those files!
```
