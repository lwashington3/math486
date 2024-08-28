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
\DeclareStringOption[]{title}

\ProcessKeyvalOptions*

\RequirePackage[
	title={{\mathnotes@date\ Notes}},
	date={\mathnotes@date}
]{math486}

%\setlength{\indent}{0in}

\RequirePackage{titlesec}
\titleformat{\section}
{\bfseries}
{}
{0em}
{}