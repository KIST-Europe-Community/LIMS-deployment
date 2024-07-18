## Setup in Your Local Computer
```shell
git clone --recurse-submodules git@github.com:KIST-Europe-Community/LIMS-deployment.git
```

## To Update Submodules

### On the Local Computer
```shell
git submodules update --remote
```

### On the Remote Server

```shell
sh ./deploy-key-update.sh
```

**But why??**

Due to the limitation of a deploy key, we should update each submodules respectively. [See this workaround.](https://stackoverflow.com/questions/41955700/multiple-ssh-keys-with-git-submodules)

