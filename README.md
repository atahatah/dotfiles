# dotfiles

```sh
git clone https://github.com/atahatah/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
make all
```

## テスト

Docker を使ってテストすることが可能です。

### 立ち上げる

```sh
cd path/to/dir
docker compose build
docker compose up -d
docker compose exec dotfiles zsh
```

### 後片付け

```sh
docker compose down
```

## 参考

[ようこそ dotfiles の世界へ](https://qiita.com/yutkat/items/c6c7584d9795799ee164)

[Mac の環境を dotfiles でセットアップしてみた](https://dev.classmethod.jp/articles/joined-mac-dotfiles-customize/)

[makefile での OS 条件分岐](https://qiita.com/minoruGH/items/424c3d61cfe725dc2620)

[dotfiles 整理 その 1：zsh の構成を見なおそう](https://kitakitabauer.hatenablog.com/entry/2016/09/13/173456)

[.zshrc を色んな環境で共有する方法を考えてみた](https://qiita.com/catatsuy/items/00ebf78f56960b6d43c2)

[ワンライナーで dotfiles をインストールする](https://kisqragi.hatenablog.com/entry/2020/02/17/224129)

[linux インストールからの環境構築を自動化する](https://qiita.com/aki-f/items/494cefe0e98cc74249fa)

[高速で設定しやすい Zsh/Bash プラグインマネージャー Sheldon の紹介](https://zenn.dev/ganta/articles/e1e0746136ce67)
