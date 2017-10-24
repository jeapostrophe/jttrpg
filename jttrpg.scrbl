#lang scribble/base
@(require racket/list
          scribble/manual)

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
changes. It attempts to have strategic thinking, with lots of
creativity in general.

@table-of-contents[]

@section{Mechanics}

A @DT{play group} is a @T{gamemaster} and multiple @T{leads}
controlled by @DT{players}. A @DT{lead} is an important fictional
character controlled by a human @T{player}. The @DT{gamemaster} (or
@DT{GM}) controls the rest of the universe and adjudicates between
@T{leads}.

The @T{play group} has a deck of normal playing cards, called the
@DT{deck}.The @T{deck} is divided into two partitions: the @DT{draw
pile} and the @DT{discard pile}. At the start of a play session, the
@T{discard pile} is empty and each @T{lead} is dealt a @DT{hand} of
@HOW-BIG-HANDs cards from the @T{draw pile}. When a @T{lead} @T{plays}
a card, then it is put in the @T{discard pile}. When the @T{lead}'s
@T{hand} is empty, then they draw @HOW-BIG-HANDs cards from the
@T{draw pile}, reshuffling the @T{discard pile} as the new @T{draw
pile} if necessary.

@subsection{Basic Mechanic}

The @DT{basic mechanic} is for a @T{lead} to describe their action. If
the action could be done by any normal person in the circumstances,
then no @T{test} is needed. However, if some special circumstance or
special ability is required, the @T{player} makes a @T{test}. The
result of a @T{test} is a @T{consequence}.

@subsection{Consequences}

A @DT{consequence} is either @T{success}, @T{partial}, or @T{failure}.

On a @DT{success}, the action is successful and the @T{player}
controls the story for a little bit, narrating the results of their
successful action. (Occasionally it is more appropriate for the
@T{gamemaster} to narrate.)

On a @DT{partial}, the main result is accomplished but there are some
negative results, collaboratively determined by the @T{gamemaster} and
@T{player}. Often it is best for the @T{gamemaster} to give a few
options, let the @T{player} decide which ones happen, and then
narrate.

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

Each test is associated with an @T{attribute} corresponding to the
kind of action that is being performed, this is called the @T{test
suit}.

There are two variants of @DT{tests}: @T{displays}, for when one
@T{lead} is involved, and @T{contests}, for when multiple @T{leads}
compete.

@subsubsection{Displays}

In a @DT{display}, the @T{lead} selects a card from their @T{hand} and
uses it. The @T{GM} selects the next card from the @T{draw pile}. Each
card is inspected after incorporating all applicable @T{modifiers}.

If the @T{lead}'s card is a @card{Face} card @bold{AND} is greater than or
equal to the @T{GM}'s card, then the @T{display} is a @T{success}.

If the @T{lead}'s card is a @card{Face} card @bold{OR} is greater than or
equal to the @T{GM}'s card, then the @T{display} is a @T{partial}.

Otherwise, the @T{display} is a @T{failure}.

@bold{Example:} Jean is researching the toxin sample discovered in the
body of the victim and plays a @card{Eight}, the @T{GM} draws a
@card{Seven}, so he learns that it is extra-terrestial in origin, but
destroys the sample in the process.

@bold{Example:} Elizabeth attacks the screen ogre with her scathing
wit and plays a @card{King}, the @T{GM} draws a @card{King}, so
Elizabeth shatters the ogre and continues the day victorious.

@subsubsection{Contests}

In a @DT{contest}, there are @racket[n] participants which are all
@T{lead}s. Each participant selects a card from their @T{hand} and
uses it. No card should not be revealed until all @T{lead}s have used
a card. The cards are ordered after incorporating all applicable
@T{modifiers}. The player of the unique highest card has a
@T{success}. The player of the unique lowest card has a
@T{failure}. The player of all cards in the middle have a
@T{partial}. @margin-note{A @T{contest} involving two participants
never has a @T{partial} result for either.}

@bold{Example:} Pete, Chloe, and Lana---all @T{leads}---race across
the room to grab the fallen meteor rock. Pete chooses a @card{Jack},
Chloe chooses a @card{Queen}, and Lana plays the @card{Seven}. Chloe
reaches the rock first, Pete gets across the room but not in time,
while Lana's jacket is stuck on the cappuchino machine and it is
tumbling towards her.

@subsubsection{Meta Notes}

@bold{Strategic Note:} @T{Leads} know which cards they have already
played and which they have not, so they have a fuzzy estimate of what
cards they may go up against. Similarly, they have an idea of where
their strengths and weakness lay, so they can decide how much to
commit to each action.

@bold{Gamemastering Note:} The @T{gamemaster} never directly opposes
the players strategically, because non-@T{lead} contestants have their
card randomly chosen.

@subsection{Lead Statistics}

Each @T{lead} has a few mechanical concepts associated with them:
@T{attributes}, @T{hit box}es, and XXX.

@subsubsection{Attributes}

@; XXX Add qualities to list

@ack["https://www.kickstarter.com/projects/matthewjhanson/the-fastest-rpg-ive-ever-played-abstract-dungeon"]{Abstract Dungeon}

