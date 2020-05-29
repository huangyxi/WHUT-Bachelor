%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% UNOFFICIAL LaTeX Template for WHUT Bachelor Thesis
%% First Released on 2019/09/29
%% Created by Huang Yuxi
%% See https://github.com/Markhng/WHUT-Bachelor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{whut-bachelor}
[2020/05/29 v0.99 Unofficial LaTeX Document Class for WHUT Bachelor Thesis]

\newcommand*\whut@tokens@title{}
\newcommand*\whut@tokens@school{}
\newcommand*\whut@tokens@class{}
\newcommand*\whut@tokens@author{}
\newcommand*\whut@tokens@supervisor{}
\newcommand*\whut@tokens@keywords{}
\newif\ifwhut@options@minimal\whut@options@minimalfalse
\newif\ifwhut@options@nobib\whut@options@nobibfalse
\newif\ifwhut@options@noextrafonts\whut@options@noextrafontsfalse

\DeclareOption{minimal}{\whut@options@minimaltrue}	% only load fundamental packages
\DeclareOption{nobib}{\whut@options@nobibtrue}	% do NOT load biblatex
\DeclareOption{noextrafonts}{\whut@options@noextrafontstrue}	% do NOT use SinoType(R) fonts: STzhongsong
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
%\ExecuteOptions{doctor,chinese,print,super}
\ProcessOptions\relax

\ifwhut@options@minimal
	\whut@options@nobibtrue
\fi

\RequirePackage{ifxetex}
\ifxetex
\PassOptionsToPackage{quiet}{xeCJK}
\fi

\LoadClass[a4paper, 12pt]{ctexart}
\ifwhut@options@minimal\whut@options@nobibtrue\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% load packages
%\RequirePackage{ctex}

\ifwhut@options@noextrafonts
	\providecommand{\zhongsong}{}
\else
	\providecommand{\zhongsong}{\CJKfontspec{STZhongsong}}	%华文中宋
\fi

\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\RequirePackage{amsmath, amsfonts}
\RequirePackage[includeheadfoot]{geometry}
\geometry{
	top=2.5cm, bottom=2cm, left=2.5cm, right=2cm,
	headheight=13pt, headsep=0.1cm, footskip=0.51cm
}	% footskip should be 0.4cm, but this is too small
\RequirePackage[indentafter]{titlesec}	% \titlespacing*
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}

\ifwhut@options@nobib\else
\RequirePackage[backend=biber, style=gb7714-2015]{biblatex}
\fi

\ifwhut@options@minimal\else
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{enumitem}
\setlist[1]{parsep=0ex, topsep=1ex, itemsep=0ex}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array, longtable, booktabs}
\RequirePackage{multirow, bigstrut, bigdelim}
\RequirePackage{caption, subcaption}
\captionsetup{labelsep = quad}
\captionsetup[figure]{skip = {5pt plus 2pt minus 1pt}}
\RequirePackage{cprotect}
\RequirePackage{listings}
%\RequirePackage{tikz}
\fi

\RequirePackage{hyperref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% define markups

\setlength{\baselineskip}{20pt}
% \renewcommand*{\baselinestretch}{1.5}
\renewcommand\normalsize{
	\abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@	% tolerance ±
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 7\p@ \@plus3\p@ \@minus4\p@
	\belowdisplayskip \abovedisplayskip
	\let\@listi\@listI
}
\titlespacing*{\section}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}

\hypersetup{
	pdfstartview=FitH,
	CJKbookmarks=true,
	bookmarksnumbered=true,
	bookmarksopen=true,
	allcolors=blue,
	pdfsubject={WHUT Bachelor Thesis},
	pdfcreator={whut-bachelor class [github.com/Markhng/WHUT-Bachelor]},
	%	linkcolor=MidnightBlue,
	%	citecolor=Olive,
	%	pdfborder=001
}

