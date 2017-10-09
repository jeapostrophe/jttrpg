#lang scribble/base
@(require scribble/manual)

@(begin
   (define DT deftech)
   (define dresult bold)
   (define T tech)
   (define HOW-BIG-HAND 5)
   (define HOW-BIG-HANDs "five")
   (define card bold))

@title{JTTRPG}
@author{@author+email["Jay McCarthy" "jay.mccarthy@gmail.com"]}

This document describes the tabletop role-playing game I play with my
kids and friends. It is deliberately described in an abstract way,
because we apply it to different scenarios and settings as our taste
changes. It attempts to have strategic thinking in "combat"
situations, as well as allowing a lot of creativity in general.

@table-of-contents[]

@section{Settings}

XXX

@section{Campaigns}

XXX

@section{Characters}

XXX

@section{Adventures}

XXX

@section{Mechanics}

A @DT{play group} is a @T{gamemaster} and multiple
@T{leads} controlled by @DT{players}. A @DT{lead} is an
important fictional character controlled by a human @T{player}. The
@DT{gamemaster} (or GM) controls the rest of the universe and
adjudicates between @T{leads}.

Each @T{lead} has a deck of normal playings cards, called their
@DT{deck}. The @T{deck} is divided into three partitions: the @T{draw
pile} and the @T{discard pile}. The top @HOW-BIG-HANDs cards of the
@T{draw pile} are the @DT{hand} (if the @T{draw pile} does not contain
@HOW-BIG-HANDs cards, then the @T{hand} is smaller than usual.)  The
@DT{draw pile} is initially the entire @T{deck}. The @DT{discard pile}
is initially empty. Only cards in the @T{hand} may be @T{used}. When a
card is @DT{used}, it is put in the @T{discard pile}. If the @T{draw
pile} is empty, the @T{discard pile} is re-shuffled and becomes the
@T{draw pile}.

The @DT{basic mechanic} is for a @T{lead} to describe their action. If
the action could be done by any normal person in the circumstances,
then no @T{test} is needed. However, if some special circumstance or
special ability is required, the @T{player} makes a @T{test}. The
result of a @T{test} is a @T{consequence}.

@subsection{Consequences}

A @DT{consequence} is either @T{success}, @T{partial}, or @T{failure}.

On a @DT{success}, the player gets what they want and positive
results are narrated by the @T{gamemaster}.

On a @DT{partial}, the main result is accomplished but there are some
negative results, collaboratively determined by the
@T{gamemaster} and @T{player}.

On a @DT{failure}, the @T{gamemaster} chooses and narrates the
negative results.

In general, results should always flow from the fiction. The story is
most interesting when the @T{leads} don't get their way exactly. So,
on a success, the @T{gamemaster} should look for a way to give the
player a hard choice of two good things out of three possibilities,
while on a partial success, they can only choose one.

There are no strict rules for what consequences are. The only
principle is that: on a @T{success}, you get what you want with only
soft consequences@";" on a @T{partial}, you get most of what you want
with maybe a hard consequence@";" and on a @T{failure}, you don't get
what you want and experience hard consequences.

@subsection{Tests}

There are two kinds of @DT{tests}: @T{contests} and @T{displays}.

@subsubsection{Contests}

In a @DT{contest}, there are @racket[n] participants. Each participant
that is a @T{lead} selects a card from their @T{hand} and declares it
@T{used}. Participants that are not @T{lead}s take the bottom card
from the @T{draw pile} of the @T{lead} that initiated the @T{contest}
and it is @T{used}. No card should not be revealed until all @T{lead}s
have @T{used} a card. The cards are ordered after incorporating all
applicable @T{modifiers}. The player of the highest card has a
@T{success}. The player of the lowest card has a @T{failure}. The
player of all card in the middle have a @T{partial}. @margin-note{A
@T{contest} involving two participants never has a @T{partial} result
for either.}

@bold{Example:} Pete, Chloe, and Lana---all @T{leads}---race across
the room to grab the fallen meteor rock. Pete chooses a @card{Jack},
Chloe chooses a @card{Queen}, and Lana plays the @card{Seven}. Chloe
reaches the rock first, Pete gets across the room but not in time,
while Lana's jacket is stuck on the cappuchino machine and it is
tumbling towards her.

@bold{Strategic Note:} @T{Leads} know which cards they have already
played and which they have not, so they have a fuzzy estimate of what
cards they may go up against. Similarly, they have an idea of where
their strengths and weakness lay, so they can decide how much to
commit to each action.

@bold{Gamemastering Note:} The @T{gamemaster} never directly opposes
the players strategically, because non-@T{lead} contestants have their
card randomly chosen (from their opponent's deck!)

@subsubsection{Displays}

A @DT{display} is a like a @T{contest}, except that there is only one
participant, which is a @T{lead}. Since there will be only one card,
then it is always ordered highest. So instead, a card smaller than
@card{Five} is a @T{failure} and a card larger than @card{Nine} is a
@T{success}, and all other cards are @T{partial}.

@bold{Example:} Jean is researching the toxin sample discovered in the
body of the victim and plays a @card{Eight}, so he learns that it is
extra-terrestial in origin, but destroys the sample in the process.

@subsection{Modifiers}

XXX

@section{Gamemastering}

XXX

@subsection{Story Advice}

XXX

@section{Resources}

XXX

@section{Acknowledgments}

XXX
