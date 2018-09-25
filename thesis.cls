\LoadClass[a4paper,12pt,oneside,parskip=half,chapterprefix]{book}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2018/09/25 Thesis Class]

%% Language
\RequirePackage[ngerman]{babel}
\RequirePackage[utf8]{inputenc}

%% Default values
\newcommand{\hexchaptercolor}{4BA3CC}
\newcommand{\titlegerman}{German title}
\newcommand{\titleenglish}{English title}
\newcommand{\university}{Universität Konstanz}
\newcommand{\chair}{Chair of Computer Graphics and Media Design}
\newcommand{\department}{Department of Computer Science}
\newcommand{\thesistype}{Master Thesis}
\newcommand{\desireddegree}{Master of Science (M.Sc.)}
\newcommand{\submissiondate}{\today}
\newcommand{\studentid}{01/133337}
\newcommand{\name}{Max Mustermann}
\newcommand{\location}{Konstanz}
\newcommand{\firstadvisor}{Prof.~Dr.~Oliver Deussen}
\newcommand{\secondadvisor}{Prof.~Dr.~Second Advisor}
\newcommand{\fieldofstudy}{Computer Science}
\newcommand{\focus}{Computer Graphics}
\newcommand{\titleaffidavit}{Selbstständigkeitserklärung}

\title{\titlegerman}
\author{\name}
\date{\submissiondate}

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
{\definecolor{chaptercolor}{HTML}{\hexchaptercolor}\color{chaptercolor}\bfseries\Huge}%
{\hfill \MakeUppercase{\large Chapter}\rlap{\enskip\resizebox{!}{1.2cm}{\thechapter}\rule{15cm}{1.22cm}}}%
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
{\bfseries\university}\vskip 0.5cm%
{\chair\par\department}\vskip 1cm%
{\huge\bfseries\thesistype}\vskip 1cm%
{\large\bfseries\titleenglish}\vskip 0.5cm%
{\large\bfseries\titlegerman}\vskip 1.0cm%
{\small\itshape for obtaining the academic degree}\vskip 0.1cm%
{\small\desireddegree}\vskip 1cm%

\begin{tabular}{p{5.5cm}l}%
\textbf{Field of study}: & \fieldofstudy \\%
\textbf{Focus}: & \focus \\%
\end{tabular}\vskip 1cm%

{by}\vskip 0.2cm%
{\large\bfseries \name}\vskip 0.2cm%
(\studentid)\vskip 1.2cm%

\begin{tabular}{p{5.5cm}l}
First advisor: & \firstadvisor \\
Second advisor: & \secondadvisor \\
\end{tabular}%
\vfill%
\location, \submissiondate%
\end{center}%
\newpage%
}

\newcommand{\makeaffidavit}{% This is the affidavit of the thesis
\chapter*{Selbstständigkeitserklärung}%
\noindent Ich versichere hiermit, dass%

\begin{itemize}%
\item die vorliegende Arbeit selbstständig von mir verfasst wurde und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt wurden;%
\item aus fremden Quellen entnommene Passagen, Illustrationen und/oder Gedanken (inklusive elektronischer Hilfsmittel) ausnahmslos als solche kenntlich gemacht worden sind.%
\end{itemize}

\noindent Bedanken möchte ich mich bei Professor Dr. Oliver Deussen und meinem Betreuer Thomas Lindemeier für ihre Unterstützung und Beratung.%
\vskip 1.0cm
\noindent\location, \submissiondate
\vskip 1.2cm
\noindent\name
}