A @T{lead} has four @DT{attributes}, which are each associated with various
actions and qualities and a @T{suit} in the @T{deck}:

@tabular[
#:style 'boxed
#:sep @hspace[2]
#:column-properties '(center center left)
#:row-properties '(bottom-border ())
(list
 (list @bold{Attribute} @bold{Suit} @bold{Actions and Qualities})
 (list @t{@DT{Toughness}}
       @t{@card{Clubs}}
       @t{Bend, Absorb, Pry, Throw, Hack, Slash, Flex,
Endure, Break, Bust, Jump, Climb, Swim, Chug, Sprint, Crush, Push,
Pull, Lift, Carry, etc.})
 (list @t{@DT{Agility}}
       @t{@card{Spades}}
       @t{Escape, Elude, Deflect, Shoot, Skewer, Dodge,
Parry, Balance, Tumble, Roll, Flip, Dance, Weave, Catch, Pick, Disarm,
Stun, Tie, etc.})
 (list @t{@DT{Intellect}}
       @t{@card{Diamonds}}
       @t{Study, Solve, Riddle, Cast, Think, Remember,
Ponder, Deduce, Reason, Decipher, Invent, Search, Convince, Debate,
Hypothesize, etc.})
 (list @t{@DT{Spirit}}
       @t{@card{Hearts}}
       @t{Disrupt, Channel, Commune, Sense, Pray, Motivate,
Appeal, Empathize, Persude, Intimidate, Intuit, Order, Command,
Provoke, etc.}))
]

Each @T{attribute} has an associated @DT{lead modifier} between
@litchar{-2} and @litchar{+2}.

@subsubsection{Hit Boxes}

A @T{lead} has a certain number of @DT{hit box}es, representing their
ability to deal with adversity.

When a @T{lead} fails to avoid adversity, then they fill in one @T{hit
box} with a negative @T{tag} related to the particular
circumstance. The @T{tag} should be written inside the box and must be
dealt with before it may be removed.

If all @T{hit box}es are filled in, then the character is ``down'' and
the direction of the adventure or campaign should change to address
the problem.

@bold{Example:} Tom blasts the crystal with his laser vision, but the
heat blast bounces off, hitting him in the eye, and blinding him. Tom
writes ``blind'' in one of his hit boxes.

@bold{Example:} Oscar opens the chest to reveal a viewing portal into
the Unseen Darkness where he sees The Undying One. The sight corrupts
Oscar's psyche and he writes ``neurotic'' in one of his hit boxes.

@ack["http://www.story-games.com/forums/discussion/21322/unplayable-fantasy-pbta-fictional-harm-system"]{Fictional Harm System}
@ack["http://www.story-games.com/forums/discussion/19273/a-descriptive-damage-hack-for-dungeon-world-world-of-dungeons/p1"]{Descriptive Damage Hack for Dungeon World}
@ack["https://plus.google.com/100410765634052727875/posts/hDTESC3RDA2"]{Addramyr Palinor
's Google+ post}

@subsection{Modifiers}

XXX lead modifiers
XXX traits
XXX test suit

XXX

@subsection{Character Creation}

XXX attributes
XXX tags
XXX hit boxes (short-term, long-term, etc) [2 to 4-ish]

@bold{Variant Note:} The system above is tuned for representing
short-term adversity, like damage and fighting spirit. If instead you
wish to represent long-term adversity, like general health and mental
wellness, you will want to tweak the scale.

@subsection{Actions}

XXX

@subsection{Combat}

XXX

ammo

defensive / carry

-- battlefield - abstract like makeyou kingdom

+ Simultaneous combat (with cards) --- establish defenses, attacks,
   ranges, etc --- then resolve

commit card during combat

@section{Flavor}

@subsection{Settings}

XXX Look at other ideas and write down example classes/rolls/etc.

Fantasy - High, Low, Tolkien, Dark, Gritty, From-the-Farmers, Point-of-Light
Medieval - Arthurian, Westeros, Realistic
Modern - Spy, Crime, Heist, Zombies
SciFi - Star Wars, Star Trek, Firefly
Super Heroes
Post-apocalypse
Western
Dystopia
High School+ - Monsters, Vampires, Super Hero, Aliens, Chosen One, Magical Girl

@subsection{Campaigns}

XXX

@subsection{Characters}

XXX

@subsection{Adventures}

XXX


@section{Advice}

XXX

@section{Resources}

XXX

@section{Acknowledgments}

@(define ACKS empty)
@(define (ack u . t)
(set! ACKS
      (cons (apply link u t)
            ACKS)))

The ideas in this document are inspired by many other great RPGs:
@(apply itemlist (map item ACKS))

@ack["http://www.jwarts.com/thepoolrpg.pdf"]{The Pool RPG}
@ack["http://www.jwarts.com/tqb.pdf"]{The Questing Beast}
@ack["http://www.dungeon-world.com"]{Dungeon World}
@ack["https://www.reddit.com/r/DungeonWorld/comments/76uu6z/we_are_proud_to_announce_worlds_of_adventure/"]{Worlds of Adventure}