{\sf}	% the serial number of the first section will be wrong if missing this line
% and not printing `maketitle'
\renewcommand{\maketitle}{\par
	\begingroup
	\newpage
	\global\@topnum\z@	% prevents figures from going at top of page
	\pdfbookmark[1]{封面}{anchor}
	\@maketitle
	\endgroup
	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\@maketitle\relax
	\global\let\@thanks\@empty
	\global\let\@author\@empty
	\global\let\@date\@empty
	\global\let\@title\@empty
	\global\let\title\relax
	\global\let\author\relax
	\global\let\date\relax
	\global\let\and\relax
}

\renewcommand{\@maketitle}{%
\smallskip
\begin{center}
	\vspace*{2.2cm}
	{\zihao{1}\zhongsong \whut@cap@titlename} \\
	\vspace*{3.3cm}
	{\zihao{2}\bfseries\sffamily \whut@tokens@title}\\
	\vspace*{5.5cm}
	\zhongsong
	\begin{tabular}{cc}
		\zihao{-2} 学院（系）：&\underline{\makebox[7cm][c]{\zihao{-2}\whut@tokens@school}} \\
		\\
		\zihao{-2}专业班级: & \underline{\makebox[7cm][c]{\zihao{-2}\whut@tokens@class}} \\
		\\
		\zihao{-2}学生姓名: & \underline{\makebox[7cm][c]{\zihao{-2}\whut@tokens@author}} \\
		\\
		\zihao{-2}指导教师: & \underline{\makebox[7cm][c]{\zihao{-2}\whut@tokens@supervisor}} \\
		\\
	\end{tabular}
\end{center}
\thispagestyle{empty}
\clearpage

% 学位论文原创性声明 & 学位论文版权使用授权书
\section*{学位论文原创性声明}

本人郑重声明：所呈交的论文是本人在导师的指导下独立进行研究所取得的研
究成果。除了文中特别加以标注引用的内容外，本论文不包括任何其他个人或集体
已经发表或撰写的成果作品。本人完全意识到本声明的法律后果由本人承担。\\
\par
\hfill 作者签名：\hspace{9em}~\par
\hfill 年 \;\;\; 月 \;\;\; 日\hspace{8em}~

\vspace{2.5cm}

\section*{学位论文版权使用授权书}

本学位论文作者完全了解学校有关保障、使用学位论文的规定，同意学校保留
并向有关学位论文管理部门或机构送交论文的复印件和电子版，允许论文被查阅和
借阅。本人授权省级优秀学士论文评选机构将本学位论文的全部或部分内容编入有
关数据进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。

本学位论文属于1、保密$\square$，在 \;\;\;\; 年解密后适用本授权书 \\
\newlength{\whut@length@A}
\settowidth{\whut@length@A}{\indent 本学位论文属于}
\hspace*{\whut@length@A}2、不保密$\square$\;\;。\\
\hspace*{\whut@length@A}（请在以上相应方框内打“$\surd”$）\\
\par
\hfill 作者签名： \hspace{9ex} 年 \hspace{3ex} 月 \hspace{4ex} 日\par
\hfill 导师签名： \hspace{9ex} 年 \hspace{3ex} 月 \hspace{4ex} 日\\
\thispagestyle{empty}
\clearpage
}

\renewenvironment{abstract}{%
	\section*{\pdfbookmark[1]{\whut@cap@zhabstractname}{zhabstract}\whut@cap@zhabstractname}
	\pagenumbering{Roman}
	% \addcontentsline{toc}{section}{\whut@cap@abstractname}
	\quotation
	\pagestyle{plain}
}{%
	\thispagestyle{plain}
	\endquotation
	\clearpage
}

\newenvironment{enabstract}{%
	\section*{\pdfbookmark[1]{\whut@cap@enabstractname}{enabstract}\whut@cap@enabstractname}
	% \addcontentsline{toc}{section}{\whut@cap@enabstractname}
	\quotation
	\pagestyle{plain}
}{%
	\thispagestyle{plain}
	\endquotation
	\clearpage
}

\newenvironment{acknowledgement}{%
	\section*{\whut@cap@acknowledgement}
	\addcontentsline{toc}{section}{\whut@cap@acknowledgement}
	\quotation
}{%
	\endquotation
}

\renewenvironment{quotation}
{\list{}{\listparindent 2em
		\itemindent \listparindent
		\rightmargin\z@
		\leftmargin\z@
		\parsep \z@ \@plus\p@}
	\item\relax}
{\endlist}

%% define toc style
\titlecontents{section}[0pt]{\mdseries}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{subsection}[4ex]{\mdseries}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{subsubsection}[8ex]{\mdseries}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

\numberwithin{equation}{section}
\numberwithin{table}{section}
\numberwithin{figure}{section}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\zihao{5} \whut@cap@titlename}
\fancyfoot[C]{\zihao{5} \thepage}
%\def\headrule{
%	\vspace{0pt}
%	\hrule\@height\headrulewidth \@width\headwidth
%}
\renewcommand{\headrulewidth}{0.65pt}

\fancypagestyle{plain}{%
	\fancyhf{}
%	\fancyhead[C]{\zihao{5} \whut@cap@titlename}
	\fancyfoot[C]{\zihao{5} \thepage}
	\renewcommand{\headrulewidth}{0pt}
}

\setcounter{secnumdepth}{3}

\ctexset{
	section = {
		format = \centering\bfseries\zihao{-2},	%\CTEXifname{\raggedright}{\centering}
		numberformat = \mdseries\sffamily,
		name = {第, 章},
		% fixskip = true,
		% beforeskip = 0.5\baselineskip, % no space between header and title, use `\titlespacing*' above instead
		% afterskip = 0.5\baselineskip,
	},
	subsection = {
		format = \bfseries\zihao{3},
		numberformat = \mdseries\sffamily,
		% fixskip = true,
		% beforeskip = 0.5\baselineskip,
		% afterskip = 0.5\baselineskip,
	},
	subsubsection = {
		format = \bfseries\zihao{4},
		numberformat = \mdseries\sffamily,
		% fixskip = true,
		% beforeskip = 0.5\baselineskip,
		% afterskip = 0.5\baselineskip,
	}
}

