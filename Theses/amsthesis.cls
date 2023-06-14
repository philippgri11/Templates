
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%            Identification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amsthesis}[2023/06/14 The AMS Thesis Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%            Class Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}

\newif\iftype@dissertation
\DeclareOption{PhD}{%
	\type@dissertationtrue%
}

\newif\iftype@BA
\DeclareOption{BA}{%
	\type@BAtrue%
}

\newif\iftype@MA
\DeclareOption{MA}{%
	\type@MAtrue%
}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           Main declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper,twoside,openright,numbers=noenddot]{book}

\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage[usenames, dvipsnames]{xcolor}
\RequirePackage{graphicx}

\RequirePackage[utf8]{inputenc}				% Letters like ä ü ö ß
\RequirePackage{epstopdf}					% include of .eps files in pdflatex, requires a ghostscript installation
\RequirePackage[main=english,ngerman]{babel}				% Lineending in english

\RequirePackage{caption,subcaption}			% Subcaption and subfigures 
% Caption formatting
\captionsetup{format=hang,justification=justified,singlelinecheck=false,labelfont={sf,bf}}

\RequirePackage{multirow}					% Table with combined rows and columns

\RequirePackage{microtype}					% Better font typesetting

\RequirePackage{tikz}						% To use TikZ
\usetikzlibrary{calc}

\RequirePackage[hidelinks]{hyperref}		% Avoid highlighting of links

\RequirePackage{texdate}


% Specify page margins
\newlength{\pagemarginleft}
\setlength{\pagemarginleft}{3cm}
\newlength{\pagemarginright}
\setlength{\pagemarginright}{4cm}

\RequirePackage[a4paper,
	left=\pagemarginleft,
	right=\pagemarginright,
	top=2cm,
	bottom=2cm,
	includeheadfoot]{geometry}

\renewcommand{\baselinestretch}{1.2}
\renewcommand{\normalsize}{\fontsize{12pt}{14pt}\selectfont}

