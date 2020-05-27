# LaTeX Template for Bachelor's Degree Thesis of WHUT v0.91

## 简介

- 编译要求：XeLaTeX & biber
- 编译环境：TeX Live 2019
- 编译系统：Windows

本项目首次发布于2019年9月29日。

## 简明帮助

参照 [`main.tex`](main.tex) 以及 `body/` 文件夹中文件修改即可。

对于使用 [Overleaf](https://www.overleaf.com/) 或其他尚未安装 *华文中宋 (STzhongsong)* 字体的系统，请在 [`main.tex`](main.tex) 中导入文档类 [`whut-bachelor`](whut-bachelor.cls) 时传入参数 `noextrafonts`
(即 `\documentclass[noextrafonts]{whut-bachelor}`)。
**注意**：此时封面标题等部分字体将不再满足《武汉理工大学本科生毕业设计（论文）撰写规范》要求，请于之后手动修改。

### 目录结构

本模板推荐采用的文件目录结构：
```
.
├── main.tex                % 您的主 TeX 源文件
├── whut-bachelor.cls       % 本项目提供的的类文件
├── ref.bib                 % 包含您的参考文献的文件
└── body/                   % 包含您各章节 TeX 源文件的文件夹
    ├── abstract.tex        % 包含中英文摘要部分的 TeX 源文件
    ├── chapter1.tex        % 第一章的 TeX 源文件
    ├── chapter2.tex        % 第二章的 TeX 源文件
    ├── chapter...          % 后续章节的 TeX 源文件
    └── acknowledgemnt.tex  % 包含致谢部分的 TeX 源文件
```

## TODO

- 补充帮助
- 补充示例

如果您对本模板的各方面有意见或建议，欢迎提出 issue。