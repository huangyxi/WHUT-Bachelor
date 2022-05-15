# LaTeX Template for Bachelor's Degree Thesis of WHUT v0.9999

## 简介

- 编译要求：XeLaTeX & biber
- 编译环境：TeX Live 2022
- 编译系统：Windows

本项目首次发布于2019年9月29日。

## 简明帮助

参照 [`main.tex`](main.tex) 以及 [`body/`](body/) 文件夹中文件修改即可。

对于使用 [Overleaf](https://www.overleaf.com/) 或其他尚未安装 *华文中宋 (STzhongsong)* 字体的系统，

~~请在 [`main.tex`](main.tex) 中导入文档类 [`whut-bachelor`](whut-bachelor.cls) 时传入参数 `noextrafonts`(即 `\documentclass[noextrafonts]{whut-bachelor}`)。~~

从`v0.999`开始，本文档类将自动替换缺省的 *华文中宋* 为 *宋体*，无需手动声明，`noextrafonts` 选项已弃用。

**注意**：此时封面标题等部分字体将不再满足《武汉理工大学本科生毕业设计（论文）撰写规范》要求，如果需要在缺省华文中宋的环境下使用该字体，请在获取字体版权方授权的前提下，将字体命名为`STZhongsong.ttf`，并放置在项目根目录(`./`)。

如果各章节标题 *黑体* 错误显示为 *粗宋体*，原因可能为上游 [latex3/latex3#867 bug](https://github.com/latex3/latex3/issues/867)，可以手动更新至 TeX Live 2021 以上，或者在 [`main.tex`](main.tex) 中导入文档类 [`whut-bachelor`](whut-bachelor.cls) 时传入参数 `heitipatch`(即 `\documentclass[heitipatch]{whut-bachelor}`)。

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

如果阁下对本模板的各方面有意见或建议，欢迎提出 [issues](https://github.com/huangyxi/WHUT-Bachelor/issues) 或 [pull requests](https://github.com/huangyxi/WHUT-Bachelor/pulls)。
