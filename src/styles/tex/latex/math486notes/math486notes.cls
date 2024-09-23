%! Class = math486notes.cls
%! Author = Len Washington III
%! Date = 8/19/24

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math486notes}[Len Washington III's Document Class]

\LoadClass[12pt]{report}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
	family=mathnotes,
	prefix=mathnotes@
}

\DeclareStringOption{date}
\DeclareStringOption{month}
\DeclareStringOption{day}
\DeclareStringOption[]{title}

\ProcessKeyvalOptions*

\RequirePackage[
	title={{\mathnotes@date\ Notes}},
	date={\mathnotes@date}
]{math486}
\RequirePackage{enumerate}
\RequirePackage{enumitem}

\setlength{\parindent}{0in}

\RequirePackage{titlesec}
\titleformat{\section}
{\bfseries}
{}
{0em}
{}

\let\begindocument\document
\let\enddoc\enddocument

\renewenvironment{document}
{
	\begindocument
	%<*2024-\mathnotes@month-\mathnotes@date>
}{
	%</2024-\mathnotes@month-\mathnotes@date>
	\enddoc
}

\newcommand{\testme}[2]{\ExecuteMetaData[#1-#2-2024]{2024-#1-#2}}