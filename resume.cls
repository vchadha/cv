\ProvidesClass{resume}[Resume class]

\LoadClass[10pt,letterpaper]{article}

%----------------------------------------------------------------------------------------
%   PACKAGES
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc}        % UTF-8 input encoding
\usepackage[T1]{fontenc}           % T1 font encoding for sharper output at small sizes
\usepackage{lmodern}               % Improved Latin Modern fonts
\usepackage[parfill]{parskip}      % Remove paragraph indentation
\usepackage{array}                 % Required for boldface tabular columns
\usepackage{ifthen}                % Required for conditional statements
\usepackage{amsmath}               % Math support
\usepackage[hidelinks]{hyperref}   % Clickable links in PDF without colored borders

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%   HEADER COMMANDS
%   The header prints three components in order:
%     1. \name       -- your name, large and bold (required)
%     2. \tagline    -- a short personal tagline in italics (optional)
%     3. \contact    -- contact info, items separated by \contactSep (optional)
%
%   Usage in .tex:
%     \name{Varun Chadha}
%     \tagline{Building resilient software. Also, I make games.}
%     \contact{(555) 555 5555 \contactSep you@email.com}
%----------------------------------------------------------------------------------------

% Separator used between items in the \contact line
\newcommand{\contactSep}{$\boldsymbol{\cdot}$\ }

% \name: stores the name for rendering in the header
\newcommand{\name}[1]{\def\@name{#1}}
\def\@name{}

% \tagline: stores an optional italic tagline
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\def\@tagline{}

% \contact: stores an optional contact info line
\newcommand{\contact}[1]{\def\@contact{#1}}
\def\@contact{}

% Internal: renders the name as a large bold centered heading
\newcommand{\printname}{%
  \begingroup
    \hfil{\namesize\bfseries\@name}\hfil
    \nameskip\break
  \endgroup
}

% Internal: renders the tagline centered and italic
\newcommand{\printtagline}{%
  \begingroup
    \centerline{{\em\@tagline}}%
  \endgroup
  \par\smallskip
}

% Internal: renders the contact line centered
\newcommand{\printcontact}{%
  \begingroup
    \centerline{\@contact}%
  \endgroup
  \par\smallskip
}

% Render header components at document start
\AtBeginDocument{%
  \printname
  \ifx\@tagline\empty\else\printtagline\fi
  \ifx\@contact\empty\else\printcontact\fi
}

%----------------------------------------------------------------------------------------
%   SECTION FORMATTING
%   rSection: a named top-level section with a double rule and uppercase bold title
%
%   Usage: \begin{rSection}{Section Title} ... \end{rSection}
%----------------------------------------------------------------------------------------

\newenvironment{rSection}[1]{%
  \sectionskip
  % Double horizontal rule above section title
  \hrule width\hsize height 1pt \kern 0.5mm \hrule width\hsize height 1pt
  \smallskip
  {\large\bfseries\MakeUppercase{#1}}
  \smallskip
  \begin{list}{}{%
    \setlength{\leftmargin}{1.5em}
  }
  \item[]
}{%
  \end{list}
}

%----------------------------------------------------------------------------------------
%   SUBSECTION FORMATTING
%   rSubsection: an entry within a section, such as a job, project, or degree
%
%   Arguments:
%     #1 -- company / organisation (leave empty {} to suppress the second line)
%     #2 -- date range
%     #3 -- job title / role / project name
%     #4 -- location (leave empty {} if unused)
%
%   Rendered layout:
%     Line 1 (always):  [bold #3 title]      [italic #2 date]
%     Line 2 (if #1):   [#1 company]         [italic #4 location]
%
%   Usage:
%     \begin{rSubsection}{Capital One}{Jan 2023 -- Present}{Senior Engineer}{}
%       \item Did a thing.
%     \end{rSubsection}
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{%
  {\bfseries #3} \hfill {\em #2}%
  % Only print the company/location line if a company name was provided
  \ifthenelse{\equal{#1}{}}{}{%
    \\%
    {#1} \hfill {\em #4}%
  }%
  \smallskip
  \begin{list}{$\boldsymbol{\cdot}$}{%
    \leftmargin=1.5em
    \setlength{\itemsep}{0.1em}
    \setlength{\parsep}{0pt}
    \setlength{\topsep}{0pt}
  }%
}{%
  \end{list}
  \vspace{0.5em}
}

%----------------------------------------------------------------------------------------
%   SPACING DEFINITIONS
%   Adjust these to control vertical rhythm throughout the document.
%   Possible values: \smallskip, \medskip, \bigskip
%----------------------------------------------------------------------------------------

\def\namesize{\huge}       % Font size of the name in the header
\def\nameskip{\medskip}    % Vertical space after the name
\def\sectionskip{\medskip} % Vertical space before each section rule
