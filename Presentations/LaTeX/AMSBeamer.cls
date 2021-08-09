%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AMS - Style for Presentations
%%
%% Author: Benjamin Noack
%% Last Modified by: Benjamin Noack
%% Date: 2021-08-04
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Identification:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AMSBeamer}[2021/08/04 AMS Beamer Style]

%%% Options:


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}

% Check whether AMS logo should be included
\newif\ifAMSBeamer@AMSLogo
\AMSBeamer@AMSLogotrue
\DeclareOption{noAMSLogo}{\AMSBeamer@AMSLogofalse}

% Check whether total of pages should be shown on page
\newif\ifAMSBeamer@numberofpages
\AMSBeamer@numberofpagesfalse
\DeclareOption{numberofslides}{\AMSBeamer@numberofpagestrue}

\ProcessOptions\relax


\LoadClass[aspectratio=169,10pt]{beamer}

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage[utf8]{inputenc}

\useoutertheme{default}

% start slide top left
\beamer@centeredfalse

\usefonttheme{professionalfonts}
\RequirePackage{lmodern}

% define colors
% \definecolor{stimulate}{RGB}{0 104 180}
\definecolor{ovgu-inf-blue}{RGB}{0 104 180}

\colorlet{standardcolor}{ovgu-inf-blue}

% remove navigation symbols 
\setbeamertemplate{navigation symbols}{}

% smaller textsize in nested items
\beamertemplatedotitem

% \setbeamerfont{title}{series=\bfseries,size=\Large}
\setbeamerfont{title}{series=\bfseries,size=\Large}
\setbeamerfont{frametitle}{series=\bfseries,size=\large}
\setbeamerfont{framesubtitle}{size=\normalsize}
\setbeamerfont{author}{series=\bfseries,size=\normalsize}
\setbeamercolor{frametitle}{fg=ovgu-inf-blue}
% \setbeamercolor{frametitle}{fg=ovgu-inf-blue,bg=red}

\setbeamercolor{itemize item}{fg=ovgu-inf-blue}
\setbeamercolor{itemize subitem}{fg=ovgu-inf-blue}
\setbeamercolor{itemize subsubitem}{fg=ovgu-inf-blue}
\setbeamercolor{local structure}{fg=ovgu-inf-blue}

% Margins
% \setbeamersize{text margin left=0mm, text margin right=0mm,}
% \setlength{\textwidth}{\beamer@paperwidth}
\newlength\leftframemargin
\newlength\rightframemargin
\setlength{\leftframemargin}{\beamer@leftmargin}
\setlength{\rightframemargin}{\beamer@rightmargin}

% Definition of headline
\setbeamertemplate{headline}{%
    \ifnum \theframenumber=1%
    \else%
		\begin{tikzpicture}[inner sep=0pt, outer sep=0pt]
			\useasboundingbox  (0,0) rectangle (160mm,10mm);%
			\path (0,0) node[anchor=south west]{%
					\ifAMSBeamer@AMSLogo\includegraphics{logos/AMShead.pdf}%
				\else%
					\includegraphics{logos/OVGUhead.pdf}%
				\fi%
			};
			% 5.5mm would center text vertically, but 5mm looks better
			\ifAMSBeamer@AMSLogo%
				\path (4mm,5mm) node[anchor=west,text width=97mm]{\usebeamercolor[fg]{frametitle}\usebeamerfont{frametitle}\strut\insertframetitle\strut\par};			
			\else%
				\path (4mm,5mm) node[anchor=west,text width=121mm]{\usebeamercolor[fg]{frametitle}\usebeamerfont{frametitle}\strut\insertframetitle\strut\par};
			\fi%
		\end{tikzpicture}
    \fi%    
}



\def\insertframetitle{}
\setbeamertemplate{frametitle}{%
 % TODO subtitle
}

% Definition of footer
\setbeamercolor{footlinecolor}{fg=white,bg=ovgu-inf-blue}
\setbeamertemplate{footline}{%
    \ifnum \theframenumber=1%
    \else%
		\ifbeamercolorempty[bg]{frametitle}{}{\nointerlineskip}%
		\begin{beamercolorbox}[sep=0pt,ht=0.3cm,wd=\paperwidth,leftskip=0.5cm,rightskip=0.5cm]{footlinecolor}
		\vbox to0.3cm{\vfil\hbox{%
		\color{white}{\fontsize{4}{7}\selectfont\bfseries{\insertshorttitle~$\vert$~\insertshortauthor}}%
		}\vfil}%
		\hfill%
		\vbox to0.3cm{\vfil\hbox{%
		\color{white}{\fontsize{4}{7}\selectfont\bfseries{\insertframenumber%
		\ifAMSBeamer@numberofpages/\inserttotalframenumber\fi}}%
		}\vfil}
		\end{beamercolorbox}
    \fi%    
}

% Definition of title page
% \setbeamertemplate{title page}{%
%     \setbeamertemplate{footline}{} 
% 	\begin{textblock*}{\paperwidth}[0.5,0.5](0.5\paperwidth,0.5\paperheight)%	
% 		\begin{center}
% 			{\usebeamercolor[fg]{frametitle}\usebeamerfont{title}\inserttitle\par}%
% 			\vspace*{0.5ex}%
% 			\usebeamerfont{subtitle}\insertsubtitle\par%
% 			\bigskip%
% 			\usebeamerfont{author}\insertauthor\par%
% 			\bigskip%
% 			\usebeamerfont{institute}\insertinstitute\par%
% 			\vspace*{1ex}%
% 			\usebeamerfont{date}\insertdate\par%
% 		\end{center}
% 	\end{textblock*}%
% 	\begin{textblock*}{3.3cm}[0,1](11cm,8cm)%
% 		\includegraphics[height=1.4cm]{logos/Signet_INF_1}%
% 	\end{textblock*}%

% 	\begin{textblock*}{3.3cm}[1,1](15cm,8cm)%
% 		\raggedleft%
% 		\includegraphics[height=1.3cm]{logos/AMS}%
% 	\end{textblock*}%
% }

