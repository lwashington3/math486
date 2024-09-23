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
\DeclareBoolOption[true]{answers}
\DeclareStringOption[]{title}

\ProcessKeyvalOptions*

\renewcommand{\title}{Math 486/522 - Homework \mathhomework@number\ifx\mathhomework@title\empty\else\ - \mathhomework@title\fi}
%\let\mathhomework@title\title

\RequirePackage[
	title={\title},
]{math486}

\hypersetup{
	linkcolor=black
}

\renewcommand{\maketitle}{%
	\begin{center}\textbf{\title}\end{center}
	\textbf{Fall 2024\hfill\math@author}
	\vspace{0.5em}
}

\RequirePackage{enumitem}
\newlist{problems}{enumerate}{3}
\setlist[problems, 1]
{label=\textbf{\arabic{problemsi}.},
	leftmargin=15pt,
}

\RequirePackage{alphalph}
\RequirePackage{bookmark}
\newcommand*\makeAlph[1]{\alphalph{\the\numexpr\value{#1}+1}}
\newcommand*\makeRoman[1]{\romannumeral\the\numexpr\value{#1}+1}
%\newcommand*\makeRoman[1]{\lowercase\expandafter\@slowromancap\romannumeral\the\numexpr\value{#1}+1@}

\setlist[problems, 2]
{label=\textbf{(\alph{problemsii})},
	leftmargin=30pt,}

\setlist[problems, 3]
{label=\textbf{(\roman{problemsiii})},
	leftmargin=35pt,}

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
	{prb:\mathhomework@number.\number\value{problemsi}\makeAlph{problemsii}}% Name/Label
	\item\label{prb:\number\value{problemsi}\alph{problemsii}}}

\newcommand{\subsubproblem}{%
	\pdfbookmark[5]% Level
	{Problem \the\numexpr\value{problemsi}\alph{problemsii}(\makeRoman{problemsiii})}% Text
	{prb:\mathhomework@number.\number\value{problemsi}\alph{problemsii}.\makeRoman{problemsiii}}% Name/Label
	\item\label{prb:\number\value{problemsi}\alph{problemsii}\roman{problemsiii}}}

\newcommand{\answerfile}{homework\mathhomework@number_answers}
\newcommand{\addanswer}[1]{% Input the section name
\begin{answer}\ExecuteMetaData[\answerfile]{#1}\end{answer}
}

\RequirePackage{minted}
\newcommand{\python}[1]{%
	\begin{listing}[H]%
		\inputminted{python}{#1}
%		\inputminted{python}{homework\mathhomework@number/problem\number\value{problemsi}\alph{problemsii}.py}% TODO: Find out how to check which level it's in
		\caption{Source Code for Problem \number\value{problemsi}\alph{problemsii}.}%
		\label{lst:prb-\number\value{problemsi}\alph{problemsii}}%
	\end{listing}
}