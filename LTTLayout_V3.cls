\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LTTLayout}[2014/11/01 F.Huber]
\typeout{LTTLayout.CLS 2014/11/01 F.Huber}

% Original von J. Kaminski, M. Knauer
% Änderungen und Erweiterungen durch F. Huber
%
% Thanks for looking at my sourcecode!
% This class file was prepared by:
% Franz Huber
% Franz.Huber@ltt.uni-erlangen.de 








% ---------------------------------------------------------------------------
% Definitions
% ---------------------------------------------------------------------------

\usepackage{graphicx}
\usepackage{epstopdf}
\def\scr@theorem{}
\def\scr@corollary{}
\def\scr@definition{}
\def\scr@lemma{}
\def\scr@algorithm{}
\def\scr@proof{}
\def\scr@proofsketch{}
\def\scr@example{}
\def\scr@remark{}
\def\scr@given{}
\def\scr@find{}

\def\scr@lecture{}
\def\scr@by{}
\def\scr@scriptby{}

\def\scr@defaultgraphicsext{eps}
\def\scr@bildverzeichnis{images}

% predefined words (German)
\DeclareOption{german}{%
\def\scr@theorem{Satz}
\def\scr@corollary{Folgerung}
\def\scr@definition{Definition}
\def\scr@lemma{Lemma}
\def\scr@algorithm{Algorithmus}
\def\scr@proof{Beweis:}
\def\scr@proofsketch{Beweis-Skizze:}
\def\scr@example{Beispiel:}
\def\scr@remark{Bemerkung:}
\def\scr@given{Gegeben:}
\def\scr@find{Gesucht:}
\def\scr@lecture{Vorlesung~im}
\def\scr@by{von}
\def\scr@scriptby{Skript~von}
}

% predefined words (English)
\DeclareOption{english}{%
\def\scr@theorem{Theorem}
\def\scr@corollary{Corollary}
\def\scr@definition{Definition}
\def\scr@lemma{Lemma}
\def\scr@algorithm{Algorithm}
\def\scr@proof{Proof}
\def\scr@proofsketch{Sketch~of~proof}
\def\scr@example{Example}
\def\scr@remark{Remark}
\def\scr@given{Given:}
\def\scr@find{Find:}
\def\scr@lecture{Lecture~in}
\def\scr@by{by}
\def\scr@scriptby{Script~by}
}

\DeclareOption{pdf}{%
\def\scr@defaultgraphicsext{pdf}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}

\ExecuteOptions{german}
\ProcessOptions\relax

%\LoadClass[a5paper,smallheadings]{scrbook}
\LoadClass[]{scrbook}

\usepackage{xcolor}
\RequirePackage{latexsym}
\RequirePackage{amsmath}
\RequirePackage{theorem}
\RequirePackage{eucal}
\RequirePackage{calc}
\RequirePackage{ifthen}

% language support (only for german version)
\RequirePackage[german]{babel}
\RequirePackage[latin1]{inputenc}

% encoding schemes
\RequirePackage{type1ec}
\RequirePackage[T1]{fontenc}

%Besserer Anhang
\RequirePackage{appendix}
\renewcommand{\appendixname}{Anhang} %Deutscher name
\renewcommand{\appendixpagename}{Anhang} %dito fuer die xtra seite
\renewcommand{\appendixtocname}{Anhang} %dito fuer den toc eintrag

\allowdisplaybreaks[1]

% text formatting
\RequirePackage{fancyhdr}
\RequirePackage{array}
\RequirePackage{float}
\RequirePackage[small]{caption}

\RequirePackage{textcomp}
\newcommand{\micron}{\ensuremath{\,\mbox{\textmu m}}}
\newcommand{\mm}{\ensuremath{\,\mbox{mm}}}
\newcommand{\m}{\ensuremath{\,\mbox{m}}}



% zeilenabstand
\RequirePackage{setspace}

% mathematical add-ons
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{exscale}

% for typesetting pseudo code:
\RequirePackage{algorithmic}

% graphics
\RequirePackage{graphicx}

% bibtex german
\RequirePackage{babel}
%\RequirePackage{bibgerm}

% basic layout
% setup page: Abstand zur "Buchinnenseite" beim Binden wird über den Wert \typearea [xy cm] festgelegt. {wz}-Wert verändert Größe der Box
\addtolength{\voffset}{10mm}
\KOMAoptions{DIV=14, BCOR=12mm} 

