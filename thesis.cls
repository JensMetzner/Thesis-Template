\LoadClass[a4paper,12pt,oneside]{book}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2018/09/25 Thesis Class]

%% Language
\RequirePackage[ngerman,english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{csquotes}
% Makro for \english{} \german{}
\makeatletter
\newcommand{\declarelanguage}{\@dblarg\@declarelanguage}
\def\@declarelanguage[#1]#2{%
  \long\@namedef{#2}{%
    \edef\@temp{\string#1}%
    \ifx\@temp\languagename
      \expandafter\@firstofone
    \else
      \expandafter\@gobble
    \fi%
  }%
}
\makeatother
\declarelanguage{english}
\declarelanguage[ngerman]{german}
\RequirePackage{libertine}
\RequirePackage{libertinust1math}
\RequirePackage[T1]{fontenc}

%% Default values
\RequirePackage{titling}
\makeatletter
\newcommand*\DefVariable[1]{\@namedef{#1}##1{\global\@namedef{has#1}{##1}\@namedef{the#1}{##1}}\@nameuse{#1}{}}
\makeatother

\DefVariable{hexchaptercolor}
\DefVariable{translatedtitle}
\DefVariable{university}
\DefVariable{chair}
\DefVariable{department}
\DefVariable{thesistype}
\DefVariable{desireddegree}
\DefVariable{studentid}
\DefVariable{location}
\DefVariable{firstevaluator}
\DefVariable{secondevaluator}
\DefVariable{advisor}
\DefVariable{fieldofstudy}
\DefVariable{focus}
\DefVariable{acknowledgments}
\hexchaptercolor{4BA3CC}

%% Math stuff
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}

%% Bib
\RequirePackage[
backend=biber,
natbib=true,
style=numeric,
sorting=nyt,
sortcites=true,
citestyle=numeric,
defernumbers=true,
isbn=true,
url=false,
doi=true,
uniquename=init,
maxbibnames=99,
eprint=false
]{biblatex}

\DefineBibliographyStrings{ngerman}{
   andothers = {{et\,al\adddot}},
}
\renewcommand*{\bibfont}{\footnotesize}

\AtEveryBibitem{
    \clearlist{address}
    \clearlist{location}
    \clearfield{series}
    \ifentrytype{book}{}{
        \clearlist{publisher}
        \clearfield{issn}
        \clearfield{isbn}
        \clearname{editor}
        \clearfield{month}
        \clearfield{day}
    }
}

%% Image
\RequirePackage{graphicx}
\RequirePackage{subfig}
\RequirePackage{float}
\RequirePackage{tikz}
\RequirePackage{pdfpages}
\RequirePackage[export]{adjustbox}

%% Text
\RequirePackage{footnote}
\RequirePackage{url}
\RequirePackage{color}
\RequirePackage{enumitem}
\RequirePackage{setspace}
\RequirePackage{blindtext}
\RequirePackage[font={small,it}]{caption}
\RequirePackage{hyperref}

%% Code
\RequirePackage[chapter]{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{listings}
% \renewcommand*\ttdefault{lmvtt} % For beautiful font
\lstset{
    language=C++,
    basicstyle=\ttfamily\color{gray},
    keywordstyle=\color{blue}\ttfamily,
    stringstyle=\color{red}\ttfamily,
    commentstyle=\color{green}\ttfamily,
    morecomment=[l][\color{magenta}]{\#}
}

%% Spacing
\RequirePackage{geometry}
\geometry{a4paper, top=32mm, left=35mm, right=27mm, bottom=32mm, headsep=12mm, footskip=14mm}

%% Style
\setcounter{secnumdepth}{2}

\RequirePackage{titlesec} 
\titleformat{\chapter}[display]%
{\definecolor{chaptercolor}{HTML}{\thehexchaptercolor}\color{chaptercolor}\bfseries\Huge}%
{\hfill \MakeUppercase{\large \chaptertitlename}\rlap{\enskip\resizebox{!}{1.2cm}{\thechapter\hspace{0.1cm}}\rule{5cm}{1.20cm}}}%
{1cm}%
{\filleft\bfseries}%
[]
\titleformat*{\section}{\bfseries\Large}
\titleformat*{\subsection}{\bfseries\large}

%% Macros
\newcommand{\eng}[1]{\textit{#1}}
\newcommand{\todo}[1]{{\color{red}\textbf{Todo: }\textit{#1}}}

\newcommand{\makecover}{% This is the cover of the thesis
\thispagestyle{empty}
\begin{center}
\vfill
{\bfseries\theuniversity}\vskip 0.5cm%
{\thechair\par\thedepartment}\vskip 1cm%
{\huge\bfseries\thethesistype}\vskip 1cm%
{\large\bfseries%
\thetitle%
\ifx\hastranslatedtitle\empty\else\vskip 0.5cm\thetranslatedtitle\fi%
}\vskip 1.0cm%
{\small\itshape for obtaining the academic degree}\vskip 0.1cm%
{\small\thedesireddegree}\vskip 1cm%

\begin{tabular}{p{5.5cm}l}%
\textbf{Field of study}: & \thefieldofstudy \\%
\textbf{Focus}: & \thefocus \\%
\end{tabular}\vskip 1cm%

{by}\vskip 0.2cm%
{\large\bfseries\theauthor}\vskip 0.2cm%
(\thestudentid)\vskip 1.2cm%

\begin{tabular}{p{5.5cm}l}
First evaluator: & \thefirstevaluator \\
Second evaluator: & \thesecondevaluator \\
Advisor: & \theadvisor \\
\end{tabular}%
\vfill%
\thelocation, \thedate%
\end{center}%
\newpage%
}

\newcommand{\makeaffidavit}{% This is the affidavit of the thesis
\chapter*{\german{Selbstständigkeitserklärung}\english{Declaration of Authorship}}%
\noindent\german{Ich versichere hiermit, dass}\english{The author of this work hereby declares that}%

\begin{itemize}%
\item %
  \german{die vorliegende Arbeit selbstständig von mir verfasst wurde und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt wurden;}%
  \english{the present work is the result of his own work, without help from others and without using anything other than the named sources and aids;}%
\item %
  \german{aus fremden Quellen entnommene Passagen, Illustrationen und/oder Gedanken (inklusive elektronischer Hilfsmittel) ausnahmslos als solche kenntlich gemacht worden sind.}%
  \english{the texts, illustrations and/or ideas taken directly or indirectly from other sources (including electronic resources) have without exception been acknowledged and have been referenced in accordance with academic standards.}%
\end{itemize}%

\noindent\theacknowledgments%
\vskip 1.0cm
\noindent\thelocation, \thedate
\vskip 1.2cm
\noindent\theauthor
}