%! Class = math486homework.cls
%! Author = Len Washington III
%! Date = 8/19/24

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math486homework}[Len Washington III's Document Class]

\LoadClass[12pt]{report}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
	family=mathhomework,
	prefix=mathhomework@
}

\DeclareStringOption{number}
\DeclareStringOption[]{title}

\ProcessKeyvalOptions*
\renewcommand{\title}{Math 486/522 - Homework \mathhomework@number\ - \mathhomework@title}
%\let\mathhomework@title\title

\RequirePackage[
	title={\title},
]{math486}

\renewcommand{\maketitle}{%
		\begin{center}\textbf{\title}
		\end{center}\\
	\textbf{Fall 2024\hfill\math@author}\\
}

\RequirePackage{enumitem}
\newlist{problems}{enumerate}{2}
\setlist[problems, 1]
{label=\textbf{\arabic{problemsi}.},
	leftmargin=15pt,
}

\setlist[problems, 2]
{label=\textbf{(\alph{problemsii})},
	leftmargin=30pt,}

\newcounter{problem}
\setcounter{problem}{1}
\newcommand{\problem}[1][prb:\the\numexpr\value{chapter}.\the\numexpr\value{section}.\number\value{problemsi}]{%
	\pdfbookmark[3] % Level
	{Problem \the\numexpr\value{problemsi}+1} % Text
	{#1}% Name/Label
	\item\label{#1}}

\newcommand{\subproblem}{%
	\pdfbookmark[4]% Level
	{Problem \the\numexpr\value{problemsi}\makeAlph{problemsii}}% Text
	{prb:\the\numexpr\value{chapter}.\the\numexpr\value{section}.\number\value{problemsi}\makeAlph{problemsii}}% Name/Label
	\item\label{prb:\number\value{problemsi}\alph{problemsii}}}
