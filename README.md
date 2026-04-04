# templates

个人常用配置文件与 LaTeX 模板集合，方便在不同设备间同步和复用。

## 内容

| 目录/文件               | 说明                                      |
| :-----------:           | :------:                                  |
| `article/`              | LaTeX Article，支持中英文、XeLaTeX 编译   |
| `beamer/`               | LaTeX Beamer，结构与 article 模板一致     |
| `vimrc`                 | Vim 配置（含插件），适用于本地开发环境    |
| `vimrc-without-plugins` | 精简版 Vim 配置（无插件），适合服务器环境 |
| `bashrc`                | Bash 配置文件                             |

## LaTeX 模板特性

- 中文支持（基于 `ctex` + Noto CJK 字体）
- 数学环境：`amsmath`、`mathtools`、自定义数学命令（`mathcmd.tex`）、定理环境（`theorem.tex`）
- 图表：`graphicx`、`subcaption`、`tikz`、`booktabs`
- 参考文献：`biblatex` + `biber`，author-year 格式
- 超链接：`hyperref`，彩色链接