\newlength\title@tlsep%
\setlength\title@tlsep{5mm}%
\newlength\title@titlemargin%
\setlength\title@titlemargin{14mm}%
\newlength\title@institutemargin%
\setlength\title@institutemargin\title@titlemargin%
\setbeamertemplate{title page}{%
    \setbeamertemplate{footline}{} 
	\begin{tikzpicture}[overlay, remember picture, shift={(current page.south west)}, inner sep=0pt, outer sep=0pt]% shift to lower left corner and 3mm (footline) upwards
		\useasboundingbox (0,0) rectangle (160mm,90mm);%
		\fill[ovgu-inf-blue] (0,90mm) rectangle (160mm,55mm);
		\node[anchor=north east] at (160mm,90mm) {\includegraphics{logos/otto.pdf}};
		\node[anchor=north west] at (\title@titlemargin,87mm) {\includegraphics[height=11mm]{logos/Signet_INF_1_inv.pdf}};	
		%132mm
		\node[anchor=south west, text width=160mm-2\title@titlemargin] at (\title@titlemargin,55mm+\title@tlsep) {\color{white}\usebeamerfont{title}\inserttitle\par%
		\ifx\insertsubtitle\empty\else\medskip\color{white}\usebeamerfont{subtitle}\insertsubtitle\fi};	
		\node[anchor=north west, text width=160mm-2\title@institutemargin] at (\title@institutemargin,55mm-\title@tlsep) {%
			% \usebeamerfont{subtitle}\insertsubtitle\par%
			% \vspace*{4ex}%
			{\usebeamerfont{author}\insertauthor\par}%
			\vspace*{\title@tlsep}%
			\usebeamerfont{institute}\insertinstitute\par%
			\vspace*{\title@tlsep}%
			\usebeamerfont{date}\insertdate\par%
		};	
		\ifAMSBeamer@AMSLogo%
			\node[anchor=south east] at (150mm,7mm) {\includegraphics[width=50mm]{logos/AMS.pdf}};%
		\fi
		% \makegrid		
	\end{tikzpicture}
}


% half-transparent pause
\setbeamercovered{transparent=45}

% Use serifs in equations
\usefonttheme[onlymath]{serif}

% remove margin
\RequirePackage{changepage}
\newenvironment{nomargin}{
	\begin{adjustwidth}{-\leftmargin}{-\rightmargin}%
}{%
	\end{adjustwidth}%
}

% SI units
\RequirePackage{siunitx}


% tikz frame: 
% always at the same position
% no inner and outer sep of nodes

% \pgfdeclarelayer{background}
% \pgfdeclarelayer{foreground}
% \pgfdeclarelayer{top}
% \pgfsetlayers{background,main,foreground,top}

\newdimen\pictwidth% width of picture
\newdimen\pictheight% height of picture
\pictwidth=160mm%
\pictheight=77mm%
% TikZ frame for absolute positioning
\newenvironment{tikzframe}{%
	\begin{tikzpicture}[overlay, remember picture, shift={($(current page.south west)+(0,3mm)$)}, inner sep=0pt, outer sep=0pt]% shift to lower left corner and 3mm (footline) upwards
		\useasboundingbox (0,0) rectangle (160mm,77mm);%	
}{%
	\end{tikzpicture}
}

% Grid for use in TikZ frame
\newcommand{\makegrid}{%
	\draw[style=help lines,step=0.1,opacity=0.2] (0,0) grid (\pictwidth,\pictheight);
	\draw[very thin,step=1,opacity=0.2] (0,0) grid (\pictwidth,\pictheight);
	\foreach \y in {1,2,...,7}
	{
		\draw (2,\y) node[left,gray,opacity=0.5]{\color{gray}\y};
	}
	\foreach \x in {1,2,...,15}
	{
		\draw (\x,5) node[below,gray,opacity=0.5]{\color{gray}\x};
	}
}%

% Grid for use with textpos
\newcommand{\makegridtp}{%
	\begin{tikzframe}
		\draw[style=help lines,step=0.1,opacity=0.2] (0,0) grid (\pictwidth,\pictheight);
		\draw[very thin,step=1,opacity=0.2,yshift=-3mm] (0,0) grid (\pictwidth,\pictheight+3mm);
		\foreach \y in {1,2,...,8}
		{
			\draw (2, 87mm - \y cm) node[left,gray,opacity=0.5]{\color{gray}\y};
		}
		\foreach \x in {1,2,...,15}
		{
			\draw (\x,5) node[below,gray,opacity=0.5]{\color{gray}\x};
		}
	\end{tikzframe}		
}%


% Show number of slides consisting of multiple frames
% can be used outsize tikzframe
\newcommand{\overlaynumber}{%
\begin{tikzpicture}[overlay, remember picture, shift={($(current page.north west)+(0,-2mm)$)}, inner sep=0pt, outer sep=0pt]%
	\path (0,0) node[anchor=north west, inner sep=0pt]{\number\beamer@slideinframe};
\end{tikzpicture}%
}

\newcommand{\Notes}[1]{%
\begin{tikzpicture}[overlay, remember picture, shift={($(current page.north east)+(-1mm,-2mm)$)}, inner sep=0pt, outer sep=0pt]%
	\path (0,0) node[anchor=north east, inner sep=0pt, draw=red!50!black,thick, fill=white, text width=5cm,rounded corners=1mm,inner sep=2mm,font=\small]{#1};
\end{tikzpicture}%
}