\let\@tableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
	\clearpage
	\begingroup
	\pagestyle{plain}
	\pdfbookmark[1]{\whut@cap@contentsname}{contents}
	\@tableofcontents
	% \addcontentsline{toc}{section}{\whut@cap@contentsname}
	\endgroup
	\thispagestyle{plain}
	\clearpage
	% \pagestyle{fancy}
	\pagenumbering{arabic}
	\let\@tableofcontents\relex
}

\RequirePackage{pifont}
\RequirePackage[symbol*,stable]{footmisc}
\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}{\ding{195}}%
	{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}

%% redefine appendix
\let\@appendix\appendix
\renewcommand\appendix{\par
	\@appendix
	\gdef\thesection{\appendixname\@Alph\c@section}
	\gdef\thesubsection{\Alph{section}.\@arabic\c@subsection}
	\gdef\thesubsubsection{\Alph{section}.\arabic{subsection}.\@arabic\c@subsubsection}
	\tikzexternaldisable
	\let\@appendix\relex
}

%% rename caption names
\renewcommand\contentsname{\whut@cap@contentsname}
\renewcommand\listfigurename{\whut@cap@listfigurename}
\renewcommand\listtablename{\whut@cap@listtablename}
%\renewcommand\refname{\whut@cap@refname}
\renewcommand\indexname{\whut@cap@indexname}
\renewcommand\figurename{\whut@cap@figurename}
\renewcommand\tablename{\whut@cap@tablename}
\renewcommand\appendixname{\whut@cap@appendixname}
% \renewcommand\abstractname{\whut@cap@abstractname}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% define commands

