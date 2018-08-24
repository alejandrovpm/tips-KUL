Latex packages and commands
===========
Packages
--------
```
\usepackage{cite}
\usepackage{graphicx}
\usepackage{psfrag}
\usepackage[font=footnotesize,caption=false]{subfig}
\usepackage{url}
\usepackage{cleveref}
\usepackage{nicefrac}
\usepackage{units}
```
----
Inline lists
----
```
\usepackage{paralist}
\newenvironment{inparlist}{\begin{inparaenum}[\itshape i)]}{\end{inparaenum}}
```
exemple of use:
```
 ... consists of:
\begin{inparlist}
\item first point,
\item second point, and
\item thirt point.
\end{inparlist}
```
Figures
----
figures are expected to be in the /images folder.
files from svg are saved in the image folder

To referesh figure, run with shell escape option

this also activate the psfragfig command refresh
```
pdflatex -shell-escape ....
```
commands for svg: see [this](http://ftp.snt.utwente.nl/pub/software/tex/info/svg-inkscape/InkscapePDFLaTeX.pdf) article for making svgs with control inside.

In the preable:
```
%\newcommand{\REFRESHFIGURES}{}% uncomment this to refresh figures

\graphicspath{{./images/}{../jpeg/}}


\ifdefined\REFRESHFIGURES
    \usepackage{auto-pst-pdf}%this one is for eps 
    \newcommand{\executeiffilenewer}[3]{%
     \ifnum\pdfstrcmp{\pdffilemoddate{#1}}%
     {\pdffilemoddate{#2}}>0%
     {\immediate\write18{#3}}\fi%
    }
    
    \newcommand{\includesvg}[1]{%
     \executeiffilenewer{images/#1.svg}{images/#1.pdf}%
     {inkscape -z -D --file=images/#1.svg %
     --export-area-page %
     --export-pdf=images/#1.pdf --export-latex}%
     \input{images/#1.pdf_tex}%
    }
\else
    \usepackage[off]{auto-pst-pdf}
    
    \newcommand{\includesvg}[1]{%
     \input{images/#1.pdf_tex}%
     } 
\fi
```
To add a figure:
```
%%%%%% example
\begin{figure} 
\centering
  \def\svgwidth{\columnwidth}% or any other size, e.g. 0.9\columnwidth
  \psfrag{some text}[cc][cc][1]{some other text}, optional, if you made some errors
  \includesvg{image}# image name without extention
  \caption{The test image, exported to PDF \emph{with} \LaTeX\ option.}
  \label{fig:nicefigure} 
\end{figure}
```

To add a graph (saved in .eps format)
```
\begin{figure} 
\centering
\input{filewithPSMACROS}%optional, i normally save all the /psrfrag commands in other files
\psfragfig[width= \columnwidth]{filename} %filename without .eps
\caption{A nice graph}
\label{fig:graph}
\end{figure}
```
clever ref
---
allows to refence using the command ```\cref{mylabel}``` or ```\Cref{...}``` if you want capital letter to start.
the referece can be changed as in
```
\crefformat{equation}{(#2#1#3)}
\crefformat{section}{Sec.~#2#1#3}
\crefformat{figure}{Fig.~#2#1#3}
\crefformat{paragraph}{par.~#2#1#3}
\crefformat{lstlisting}{Listing~#2#1#3}
\crefmultiformat{lstlisting}{Listings~#2#1#3}%
{ and~#2#1#3}{, #2#1#3}{ and~#2#1#3}
```
check documentation of the packages for details 

nice fractions and units
----
See [the docs](http://ftp.snt.utwente.nl/pub/software/tex/macros/latex/contrib/units/units.pdf). Allows to write in a nice way the numbers with units; i use it in math mode, also in text
```
$\unitfrac[5]{m}{s}$
$\unit[1]{m}$ 

```
subfigs
-----


Program snippets

put the following text at the end in a file and include it. Note that you can customise the keywords.
i have a lua and json styles.

in the text you can put a snipped of code in a file and include with
```
\lstinputlisting[style=jsonstyle,float,
caption={my caption},label=my label]{file.txt}
```
see [here](https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings) for more info

----


```
% my_listing.tex file

\usepackage{listings}
\usepackage{textcomp}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\lstdefinelanguage{lua}
  {morekeywords={and,break,do,else,elseif,end,false,for,function,if,in,local,
     nil,not,or,repeat,return,then,true,until,while},
   morekeywords={Versor,Scalar,Object_frame,Geometric_primitive,Equation,ObjectFrame,
   				Geometric_relation,GeometricExpression,JointExpression,Equation_type,
   				Position,Constraint,Behaviour,
				Trj_generator,Constant,Monitor,
				Comparison_operator,String,Task,Versor,Point,Plane
,Line,Primitive},  
   morekeywords={[2]arg,assert,collectgarbage,dofile,error,_G,getfenv,
     getmetatable,ipairs,load,loadfile,loadstring,next,pairs,pcall,print,
     rawequal,rawget,rawset,select,setfenv,setmetatable,tonumber,tostring,
     unpack,_VERSION,xpcall},
   morekeywords={[2]coroutine.create,coroutine.resume,coroutine.running,
     coroutine.status,coroutine.wrap,coroutine.yield},
   morekeywords={[2]module,require,package.cpath,package.load,package.loaded,
     package.loaders,package.loadlib,package.path,package.preload,
     package.seeall},
   morekeywords={[2]string.byte,string.char,string.dump,string.find,
     string.format,string.gmatch,string.gsub,string.len,string.lower,
     string.match,string.rep,string.reverse,string.sub,string.upper},
   morekeywords={[2]table.concat,table.insert,table.maxn,table.remove,
   table.sort},
   morekeywords={[2]math.abs,math.acos,math.asin,math.atan,math.atan2,
     math.ceil,math.cos,math.cosh,math.deg,math.exp,math.floor,math.fmod,
     math.frexp,math.huge,math.ldexp,math.log,math.log10,math.max,math.min,
     math.modf,math.pi,math.pow,math.rad,math.random,math.randomseed,math.sin,
     math.sinh,math.sqrt,math.tan,math.tanh},
   morekeywords={[2]io.close,io.flush,io.input,io.lines,io.open,io.output,
     io.popen,io.read,io.tmpfile,io.type,io.write,file:close,file:flush,
     file:lines,file:read,file:seek,file:setvbuf,file:write},
   morekeywords={[2]os.clock,os.date,os.difftime,os.execute,os.exit,os.getenv,
     os.remove,os.rename,os.setlocale,os.time,os.tmpname},
   sensitive=true,
   morecomment=[l]{--},
   morecomment=[s]{--[[}{]]--},
   morestring=[b]",
   morestring=[d]'
  }
\lstdefinestyle{luastyle}
{
  %float=tb,
    %frame=single,
    numbers=left,
    stepnumber=5,    
    firstnumber=1,
    numberfirstline=true,
    numbersep=2pt, % how far the line-numbers are from the code 
    numberstyle=\tiny\color{gray}, % the style that is used for the line-numbers
    xleftmargin=5pt,%framexleftmargin=5mm,
    language=lua,
   % label=#1,
%    caption=#1,
    inputencoding=utf8x,
    backgroundcolor=\color[rgb]{0.95,0.95,0.95},
    tabsize=2,
    rulecolor=,
        basicstyle=\footnotesize \ttfamily,
        upquote=true,
        aboveskip={1.0\baselineskip},
        columns=fixed,
        showstringspaces=false,
        extendedchars=true,
        breaklines=true,
        prebreak = \raisebox{0ex}[0ex][0ex]{\ensuremath{\hookleftarrow}},
        %frame=single,
        showtabs=false,
        showspaces=false,
        showstringspaces=false,
        identifierstyle=\ttfamily,
        commentstyle=\color[rgb]{0.133,0.545,0.133},
        stringstyle=\color[rgb]{0.627,0.126,0.941},
}  
  
\lstnewenvironment{luaenv}[1][]
  { \lstset{ 
  label=#1,
  style=luastyle}}{}
  

%%%%%%%
\lstdefinelanguage{errlua}
  {morekeywords={and,break,do,else,elseif,end,false,for,function,if,local,
     nil,or,repeat,return,then,true,until,while},
   morekeywords={[2]arg,assert,collectgarbage,dofile,error,_G,getfenv,
     getmetatable,ipairs,load,loadfile,loadstring,next,pairs,pcall,print,
     rawequal,rawget,rawset,select,setfenv,setmetatable,tonumber,tostring,
     unpack,_VERSION,xpcall},
   morekeywords={[2]coroutine.create,coroutine.resume,coroutine.running,
     coroutine.status,coroutine.wrap,coroutine.yield},
   morekeywords={[2]module,require,package.cpath,package.load,package.loaded,
     package.loaders,package.loadlib,package.path,package.preload,
     package.seeall},
   morekeywords={[2]string.byte,string.char,string.dump,string.find,
     string.format,string.gmatch,string.gsub,string.len,string.lower,
     string.match,string.rep,string.reverse,string.sub,string.upper},
   morekeywords={[2]table.concat,table.insert,table.maxn,table.remove,
   table.sort},
   morekeywords={[2]math.abs,math.acos,math.asin,math.atan,math.atan2,
     math.ceil,math.cos,math.cosh,math.deg,math.exp,math.floor,math.fmod,
     math.frexp,math.huge,math.ldexp,math.log,math.log10,math.max,math.min,
     math.modf,math.pi,math.pow,math.rad,math.random,math.randomseed,math.sin,
     math.sinh,math.sqrt,math.tan,math.tanh},
   morekeywords={[2]io.close,io.flush,io.input,io.lines,io.open,io.output,
     io.popen,io.read,io.tmpfile,io.type,io.write,file:close,file:flush,
     file:lines,file:read,file:seek,file:setvbuf,file:write},
   morekeywords={[2]os.clock,os.date,os.difftime,os.execute,os.exit,os.getenv,
     os.remove,os.rename,os.setlocale,os.time,os.tmpname},
   sensitive=true,
   morecomment=[l]{--},
   morecomment=[s]{--[[}{]]--},
   morecomment=[l]{err@},
   morecomment=[l][\color{orange}]{warn@},
   morestring=[b]",
   morestring=[d]'
  }
\lstnewenvironment{errluaenv}[1][]
  {\lstset{
    %frame=single,
    numbers=left,
    stepnumber=5,    
    firstnumber=1,
    numberfirstline=true,
    numbersep=2pt, % how far the line-numbers are from the code 
    numberstyle=\tiny\color{gray}, % the style that is used for the line-numbers
    xleftmargin=5pt,%framexleftmargin=5mm,
    language=errlua,
    label=err,
%    caption=#1,
    inputencoding=utf8x,
    backgroundcolor=\color[rgb]{0.95,0.95,0.95},
    %backgroundcolor=\color{lbcolor},
    tabsize=2,
    rulecolor=,
        basicstyle=\footnotesize \ttfamily,
        upquote=true,
        aboveskip={1.0\baselineskip},
        columns=fixed,
        showstringspaces=false,
        extendedchars=true,
        breaklines=true,
        prebreak = \raisebox{0ex}[0ex][0ex]{\ensuremath{\hookleftarrow}},
        %frame=single,
        showtabs=false,
        showspaces=false,
        showstringspaces=false,
        identifierstyle=\ttfamily,
        commentstyle=\color[rgb]{1,0,0},
        stringstyle=\color[rgb]{0.627,0.126,0.941},
}
}
{}

% for a dark grey box around the captions of the listings
\DeclareCaptionFont{white}{\color{white}}
\DeclareCaptionFormat{listing}{\colorbox[cmyk]{0.43, 0.35, 0.35,0.01}{\parbox{\columnwidth}{\hspace{0pt}#1#2#3}}} 
\captionsetup[lstlisting]{format=listing,labelfont=white,textfont=white, singlelinecheck=false, margin=0pt, font={bf,footnotesize}}
\captionsetup[consoleOutputEnv]{format=listing,labelfont=white,textfont=white, singlelinecheck=false, margin=0pt, font={bf,footnotesize}}
\captionsetup[consoleOutputEnvOneColumn]{format=listing,labelfont=white,textfont=white, singlelinecheck=false, margin=0pt, font={bf,footnotesize}}
\captionsetup[cPlusPlusEnv]{format=listing,labelfont=white,textfont=white, singlelinecheck=false, margin=0pt, font={bf,footnotesize}}
\captionsetup[cPlusPlusEnvOneColumn]{format=listing,labelfont=white,textfont=white, singlelinecheck=false, margin=0pt, font={bf,footnotesize}} 
%%%%%%



%\usepackage{xcolor}

\colorlet{punct}{red!60!black}
\definecolor{background}{HTML}{EEEEEE}
\definecolor{delim}{RGB}{20,105,176}
\colorlet{numb}{magenta!60!black}

 %float=tb,
    %frame=single,
%    numbers=left,
%    stepnumber=5,    
%    firstnumber=1,
%    numberfirstline=true,
%    numbersep=2pt, % how far the line-numbers are from the code 
%    numberstyle=\tiny\color{gray}, % the style that is used for the line-numbers
%    xleftmargin=5pt,%framexleftmargin=5mm,





\newcommand\JSONnumbervaluestyle{\color{blue}}
\newcommand\JSONstringvaluestyle{\color{red}}

% switch used as state variable
\newif\ifcolonfoundonthisline

\colorlet{punct}{red!60!black}
\definecolor{background}{HTML}{EEEEEE}
\definecolor{delim}{RGB}{20,105,176}
\colorlet{numb}{magenta!60!black}

\lstdefinelanguage{json}{
  morekeywords={oneOf,required,additionalProperties,$schema,id,description,type,properties},
   keywords=[2]{string,number,enum,object},%list of predefined types
   sensitive=true,
   morecomment=[l]{--},
  % morecomment=[s]{--[[}{]]--},
  % morestring=[b]",
  literate=
     *{:}{{{\color{punct}{:}}}}{1}
      {,}{{{\color{punct}{,}}}}{1}
      {\{}{{{\color{delim}{\{}}}}{1}
      {\}}{{{\color{delim}{\}}}}}{1}
      {[}{{{\color{delim}{[}}}}{1}
      {]}{{{\color{delim}{]}}}}{1},
}


\lstdefinestyle{jsonstyle}
{
  %float=tb,
    %frame=single,
    numbers=left,
    stepnumber=5,    
    firstnumber=1,
    numberfirstline=true,
    numbersep=2pt, % how far the line-numbers are from the code 
    numberstyle=\tiny\color{gray}, % the style that is used for the line-numbers
    xleftmargin=5pt,%framexleftmargin=5mm,
    language=json,
   % label=#1,
%    caption=#1,
    inputencoding=utf8x,
    backgroundcolor=\color[rgb]{0.95,0.95,0.95},
    tabsize=2,
    rulecolor=,
    basicstyle=\footnotesize \ttfamily,
   upquote=true,
   %aboveskip={-1.0\baselineskip},
   columns=fixed,
   showstringspaces=false,
  extendedchars=true,
  breaklines=true,
  prebreak = \raisebox{0ex}[0ex][0ex]{\ensuremath{\hookleftarrow}},
   frame=lines,
   showtabs=false,
        showspaces=false,
        showstringspaces=false,
        identifierstyle=\ttfamily,
        commentstyle=\color[rgb]{0.133,0.545,0.133},
        %stringstyle=\color[rgb]{0.627,0.126,0.941},
    captionpos=b,
    keywordstyle=[2]\color{orange}
      %
}  
  
\lstnewenvironment{jsonenv}[1][]
  { \lstset{ 
  label=#1,
  style=jsonstyle,
%
  }}{}
  
```