% \newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\birthdate}[1]{\def\@birthdate{#1}}
\newcommand{\birthplace}[1]{\def\@birthplace{#1}}

\def\degree#1{\gdef\@degree{#1}}
\def\@birthdate#1{\gdef\@birthdate{#1}}
\def\@birthplace#1{\gdef\@birthplace{#1}}
% \def\@degree{\@latex@warning@no@line{No \noexpand\degree given}}
% \def\@birthdate{\@latex@warning@no@line{No \noexpand\birthdate given}}
% \def\@birthplace{\@latex@warning@no@line{No \noexpand\birthplace given}}
\def\@degree{}
\def\@birthdate{}
\def\@birthplace{}

\def\reviewerA#1{\gdef\@reviewerA{#1}}
\def\reviewerB#1{\gdef\@reviewerB{#1}}
\def\reviewerC#1{\gdef\@reviewerC{#1}}
\def\reviewerD#1{\gdef\@reviewerD{#1}}
\def\@reviewerA{}
\def\@reviewerB{}
\def\@reviewerC{}
\def\@reviewerD{}

\def\thesistype#1{\gdef\@thesistype{#1}}
\iftype@dissertation
	\def\@thesistype{Dissertation}
\else
\iftype@MA
	\def\@thesistype{Master Thesis}
\else
\iftype@BA
	\def\@thesistype{Bachelor Thesis}
\else
	\def\@thesistype{}
\fi\fi\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           Avoiding Widows and Orphans
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\clubpenalty = 5000
\widowpenalty = 5000
\displaywidowpenalty = 3500


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           Page Headers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}					% Formatting of headers
\setlength{\fboxrule}{1pt}
\setlength{\fboxsep}{3mm}

\setlength{\headheight}{14pt}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\if@mainmatter\chaptername~\thechapter.\ \fi#1}{}}
\fancyhead[LE]{\sffamily \leftmark}     			% Chapter in the left on even pages
\fancyhead[RO]{\sffamily \nouppercase{\rightmark}}	% Section in the right on odd pages
\fancyhead[RE]{}					% page number in the right on even pages
\fancyhead[LO]{}					% page number in the left on odd pages
\fancyfoot[OR,EL]{\sffamily \thepage}
\fancyfoot[OC,EC]{}
% \fancyfoot{}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}

%% bring the style into effect
\pagestyle{fancy}

%% now redefine the plain style pages (chapter pages, contents pages)
%% to have the same page number stuff on the bottom
\fancypagestyle{plain}{
	\fancyhf{}
	\fancyfoot[OR]{\sffamily \thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}

%% this next section (till \makeatother) makes sure that blank pages
%% are actually completely blank, cause they're not usually
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
			\hbox{}
			\vspace*{\fill}
			\thispagestyle{empty}
			\newpage
			\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           Chapter Style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{titlesec}

\titleformat{\chapter}[display]
{\normalfont\Large\raggedleft}
{\MakeUppercase{\chaptertitlename}%
	\rlap{ \color{gray!50!black}\resizebox{!}{1.3cm}{\bfseries\thechapter} \rule{5cm}{1.3cm}}}
{10pt}{\Huge}
\titlespacing*{\chapter}{0pt}{30pt}{20pt}


% \titleformat{\chapter}[block]
% {\Large\bfseries}
% {\raisebox{-\height}{\sffamily\scriptsize\MakeUppercase{\chaptertitlename}}%
% 	\space\raisebox{-\height}{\bigchapternumber}\space}
% {0pt}
% {\printtitle}

% \newlength\pretitlewidth
% \newcommand\bigchapternumber{\resizebox{24pt}{!}{\sffamily\bfseries\thechapter}}
% \newcommand{\printtitle}[1]{%
% 	\settowidth{\pretitlewidth}{%
% 		{\sffamily\scriptsize\MakeUppercase{\chaptertitlename}}\space
% 		{\bigchapternumber}\space
% 	}%
% 	\parbox[t]{\dimexpr\textwidth-\pretitlewidth}{%
% 		\linespread{1.5}\selectfont
% 		\hrule depth 0.2pt
% 		\vspace{3ex}
% 		\raggedright\bfseries #1
% 	}%
% }
% \titlespacing*{\chapter}{0pt}{0pt}{40pt}

% \titleformat{\chapter}[display]
% {\bfseries\LARGE}
% {\filleft\hspace*{-60pt}%
% 	\rotatebox[origin=c]{90}{%		
% 		\scshape\color{gray!50!black}	\large\textls[200]{\vspace*{5mm}\scshape\chaptertitlename}%
% 	}\hspace{10pt}%
% 	{\setlength{\fboxsep}{0pt}%
% 		\colorbox{gray!50!black}{\parbox[c][3cm][c]{2.5cm}{%
% 				\centering\color{white}\fontsize{120}{140}\selectfont{\thechapter}}%
% 		}}%
% }
% {10pt}
% {}[{\titlerule[3pt]\vskip2pt\titlerule[1pt]}]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           Citing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Compressed citations (needs to be included before multibib!)
% \RequirePackage{cite}

% Multiple bibliographies
\usepackage[backend=bibtex, defernumbers=true, maxbibnames=99, sorting=none, citestyle=numeric-comp]{biblatex}
\renewcommand*{\bibfont}{\normalfont\small}
\DeclareBibliographyCategory{own}
\DeclareBibliographyCategory{students}

\newcommand{\citeOwn}[1]{%
	\cite{#1}%
    \addtocategory{own}{#1}%
}

\newcommand{\citeStudent}[1]{%
	\cite{#1}%
	\addtocategory{students}{#1}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           Title Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{
\thispagestyle{empty}%
\newgeometry{margin=2.5cm,top=-1.5cm}%top=-2.1cm
{%
\parindent0pt%\baselinestretch1.0%
\begin{center}
	\includegraphics[width=9.2cm]{figures/logos/OVGU.pdf}
\end{center}
\sffamily%

\vspace*{-1.8cm}%

{\LARGE \@title}%

\vspace*{3.5cm}%

{\bfseries DISSERTATION}

\vspace*{0.7cm}

\Large zur Erlangung des akademischen Grades

\vspace*{0.7cm}

Doktoringenieur (Dr.-Ing.)

\vspace*{1.5cm}

angenommen durch die Fakultät für Informatik\\
der Otto-von-Guericke-Universität Magdeburg

\vspace*{1.25cm}

von \@degree~\@author

\vspace*{0.2cm}

\begin{tabbing}
	\=\hspace{7.5cm}\=\hspace{5cm}\\[-\baselineskip]
	\>geb. am \@birthdate\>in \@birthplace
\end{tabbing}

\vspace*{0.2cm}

Gutachterinnen/Gutachter

\vspace*{0.4cm}

\@reviewerA\\
\@reviewerB\\
\@reviewerC\\
\@reviewerD

\vspace*{1.75cm}

Magdeburg, den \printfdate{shbritishdots} %shbritishdots corresponds to German date format

}%
\restoregeometry
\thispagestyle{empty}
\vspace*{\fill}
\begin{minipage}{.95\textwidth}
	\textbf{\@author}\\
	\emph{\@title}\\
	\@thesistype, Otto von Guericke University Magdeburg \\
	Magdeburg, \printfdate{Y}.
\end{minipage}
\cleardoublepage
}