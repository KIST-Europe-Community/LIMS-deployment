# Getting started

## Requesting the privilege
- `ssh-keygen -t rsa -b 4096 -C "Your email@kist-europe.de"`
It will be generating two keys, public and private.
It will be asking you the password, as well as the location that you want to store the both keys. Store them whatever you want with a identifiable name. For example, passing a location as `~/.ssh/lims-deployment` will make the following two keys.
1. `~/.ssh/lims-deployment.pub`(public)
2. `~/.ssh/lims-deployment`(private)
Then pass your public key to the admin of the remote server so they can append your public key onto the `~/.ssh/authorized_keys` file.

## Set ssh config

- To access deployment server quickly, append this in your ~/.ssh/config file. Make sure you set the following configurations properly. IdentityFile must be the path of your private key.

```shell
Host deploy
    HostName 172.16.68.13
    User LIMS_SERVER
    Port 29
    IdentityFile ~/.ssh/lims-deployment
```

## Deployment

### Access to the Remote Server
```shell
# This will connect you to the remote server shell terminal.
# Make sure you are connected to SCG(or desired remote server network) network.
ssh deploy 
```

### General Procedure
```shell
cd LIMS-deployment

# This will build and start all the services specified in the `docker-compose.yml` file.
docker-compose up -d

```

### When You Need to Build again
When you change client, server code and push to the respective repositories. Then you have to pull them respectively.
Navigate to each repositories and manually pull codes.
```shell
cd LIMS-deployment
cd LIMS-api-server # or cd LIMS-web-client
git pull
cd ..

# Rebuild all services
# relatively takes longer time.
docker-compose up -d --build

# Rebuild individual services
docker-compose up -d --build api # or {web, db, reverse-proxy}. Please take a look into `docker-compose.yml` file for further view.
```

### When You changed Build Process
- It is obvious that you just pull the deployment repo and run whatever you want.
```shell
cd LIMS-deployment
git pull
# ...Whatever
```

### To See Logs on the Containers

```shell
# Check the containers' status.
# If they're exited, then it means there are some problems.
# Then copy the desired container's name.s
docker ps -a


docker logs -t -f --since 30m {container name} 
# It will print logs of {container} since 30minutes ago.
```

### For Future Maintenance
- We 