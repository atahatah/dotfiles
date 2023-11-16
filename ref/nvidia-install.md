# Install For ML
実際に打ったコマンドを羅列していますが、変更される可能性があるので必ず参照元を確認してください。
## Install CUDA Toolkit and Driver
1. インストール前に行うこと [こちら](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#pre-installation-actions)
2. インストール [こちら](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ubuntu)

もしくは
```sh
sudo apt update
sudo apt install ubuntu-drivers-common
```
の後、[ここ](nvidia.md)の通りにすると入る？
コマンドはchatgpt情報

## Install Docker

1. Dockerのインストールは[こちら](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
```sh
sudo docker run hello-world
```

2. sudoなしで`docker`

[こちら](https://qiita.com/DQNEO/items/da5df074c48b012152ee)より引用
```sh
sudo gpasswd -a $USER docker
```
```sh
sudo systemctl restart docker
```
再ログインすると反映される。

## GitHubにsshを通す
1. keyを作る
```sh
ssh-keygen -t ed25519 -f ~/.ssh/github
```
2. sshのconfigを書き直す
```sh
vi $HOME/.ssh/config
```
```
Host github github.com
	HostName github.com
	IdentityFile ~/.ssh/github
	User git
```
3. 確認
```sh
ssh -T github
```
4. [GitHub](https://github.com/settings/keys)に公開鍵を保存する。
```sh
cat ~/.ssh/github.pub
```