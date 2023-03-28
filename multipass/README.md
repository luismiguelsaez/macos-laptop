
## Create VM

```bash
multipass launch -n linux-testing -c 1 -d 20G -m 2048M --cloud-init ./cloud-init.yaml 22.10
multipass mount ${HOME}/.ssh linux-testing:/home/ubuntu/.ssh
```

## Build tools

### Bashly

```
git clone https://github.com/DannyBen/bashly
cd bashly
docker buildx build --platform linux/arm64 -t bashly:$(git describe --tags `git rev-list --tags --max-count=1`) .
```
