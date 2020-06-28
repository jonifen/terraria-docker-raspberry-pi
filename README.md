# Terraria server in Docker on Raspberry Pi

## Create your server config

There is an example configuration file at `/configs/serverconfig.txt` which you should amend according to your requirements, otherwise the server won't start (it'll get caught in an infinite loop at the server menu).

## Create your world

I couldn't figure a way to get the server to autocreate me a world as unless I specified a world file, it would get caught in the infinite menu loop. I ran the server locally (not in a container) to create the world, and then copied the *.wld file into the worlds directory.

Note: The `.keep` file is purely to stop git from ignoring the directory, and can be removed if you so wish.

## Build the container

```
docker build -t jonifen/terraria .
```

## Run the container

You'll need to have a few details to be able to run the container... the full path to the repository, and also the port you specify (currently defaulted to 7777) should match that in your server config.

```
docker run -itd -v {path_to_repo}/worlds:/terraria/worlds -v {path_to_repo}/configs:/terraria/configs -p 7777:7777/tcp --name terraria_server jonifen/terraria
```

## Save or quit the server (and container)

```
docker attach terraria_server
```

Press enter after connecting if you don't have the colon prompt, and enter the `save` or `exit` commands. See `help` for more options.

