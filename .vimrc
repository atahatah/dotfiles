if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅の下線タイプのカーソル
    let &t_EI .= "\e[3 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[0 q"
endif

" jjをESCキーの代わりに使うことができる
inoremap <silent> jj <ESC>

" クリップボードにヤンクした内容を保存する
set clipboard=unnamed
