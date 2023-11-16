# Install Rootless Docker
[このページ](https://docs.docker.com/engine/security/rootless/)を見ながらRootless modeをUbuntu22.04で有効にしました。
どのコマンドを実際に打ったかを記録します。
必ず元のページを参照してください。

## Sudoerでやっておくこと
### 条件
1. Install `uidmap`
```sh
sudo apt install uidmap
```
2. 次の実行結果の値が両方65536以上であることを確認
```sh
grep ^$(whoami): /etc/subuid
```
```sh
grep ^$(whoami): /etc/subgid
```

### Distribution-specific hint
1. Install `dbus-user-session`
```sh
sudo apt-get install -y dbus-user-session
```

### インストール
今動いているDockerを止める。
```sh
sudo systemctl disable --now docker.service docker.socket
```
Dockerを`apt`で入れたので次のコマンドでインストールする。
(何故か`--force`を付けないとDockerが起動していると怒られた。)
```sh
dockerd-rootless-setuptool.sh install --force
```

### 使い方
```sh
systemctl --user start docker
```
```sh
systemctl --user enable docker
```
```sh
sudo loginctl enable-linger $(whoami)
```

### 設定の変更
[こちらのサイト](https://qiita.com/yuyakato/items/094724fbd67dcc3e47a9#43-nvidia-container-runtime%E3%81%AE%E8%A8%AD%E5%AE%9A%E3%82%92%E5%A4%89%E6%9B%B4%E3%81%99%E3%82%8B)に書いてあったが、GPUを使うならば
次のように設定ファイルを変更する必要があるらしい。
```sh
sudo cp /etc/nvidia-container-runtime/config.toml /etc/nvidia-container-runtime/config.toml.backup
```
```sh
sudo vi /etc/nvidia-container-runtime/config.toml
```

## 各ユーザ毎にすること
```sh
dockerd-rootless-setuptool.sh install
```
```sh
systemctl --user start docker
```
```sh
systemctl --user enable docker
```
場合によっては次のようなものを`.bashrc`などに書き込む必要がある。
```.bashrc
export DOCKER_HOST=unix:///run/user/$uid/docker.sock
```

## 確認
```sh
docker run hello-world
```
GPU使う場合は、
```sh
docker run --gpus all --rm nvidia/cuda:12.2.0-base-ubuntu22.04 nvidia-smi
```
### テストユーザの作成方法
ユーザ名が`test`の場合
```sh
sudo useradd test
```
パスワードの設定
```sh
sudo passwd test
```
ユーザの削除
```sh
sudo userdel -r test
```