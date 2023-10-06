# NVIDIA Driver の再インストール

NVIDIA Driver はよく壊れるので、再インストールの方法をまとめておく。

## 既存ドライバの再インストール

[エラーメッセージ「NVIDIA-SMI has failed because it couldn’t communicate with the NVIDIA driver. Make sure that the latest NVIDIA driver is installed and running. 」](https://blog.hysakhr.com/2019/11/12/%E3%82%A8%E3%83%A9%E3%83%BC%E3%83%A1%E3%83%83%E3%82%BB%E3%83%BC%E3%82%B8%E3%80%8Cnvidia-smi-has-failed-because-it-couldnt-communicate-with-the-nvidia-driver-make-sure-that-the-latest-nvidia-driver/)を参考にしています。

1. 既存ドライバのアンインストール
   Bash で実行しましょう。Zsh では`*`のところで変に反応します。

```bash
bash
```

```bash
sudo apt-get --purge remove nvidia-*
```

```bash
sudo apt-get --purge remove cuda-*
```

2. ドライバのインストール

```zsh
sudo ubuntu-drivers autoinstall
```

```zsh
sudo dpkg --configure -a
```

```zsh
sudo apt install nvidia-cuda-toolkit
```

ちゃんとインストールできたかは次で確認してください。

```zsh
nvcc -v
```

```zsh
nvidia-smi
```

## NVIDIA Docker のインストール

[Installing the NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)のうち、実行したコマンドを羅列します。絶対に下の内容をコピペして実行しないでください。元のサイトを参考にしてください。

1. Apt を使ってインストール
   Repository を設定

```zsh
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
  && \
    sudo apt-get update
```

NVIDIA Container Toolkit をインストール

```zsh
sudo apt-get install -y nvidia-container-toolkit
```

2. Docker を設定
   Docker が NVIDIA Container Runtime を利用できるようにする。

```zsh
sudo nvidia-ctk runtime configure --runtime=docker
```

Docker daemon を再起動

```zsh
sudo systemctl restart docker
```

ちゃんとインストールできたか次で。確認してください。
```zsh
docker run --gpus all --rm nvidia/cuda:12.2.0-base-ubuntu22.04 nvidia-smi
```