% Bildbeschriftungen, Titel und Text kursiv
\usepackage[ labelfont=normal,font=normal]{caption}



% ---------------------------------------------------------------------------
% Mathematics
% ---------------------------------------------------------------------------

% typeset vectors (points) as bold letters
\newcommand{\ve}[1]{\ensuremath{\mathbf{#1}}}
% different vector format (with arrow)
\newcommand{\Ve}[1]{\ensuremath{\vec{#1}}}
% typeset matrices as bold letters
\newcommand{\ma}[1]{\ensuremath{\mathop{\mathbf{#1}}\nolimits}}
% this symbol is used for the identical mapping
\newcommand{\ident}{\ensuremath{\mathbf{I}}}

% the inner product (the notation \skalar is used only for
% compatibility purposes)
%\newcommand{\inner}[2]{\ensuremath{\mathord{\left\langle\left.\ve{#1}\right|\ve{#2\right\rangle}}}
%\newcommand{\inner}[2]{\ensuremath{\mathord{\ve{#1}\!\cdot\!\ve{#2}}}}
\newcommand{\inner}[2]{\ensuremath{\mathord{\left\langle{#1}|{#2}\right\rangle}}}
\newcommand{\skalar}[2]{\inner{#1}{#2}}

% cross product
\newcommand{\cross}[2]{\ensuremath{\mathord{{#1}\!\times\!{#2}}}}

% parenthese-like environments
\newcommand{\abs}[1]{\ensuremath{\mathord{\left|{#1}\right|}}}
\newcommand{\norm}[1]{\ensuremath{\mathord{\left\|{#1}\right\|}}}
\newcommand{\set}[1]{\ensuremath{\mathord{\left\{{#1}\right\}}}}
\newcommand{\interval}[1]{\ensuremath{\mathord{\left[{#1}\right]}}}
% This is to prevent AUCTeX and ChkTeX from puzzling about mismatched parenthesis
\newcommand{\intervalopen}[1]{\ensuremath{\mathord{\left({#1}\right)}}}
\newcommand{\intervalopenleft}[1]{\ensuremath{\mathord{\left({#1}\right]}}}
\newcommand{\intervalopenright}[1]{\ensuremath{\mathord{\left[{#1}\right)}}}

% differential quotient
\newcommand{\dif}[2]{\ensuremath{\frac{\mathrm{d}{#1}}{\mathrm{d}{#2}}}}
% partial
\newcommand{\pdif}[2]{\ensuremath{\frac{\partial{#1}}{\partial{#2}}}}
% partial2
\newcommand{\ppdif}[3]{\ensuremath{\frac{\partial^2{#1}}{\partial{#2}\,\partial{#3}}}}

% symbol for orthogonality
\newcommand{\ortho}{\mathbin{\bot}}
% support
\newcommand{\supp}{\operatorname{supp}}
% span
\newcommand{\Span}[1]{\operatorname{span}\set{#1}}
%\newcommand{\Span}[1]{\left\langle{#1}\right\rangle}

% area
\newcommand{\area}{\operatorname{area}}

% div, grad, rot
\newcommand{\Div}{\operatorname{div}}
\newcommand{\Grad}{\operatorname{\mathbf{grad}}}
\newcommand{\Rot}{\operatorname{\mathbf{rot}}}

% "if and only if"
\newcommand{\iif}{\ensuremath{\mathrel{\;\Leftrightarrow\;}}}
% defined as "if and only if"
\newcommand{\diif}{\ensuremath{\mathrel{\;:\Leftrightarrow\;}}}
% corollary
\newcommand{\follows}{\ensuremath{\mathrel{\;\Rightarrow\;}}}
% mapping arrow
\newcommand{\mapping}{\ensuremath{\mathrel{\rightarrow}}}

% O(n) notation (use Euler calligraphy font if possible)
\newcommand{\bigoh}{\ensuremath{\mathcal{O}}}
% use script phi instead of printed phi
\renewcommand{\phi}{\varphi}
% also with epsilon and theta
\renewcommand{\epsilon}{\varepsilon}
%\renewcommand{\theta}{\vartheta}

% use blackboard notation for commonly used sets
\newcommand{\N}{\ensuremath{\mathbb{N}}}
\newcommand{\Z}{\ensuremath{\mathbb{Z}}}
\newcommand{\Q}{\ensuremath{\mathbb{Q}}}
\newcommand{\R}{\ensuremath{\mathbb{R}}}
\newcommand{\C}{\ensuremath{\mathbb{C}}}

% symbol used to mark the end of a proof
\newcommand{\proofend}{\hfill\ensuremath{\Box}}
% symbol used to mark the end of an example
\newcommand{\examend}{\hfill\ensuremath{\Diamond}}

% shortcut for displaystyle in inline maths
\newcommand{\ds}{\displaystyle}

% input of subscripts "x_1...x_n"
\newcommand{\subscripts}[3]{\ensuremath{{#1}_{#2},\ldots,{#1}_{#3}}}
% input of superscripts "x^1...x^n"
\newcommand{\superscripts}[3]{\ensuremath{{#1}^{#2},\ldots,{#1}^{#3}}}
% input of ranges "i=1...n"
\newcommand{\fromto}[3]{\ensuremath{{#1}={#2},\ldots,{#3}}}

% input of column vectors (pairs and triples)
% This uses amsmath pmatrix environment
\newcommand{\Pair}[2]{\ensuremath{\begin{pmatrix}{#1}\\{#2}\end{pmatrix}}}
\newcommand{\Triple}[3]{\ensuremath{\begin{pmatrix}{#1}\\{#2}\\{#3}\end{pmatrix}}}
\newcommand{\HomP}[3]{\ensuremath{\begin{pmatrix}{#1}\\{#2}\\{#3}\\{1}\end{pmatrix}}}
\newcommand{\HomV}[3]{\ensuremath{\begin{pmatrix}{#1}\\{#2}\\{#3}\\{0}\end{pmatrix}}}
\newcommand{\TwoByTwo}[4]{\ensuremath{\begin{pmatrix}{#1}&{#2}\\{#3}&{#4}\end{pmatrix}}}

% underbracket
\newcommand{\underbracket}[1]%
{\mathop{\vtop{\m@th\ialign{##\crcr%
$\hfil\displaystyle{#1}\hfil$\crcr%
\noalign{\kern3\p@\nointerlineskip}%
\upbracketfill\crcr\noalign{\kern3\p@}}}}\limits}
\newcommand{\upbracketfill}
{\rule{0.8pt}{1ex}%
\leaders\vrule height0.8pt \hfill%
\rule{0.8pt}{1ex}}

% slanted fracture notation
\newcommand{\slfrac}[2]{%
\kern-.05em\raise.5ex\hbox{\the\scriptfont0 {#1}}%
\kern-.15em/\kern-.15em\lower.25ex\hbox{\the\scriptfont0 {#2}}}

% 1/2 in slanted notation
\newcommand{\half}{\ensuremath{\slfrac{1}{2}}}
% 1/2 in upright notation
\newcommand{\Half}{\ensuremath{\frac{1}{2}}}


% set up new theorems
\theoremstyle{break}
\theoremheaderfont{\normalfont\bfseries}
\theorembodyfont{\upshape}
\newtheorem{Thm}{\scr@theorem}[chapter]
\newtheorem{Cor}{\scr@corollary}[chapter]
\newtheorem{Def}{\scr@definition}[chapter]
\newtheorem{Lem}{\scr@lemma}[chapter]
\newtheorem{Alg}{\scr@algorithm}[chapter]

% proof environment
\newenvironment{Proof}%
{\begin{sloppypar}{\bf\scr@proof }}%
{\proofend\end{sloppypar}\vspace{\baselineskip}\par}

% sketch of proof environment
\newenvironment{Proofsketch}%
{\begin{sloppypar}{\bf\scr@proofsketch }}%
{\proofend\end{sloppypar}\vspace{\baselineskip}\par}

% remark environment
\newenvironment{Rem}%
{\begin{sloppypar}\small{\em\scr@remark}}%
{\end{sloppypar}\vspace{\baselineskip}\par}

% example environment
\newenvironment{Exa}%
{\renewcommand{\labelitemi}{}%
\begin{sloppypar}{\bf\scr@example}}%
{\examend\end{sloppypar}\vspace{\baselineskip}\par}

% textual shortcuts
\newcommand{\given}{\textbf{\scr@given}~}
\newcommand{\find}{\textbf{\scr@find}~}

% integral 
\newcommand{\integral}[4]
{\ensuremath{\mathop{\int\limits_{#1}^{#2}\!#3\,\mathrm{d}{#4}}}}

% sum
\newcommand{\Sum}[2]
{\ensuremath{\mathop{\sum\limits_{#1}^{#2}~}}}

% Fourier transform
\newcommand{\fourier}[1]
{\ensuremath{\operatorname{\mathfrak{F}}\!\left\{#1\right\}}}
\newcommand{\inversefourier}[1]
{\ensuremath{\operatorname{\mathfrak{F}^{-1}}\!\left\{#1\right\}}}

\newcommand{\map}[3]
{\ensuremath{\mathord{{#1}\!: {#2}\longmapsto{#3}}}}
\newcommand{\Map}[3]
{\map{\ve{#1}}{#2}{#3}}

\newcommand{\Koord}[2]
{\ensuremath{{#1}_{#2}}}

\newcommand{\pmstart}[0]
{\ensuremath{\begin{pmatrix}}}

\newcommand{\pmend}[0]
{\ensuremath{\end{pmatrix}}}





% ---------------------------------------------------------------------------
% Graphics
% ---------------------------------------------------------------------------


% some shortcuts for including eps graphics

\newcommand{\imagedir}[1]{\renewcommand{\scr@bildverzeichnis}{#1}}

\newcommand{\eps}[1]{\includegraphics{\scr@bildverzeichnis/#1.\scr@defaultgraphicsext}}
\newcommand{\epswidth}[2]{\includegraphics[width=#2]{\scr@bildverzeichnis/#1.\scr@defaultgraphicsext}}
\newcommand{\epsheight}[2]{\includegraphics[height=#2]{\scr@bildverzeichnis/#1.\scr@defaultgraphicsext}}

\newcommand{\epsdummy}[1]{\eps{#1}}

%\newcommand{\Picture}[1]{\begin{figure}[!htbp]%
%\centering\epsdummy{#1}%
%\end{figure}}

%\newcommand{\PictureCaption}[2]{\begin{figure}[!htbp]%
%\centering\epsdummy{#1}\caption{#2}\label{fig:#1}%
%\end{figure}}

%\newcommand{\PictureCaptionWidth}[3]{\begin{figure}[!htbp]%
%\centering\epswidth{#1}{#3}\caption{#2}\label{fig:#1}%
%\end{figure}}


%\newcommand{\TwoPictures}[4][1cm]{\begin{figure}[!htbp]%
%\centering\epsdummy{#2}\hspace{#1}\epsdummy{#3}\caption{#4}\label{fig:#2}%
%\end{figure}}



\newcommand{\PictureCaptionWidth}[4]
{
   	\begin{figure}
	[!htbp]
	\centering
	\epswidth{#1}{#4}
	\caption[#2]{#3}
	\label{fig:#1}
	\end{figure}
}

\newcommand{\PictureCaptionHeight}[4]
{
	\begin{figure}
	[!htbp]
	\centering
	\epsheight{#1}{#4}
	\caption[#2]{#3}
	\label{fig:#1}
	\end{figure}
}



\newcommand{\TwoPicturesWidth}[6]
{
	\begin{figure}
	[!htbp]
	\centering
	\epswidth{#1}{#6}
	\hspace{#5}
	\epswidth{#2}{#6}
	\caption[#3]{#4}
	\label{fig:#1}
	\end{figure}
}


\newcommand{\TwoPicturesHeight}[6]
{
	\begin{figure}
	[!htbp]
	\centering
	\epsheight{#1}{#6}
	\hspace{#5}
	\epsheight{#2}{#6}
	\caption[#3]{#4}
	\label{fig:#1}
	\end{figure}
}


\newcommand{\ThreePicturesWidth}[7]
{
	\begin{figure}
	[!htbp]
	\centering
	\epswidth{#1}{#7}
	\hspace{#6}
	\epswidth{#2}{#7}
	\hspace{#6}
	\epswidth{#3}{#7}
	\caption[#4]{#5}
	\label{fig:#1}
	\end{figure}
}


\newcommand{\ThreePicturesHeight}[7]
{
	\begin{figure}
	[!htbp]
	\centering
	\epsheight{#1}{#7}
	\hspace{#6}
	\epsheight{#2}{#7}
	\hspace{#6}
	\epsheight{#3}{#7}
	\caption[#4]{#5}
	\label{fig:#1}
	\end{figure}
}


\newcommand{\TwoPicturesBoxWidth}[6]
{
	\begin{figure}
	[!htbp]
	\centering
	\epswidth{#1}{#6}\\
	\vspace{#5}
	\centering
	\epswidth{#2}{#6}
	\caption[#3]{#4}
	\label{fig:#1}
	\end{figure}
}

\newcommand{\TwoPicturesBoxHeight}[6]
{
	\begin{figure}
	[!htbp]
	\centering
	\epsheight{#1}{#6}\\
	\vspace{#5}
	\centering
	\epsheight{#2}{#6}
	\caption[#3]{#4}
	\label{fig:#1}
	\end{figure}
}


\newcommand{\FourPicturesBoxWidth}[8]
{
	\begin{figure}
	[!htbp]
	\centering
	\epswidth{#1}{#8}
	\hspace{#7}
	\epswidth{#2}{#8}\\
	\vspace{#7}
	\centering
	\epswidth{#3}{#8}
	\hspace{#7}
	\epswidth{#4}{#8}
	\caption[#5]{#6}
	\label{fig:#1}
	\end{figure}
}


\newcommand{\FourPicturesBoxHeight}[8]
{
	\begin{figure}
	[!htbp]
	\centering
	\epsheight{#1}{#8}
	\hspace{#7}
	\epsheight{#2}{#8}\\
	\vspace{#7}
	\centering
	\epsheight{#3}{#8}
	\hspace{#7}
	\epsheight{#4}{#8}
	\caption[#5]{#6}
	\label{fig:#1}
	\end{figure}
}


% additional shortcuts for floats that do not float
\newcommand{\PicNoFloat}[1]{\begin{figure}[H]%
\centering\epsdummy{#1}%
\end{figure}}
\newcommand{\PicNoFloatCaption}[2]{\begin{figure}[H]%
\centering\epsdummy{#1}\caption{#2}\label{fig:#1}%
\end{figure}}







% ---------------------------------------------------------------------------
% Text and Layout
% ---------------------------------------------------------------------------

% no paragraph indentation
\setlength{\parindent}{0pt}

% tolerances for vboxes (as suggested in the LaTeX Companion)
\tolerance=2000
\emergencystretch=20pt

% new line
\newcommand{\nl}{\\[.4\baselineskip]}

% fine-tuning for tables
\newcommand{\rb}[1]{\raisebox{1.5ex}[-1.5ex]{#1}}

% put enumerations in parenthesis
\renewcommand{\labelenumi}{(\theenumi)}
\renewcommand{\labelenumii}{(\theenumii)}

% use dashes instead of bullets in itemize-environment
\renewcommand{\labelitemi}{\bfseries --}

% set up some fancy headers (using fancyhdr)

\fancypagestyle{plain}{%
\fancyhf{}%
\fancyhead[LE]{\thepage}%
\fancyhead[RO]{\thepage}}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}{}}
\fancyhead[RE]{\slshape\leftmark}
\fancyhead[LO]{\slshape\rightmark}
\fancyhead[LE]{\thepage}
\fancyhead[RO]{\thepage}

% allow figures to fill a large percentage of the page without
% creating a separate figure page.
\renewcommand{\topfraction}{0.999}
\renewcommand{\textfraction}{0.2} %here
\setcounter{topnumber}{10}
\setcounter{dbltopnumber}{10}
\setcounter{totalnumber}{10}
\renewcommand{\dbltopfraction}{0.999}
\renewcommand{\dblfloatpagefraction}{0.999}


% redefine bibliography from report.cls to add a table of
% contents entry
\def\thebibliography#1{\chapter*{\bibname\@mkboth
  {\bibname}{\bibname}}\addcontentsline{toc}{chapter}{\bibname}\list
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist

% ---------------------------------------------------------------------------
% Titlepage
% ---------------------------------------------------------------------------

\newcommand{\diss@title}{(title)}
\newcommand{\diss@author}{(author)}
\newcommand{\diss@faculty}{(faculty)}
\newcommand{\diss@discipline}{(discipline)}
\newcommand{\diss@authorbirthplace}{(birthplace)}
\newcommand{\diss@chairman}{(chairman)}
\newcommand{\diss@firstreferee}{(first referee)}
\newcommand{\diss@secondreferee}{(second referee)}
\newcommand{\diss@examdate}{(examdate)}

\newcommand{\thesistitle}[1]{\renewcommand{\diss@title}{#1}}
\newcommand{\thesisauthor}[1]{\renewcommand{\diss@author}{#1}}
\newcommand{\thesisfaculty}[1]{\renewcommand{\diss@faculty}{#1}}
\newcommand{\thesisdiscipline}[1]{\renewcommand{\diss@discipline}{#1}}
\newcommand{\thesisbirthplace}[1]{\renewcommand{\diss@authorbirthplace}{#1}}
\newcommand{\thesischairman}[1]{\renewcommand{\diss@chairman}{#1}}
\newcommand{\thesisfirstreferee}[1]{\renewcommand{\diss@firstreferee}{#1}}
\newcommand{\thesissecondreferee}[1]{\renewcommand{\diss@secondreferee}{#1}}
\newcommand{\thesisexamdate}[1]{\renewcommand{\diss@examdate}{#1}}


\newcommand{\makedisstitlepage}%
{
\thispagestyle{empty}
{
\sffamily
%Erstelldatum: \today
\setlength{\baselineskip}{2em}
\begin{center}
	\vspace*{0.5cm}
	\begin{huge}	
		{{\sffamily\diss@title}\\}	
	\end{huge}
\doublespacing
	\begin{Large}
		{\vspace{1.0cm}\diss@faculty\\
		der Friedrich-Alexander-Universit\"at \\ Erlangen-N\"urnberg\\ 
		\vspace{1cm}
		zur Erlangung des Doktorgrades Dr.-Ing.\\
		\vspace{2cm} 
		vorgelegt von\\ 
		\vspace{1cm} 
		\diss@author\\
		\vspace{0.3cm} 
		aus \diss@authorbirthplace}
	\end{Large}
\end{center}}   	

\singlespacing	
\newpage
\thispagestyle{empty}
\vspace*{7cm}

\vfill 
\begin{large}
  \begin{center}
  \doublespacing
 	{Als Dissertation genehmigt von der\\ 
 	Technischen Fakult\"at der Universit\"at Erlangen-N\"urnberg}
  \end{center}
  \vspace{1cm}

  \begin{tabbing}
  Vorsitzender des Pr\"ufungskommission: \quad\= \kill
  Tag der m\"undlichen Pr\"ufung:\> \diss@examdate\\[2ex]
  Vorsitzender des Promotionsorgans:\> \diss@chairman\\[2ex]
  Gutachter:\> \diss@firstreferee\\[2ex]
  Gutachter:\> \diss@secondreferee
  \end{tabbing}
\end{large}
\newpage
\thispagestyle{empty}
\vspace*{5cm} 
}

\newcommand{\makedipltitlepage}%
{
\thispagestyle{empty}
{
	\sffamily
	%Erstelldatum: \today
	\setlength{\baselineskip}{2em}
	\begin{center}
	\vspace*{1cm}
	{	\LARGE{\bf\sffamily\diss@title}\\		
		\bigskip\bigskip}
	{	\Large\vspace{3cm}Diplomarbeit im Fach~\diss@discipline\\ 
	\vspace*{1cm} 
	vorgelegt von\\
	\vspace*{1cm}
	{\Large\diss@author}\\
	\vspace*{1cm}
	Abgabedatum:~\diss@examdate\vspace{3cm}}\\
	\vfill
	\begin{minipage}{10cm}
	{\Large\begin{tabbing}
	Betreuer:~\quad\= \kill
	Pr\"ufer:~\>\diss@chairman\\[2ex]
	Betreuer:~\>\diss@firstreferee\\[2ex]
	\>\diss@secondreferee
	\end{tabbing}}
	\end{minipage}\\
	\vspace*{2cm}
	OSMIN - Optical Sensing, Metrology and Inspection\\
	Institut f�r Optik, Information und Photonik\\
	Friedrich-Alexander-Universit\"at Erlangen-N\"urnberg
	\end{center}}
	
\newpage
\thispagestyle{empty}
\vspace*{5cm} 
}

\endinput


%%% Local Variables: 
%%% mode: latex
%%% TeX-master: t
%%% End: 