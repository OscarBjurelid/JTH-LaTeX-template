\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JTH}[2017/10/03 JU-JTH LaTeX class]

% Build on existing report class
\LoadClass[11pt, a4paper]{article}

% --- Package loading starts ---
% Core LaTeX features
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\graphicspath{{images/}}

% Colors for front page
\RequirePackage{xcolor}
\RequirePackage{pagecolor}

% Fonts for headers and body
\RequirePackage{helvet}
\RequirePackage{mathptmx}

% Various styling and spacing
\RequirePackage{setspace}
\RequirePackage{sectsty}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
% --- Package loading ends ---

% Define a macro for the subtitle
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand*{\@subtitle}{}%

% Define a macro for main field, author, supervisor and place, year and month 
\newcommand*{\mainfield}[1]{\gdef\@mainfield{#1}}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\place}[1]{\gdef\@place{#1}}
\newcommand*{\stateYear}[1]{\gdef\@stateYear{#1}}
\newcommand*{\stateMonth}[1]{\gdef\@stateMonth{#1}}

% Various color, font, and indentation
\definecolor{jublue}{RGB}{0.0, 56, 101}
\allsectionsfont{\sffamily}
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}

% Configure footer (i.e., page number) style
\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\fancyfoot[C]{\sffamily\fontsize{10pt}{10pt}\selectfont\thepage} % except the center
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}
\pagestyle{plain}

% --- Start of fancy title page command ---
\renewcommand{\maketitle}{%
	% Reconfigure front page colors, geometries, etc.
	\thispagestyle{empty}
	\newgeometry{left=2cm,top=2cm, right=7cm}
	%\newpagecolor{jublue}
	\color{black}
	\sffamily

	% Logo, nice spacing, title, subtitle, author..
	\includegraphics[width=70mm]{juLogo.png}\par
	\vspace{4 cm}
	\setstretch{1.1}
	\Huge\textbf{\@title}\par
	\huge \@subtitle\par

	\vspace*{\fill}
	\scriptsize
	\textbf{HUVUDOMRÅDE: }\textit{{\@mainfield}}
	\newline
	FÖRFATTARE: \textit{\@author}
	\newline
	HANDLEDARE: \textit{\@supervisor}
	\newline
	\MakeUppercase{\@place} \@stateYear \ \@stateMonth
	
	

	% Restore default settings for the rest of the document
	\color{black}
	\normalsize
	\rmfamily
	\newpage
	\restoregeometry
	\restorepagecolor

	% And finally, set the nice spacing again
	\setstretch{1.2}
}
% --- End of fancy title page command ---