\renewcommand*\title[1]{\renewcommand{\whut@tokens@title}{#1}\hypersetup{pdftitle={#1}}}
\newcommand*\school[1]{\renewcommand{\whut@tokens@school}{#1}}
\newcommand*\class[1]{\renewcommand{\whut@tokens@class}{#1}}
\renewcommand*\author[1]{\renewcommand{\whut@tokens@author}{#1}\hypersetup{pdfauthor={#1}}}
\newcommand*\supervisor[1]{\renewcommand{\whut@tokens@supervisor}{#1}}

%% define keywords & enkeywords
\newcommand\keywords[1]{%
	\vspace{\baselineskip}
	{\noindent\zihao{4}\bfseries\whut@cap@keywordsname：}~{\zihao{-4} #1}
	\hypersetup{pdfkeywords={#1}}
}
\newcommand\enkeywords[1]{%
	\vspace{\baselineskip}
	{\noindent\zihao{4}\bfseries\whut@cap@enkeywordsname：}~{\zihao{-4} #1}
}

%% define bibliography printing
\ifwhut@options@nobib\else
\renewcommand{\refname}{\whut@cap@refname}
\defbibheading{bibliography}[\refname]{%
	\clearpage%
	\phantomsection%
	\addcontentsline{toc}{section}{\whut@cap@refname}%
	\section*{#1}%
}
\renewcommand{\bibfont}{\zihao{5}}
\providecommand{\references}{%
	\ClassWarning{whut-bachelor}{Command `\noexpand\references' is obsoleted, use `\noexpand\printbibliography' directly.}
	\printbibliography

}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% define enviroments

\ifwhut@options@minimal\else
\newtheorem{conjecture}{\whut@cap@conjecture}
\newtheorem{proposition}{\whut@cap@proposition}
\newtheorem{assumption}{\whut@cap@assumption}
\newtheorem{definition}{\whut@cap@definition}
\newtheorem{axiom}{\whut@cap@axiom}
\newtheorem{lemma}{\whut@cap@lemma}
\newtheorem{theorem}{\whut@cap@theorem}
\newtheorem{principle}{\whut@cap@principle}
\newtheorem{conclusion}{\whut@cap@conclusion}
\newtheorem{corollary}{\whut@cap@corollary}
\newtheorem{example}{\whut@cap@example}
\newtheorem{solution}{\whut@cap@solution}
\newtheorem{proof}{\whut@cap@proof}
\newtheorem{property}{\whut@cap@property}
\newtheorem{remark}{\whut@cap@remark}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% define constants

\newcommand*{\whut@cap@zhabstractname}{摘~~要}
\newcommand*{\whut@cap@enabstractname}{Abstract}
\newcommand*{\whut@cap@keywordsname}{关键词}
\newcommand*{\whut@cap@enkeywordsname}{Key Words}
\newcommand*{\whut@cap@titlename}{武汉理工大学毕业设计（论文）}
\newcommand*{\whut@cap@contentsname}{目~~录}
\newcommand*{\whut@cap@listfigurename}{插图清单}
\newcommand*{\whut@cap@listtablename}{附表清单}
\newcommand*{\whut@cap@refname}{参考文献}
\newcommand*{\whut@cap@indexname}{索引}
\newcommand*{\whut@cap@figurename}{图}
\newcommand*{\whut@cap@tablename}{表}
\newcommand*{\whut@cap@appendixname}{附录}
\newcommand*{\whut@cap@acknowledgement}{致~~谢}

\newcommand*{\whut@cap@conjecture}{猜想}
\newcommand*{\whut@cap@proposition}{命题}
\newcommand*{\whut@cap@assumption}{假设}
\newcommand*{\whut@cap@definition}{定义}
\newcommand*{\whut@cap@axiom}{公理}
\newcommand*{\whut@cap@lemma}{引理}
\newcommand*{\whut@cap@theorem}{定理}
\newcommand*{\whut@cap@principle}{定律}
\newcommand*{\whut@cap@conclusion}{结论}
\newcommand*{\whut@cap@corollary}{推论}
\newcommand*{\whut@cap@example}{例}
\newcommand*{\whut@cap@solution}{解}
\newcommand*{\whut@cap@proof}{证明}
\newcommand*{\whut@cap@property}{性质}
\newcommand*{\whut@cap@remark}{注解}

\endinput