#lang scribble/base
@(require scribble/manual)

@(begin
   (define (dice n d)
     (format "~ad~a" n d))
   (define DT deftech)
   (define dresult bold)
   (define T tech))

@title{JTTRPG}
@author{@author+email["Jay McCarthy" "jay.mccarthy@gmail.com"]}

XXX

@table-of-contents[]

@section{Basics}

A @DT{play group} is a @T{gamemaster} and multiple
@T{leads} controlled by @DT{players}. A @DT{lead} is an
important fictional character controlled by a human @T{player}. The
@DT{gamemaster} (or GM) controls the rest of the universe and
adjudicates between @T{leads}.

The @DT{basic mechanic} is for a @T{lead} to describe their action. If
the action could be done by any normal person in the circumstances,
then no dice are needed. However, if some special circumstance or
special ability is required, the @T{player} rolls @dice[2 6] and adds
a modifier number to the result based on the @T{category} of the
action.
@itemlist[

@item{If @dresult{both are 6} or the modified result is @dresult{10 or
more}, then the action is a @DT{success}. The player gets what they
want and positive consequences are narrated by the @T{gamemaster}.}

@item{If @dresult{both are 3} or the modified result is @dresult{7, 8,
or 9}, then the action is a @DT{partial} success, where the main
result is accomplished but there are some negative @T{consequence},
collaboratively determined by the @T{gamemaster} and @T{player}.}

@item{If @dresult{both are 1} or the modified result is @dresult{6 or
less}, then the action is a @DT{failure} and the @T{gamemaster}
chooses and narrates the negative @T{consequences}. Whenever a roll
results in @T{failure}, the @T{lead} receives @T{XP} in the
@T{category} of the action.}  ]

@section{Characters}

XXX

@subsection{Character Creation}

XXX

@section{Skills}

XXX

@subsection{End of Session}

XXX

@section{Actions}

XXX

@subsection{Combat}

XXX

@subsection{Consequences}

XXX

@section{Miscellaneous}

XXX

@section{Gamemastering}

XXX

@subsection{Story Advice}

XXX

@section{Resources}

XXX

@section{Acknowledgments}

XXX
