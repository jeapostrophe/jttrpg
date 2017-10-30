#lang scribble/base
@(require racket/list
          racket/string
          scribble/manual)

@(begin
   (define DT deftech)
   (define dresult bold)
   (define T tech)
   (define HOW-BIG-HAND 5)
   (define HOW-BIG-HANDs "five")
   (define card bold)

   (define (force-n n l def)
     (append l (make-list (- n (length l)) def)))
   
   (define (chunk n def xs)
     (let loop ([r (list empty)] [i n] [xs xs])
       (cond
         [(empty? xs) (reverse (cons (force-n n (first r) def)
                                     (rest r)))]
         [(zero? i) (loop (cons empty r) n xs)]
         [else
          (loop (cons (cons (first xs) (first r))
                      (rest r))
                (sub1 i)
                (rest xs))])))

   (define (sentence-table num . content)
     (define sents
       (sort (filter-map
              (λ (x)
                (define r (regexp-replace #rx" *$" (regexp-replace #rx"^ *" x "") ""))
                (and (not (string=? "" r)) r))
              (string-split (string-join (flatten content)) "."))
             string<=?))
     (tabular #:style 'boxed
              #:sep (hspace 2)
              #:column-properties '(left)
              #:row-properties '(bottom-border)
              (chunk num "" sents))))

@title{JTTRPG}
@author{@author+email["Jay McCarthy" "jay.mccarthy@gmail.com"]}

This document describes the tabletop role-playing game I play with my
kids and friends. It is deliberately described in an abstract way,
because we apply it to different scenarios and settings as our taste
changes. It attempts to have strategic thinking, with lots of
creativity in general.

@table-of-contents[]

@section{Basics}

This is a game wherein a group of @T{players} (the @T{play group})
collaborately tell a story (called the @T{fiction}) using
@T{mechanical} rules to adjudicate creative disputes and direct the
story in an unexpected direction.

This document refers to the story as the @DT{fiction}. In this game,
the @T{fiction} is the most important part. It is the place where the
action and fun takes place. The @T{play group} should try to be true
to the @T{fiction} at all times and keep it on the front of their
minds. The world of @T{fiction} is called the @DT{flavor} and all
aspects of the @T{fiction} that are not directly @T{mechanical} are
referred to as @T{flavor}.

The @DT{mechanical} rules are the particular rules of the game having
to do with number, cards, statistics, and so on. They exist to
adjudicate disputes between members of the @T{play group}, such as
when one @T{player} wants the hero to save the damsel and another
@T{player} wants the damsel to have already defeated the monster. They
also exist to introduce unexpected happenings in the story, so that
the @T{play group} can discover what happens in the @T{fiction}
through play.

A @DT{play group} is a @T{gamemaster} and multiple @T{leads}
controlled by @DT{players}. A @DT{lead} is an important character in
the @T{fiction} controlled by a human @T{player}. The
@DT{gamemaster} (or @DT{GM}) controls the rest of the universe and
adjudicates between @T{leads}.

@section{Mechanics}

This section explains the @T{mechanical} rules.

The @T{play group} has a deck of normal playing cards, called the
@DT{deck}.The @T{deck} is divided into two partitions: the @DT{draw
pile} and the @DT{discard pile}. At the start of a play session, the
@T{discard pile} is empty and each @T{lead} is dealt a @DT{hand} of
@HOW-BIG-HANDs cards from the @T{draw pile}. When a @T{lead} uses a
card, then it is put in the @T{discard pile}. When the @T{lead}'s
@T{hand} contains fewer than two cards, then they draw up to
@HOW-BIG-HANDs cards from the @T{draw pile}, reshuffling the
@T{discard pile} as the new @T{draw pile} if necessary.

@margin-note{By re-drawing when there is only one card left, this
allows @T{leads} to strategically save high cards for important
circumstances.}

The @DT{suit} of the cards is relevant in play. Each @T{suit}
corresponds to an @T{attribute} and has an @T{opposed suit} based on
the @T{opposed attribute}.

@subsection[#:tag "bm"]{Basic Mechanic}

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

In general, results should always flow from the @T{fiction}. The story
is most interesting when the @T{leads} don't get their way
exactly. So, on a success, the @T{gamemaster} should look for a way to
give the player a hard choice of two good things out of three
possibilities, while on a partial success, they can only choose one.

There are no strict rules for what consequences are. The only
principle is that: on a @T{success}, you get what you want with only
soft consequences@";" on a @T{partial}, you get most of what you want
with maybe a hard consequence@";" and on a @T{failure}, you don't get
what you want and experience hard consequences.

@subsection{Tests}

Each test is associated with an @T{attribute} corresponding to the
kind of action that is being performed, and that action's @T{suit} is
called the @DT{test suit}.

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

@bold{Strategic Note:} @T{Leads} know which cards have already been
played and which have not, so they have a fuzzy estimate of what cards
they may go up against. Similarly, they have an idea of where their
strengths and weakness lay, so they can decide how much to commit to
each action. Given the bias towards @card{Face} cards, they can ensure
some kind of @T{success} when it counts.

@bold{Gamemastering Note:} The @T{gamemaster} never directly opposes
the players strategically, because non-@T{lead}s always have their
card randomly chosen.

@subsection{Lead Statistics}

Each @T{lead} has a few @T{mechanical} concepts associated with them:
@T{attributes}, @T{hit box}es, and @T{tag}s.

@subsubsection{Attributes}

@ack["https://www.kickstarter.com/projects/matthewjhanson/the-fastest-rpg-ive-ever-played-abstract-dungeon"]{Abstract Dungeon}

A @T{lead} has four @DT{attributes}, which are each associated with
various actions and qualities and a @T{suit} in the @T{deck}. Each
@T{attribute} has an @DT{opposed attribute} and an @DT{opposed suit}.

@tabular[
#:style 'boxed
#:sep @hspace[2]
#:column-properties '(center center left)
#:row-properties '(bottom-border ())
(list
 (list @bold{Attribute} @bold{Suit} @bold{Actions and Qualities}
       @bold{Opposed Attribute} @bold{Opposed Suit})
 
 (list @t{@DT{Toughness}}
       @t{@card{Clubs}}
       @t{Strength, Vitality, Constitution, Bend, Absorb, Pry, Throw,
Hack, Slash, Flex, Endure, Break, Bust, Jump, Climb, Swim, Chug,
Sprint, Crush, Push, Pull, Lift, Carry, Hard, etc.}
       @t{@T{Intellect}}
       @t{@card{Diamonds}})
 
 (list @t{@DT{Agility}}
       @t{@card{Spades}}
       @t{Dexterity, Finesse, Escape, Elude, Deflect, Shoot, Skewer,
Dodge, Parry, Balance, Tumble, Roll, Flip, Dance, Weave, Catch, Pick,
Disarm, Stun, Tie, etc.}
       @t{@T{Spirit}}
       @t{@card{Hearts}})
 
 (list @t{@DT{Intellect}}
       @t{@card{Diamonds}}
       @t{Intelligence, Insight, Study, Solve, Riddle, Cast, Think,
Remember, Ponder, Deduce, Reason, Decipher, Invent, Search, Convince,
Debate, Hypothesize, Heal, etc.}
       @t{@T{Toughness}}
       @t{@card{Clubs}})
 
 (list @t{@DT{Spirit}}
       @t{@card{Hearts}}
       @t{Wisdom, Charisma, Disrupt, Channel, Commune, Sense, Pray,
Motivate, Appeal, Empathize, Persude, Convince, Intimidate, Intuit,
Order, Command, Provoke, Seduce, Manipulate, Barter, Sanity, etc.}
       @t{@T{Agility}}
       @t{@card{Spades}}))
]

A @T{lead} has an @DT{attribute modifier} associated with each
@T{attribute}, which is a number between @litchar{-2} and
@litchar{+2}.

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

In principle, @T{hit box}es are not mechnically neccessary because the
@T{tags} themselves are the in-@T{fiction} consequences of failure to
deal with adversity, but they are a useful abstraction to benchmark
failure.

@ack["http://www.story-games.com/forums/discussion/21322/unplayable-fantasy-pbta-fictional-harm-system"]{Fictional Harm System}
@ack["http://www.story-games.com/forums/discussion/19273/a-descriptive-damage-hack-for-dungeon-world-world-of-dungeons/p1"]{Descriptive Damage Hack for Dungeon World}
@ack["https://plus.google.com/100410765634052727875/posts/hDTESC3RDA2"]{Addramyr Palinor
's Google+ post}

@subsubsection{Tags}

A @DT{tag} is a statement, quality, resource, or attribute about a
@T{lead} that separates them from normal people of the world they live
in. Every @T{lead} has a list of @T{tag}s.

For example, a @T{tag} might be ``Can cast fire magic'' or ``Expert
computer hacker''. In the modern world, a @T{tag} would not be ``Has a
cell phone'' or ``Knows about germs'', but these things might be
@T{tag}s in a fantasy world.

Because @T{tags} are free-form statements, they can be positive,
neutral, negative, or any combination, depending on the
circumstances. Avoid very vague @T{tags} and try to be specific.

@T{Tags} can be permanent, temporary, fleeting, disposal, etc,
depending on the particular details of the @T{fiction} and
@T{setting}.

In general, @T{tags} change what a @T{lead} can do and how well they
can do it. For example, in a story about soldiers, having a rifle is
likely not to be a @T{tag}, but ``Lost his rifle'' might be a @T{tag},
with the effect of disallowing the @T{lead} to fire. For example, in a
story about Greek myths, being a demigod is a @T{tag}, but speaking
Greek is not. For example, in a fantasy story about dungeons and
delves, having a sword might not be a @T{tag} but ``Has the mystical
blade Vorpalice'' is a @T{tag}.

@T{Tags} should have both @T{mechanical} and @T{flavor}
significance. They should influence how success @T{leads} are, what
they can do, and what their goals, desires, and passions are.

Periodically throughout play, new @T{tags} should be given. They
should be positive and negative @T{consequences} for individual
actions, as well as a result of pivotal story moments.

@subsection{Modifiers}

When a @T{lead} faces a @T{test} and plays a card, the incorporate a
variety of @DT{modifiers} to the value of the card.

First, they incorporate the @T{test suit} of the action. If the
@T{suit} of the card played matches the @T{test suit}, then a
@litchar["+1"] modifier is applied. If the @T{suit} of the card played
matches the @T{opposed suit} of the @T{test suit}, then a
@litchar["-1"] modifier is applied.

@bold{Example:} Alexa tries to sneak past the guards on her way into
the mansion. She plays a @card{Ten of Spades}, so it is equivalent to
a @card{Jack of Spades}, because @card{Spades} is the @T{test suit} of
sneaking. Thus, a @T{partial} is guaranteed, because she plays
a @card{Face} card.

Second, they incorporate the @T{attribute modifier} of the action.

@bold{Example:} Stewart tries to decipher the ancient writing. He
plays a @card{Queen of Clubs}, but it is considerate as a @card{Ten of
Clubs}, because it is in the @T{opposed suit} and he has a
@litchar["-1"] @T{attribute modifier} for @T{Intellect}. Thus, his
is not guaranteed a @T{partial}.

Third, they incorporate any applicable @T{tags}. A @T{tag} may imply
that an action is easier or harder for the @T{lead}. If it is easier,
then a @litchar["+1"] modifier is applied. If it is harder, then a
@litchar["-1"] modifier is applied.

@bold{Example:} Elizabeth tries to commune with the ghost of The
Jackal. She plays a @card{Queen}, but because she possesses the @T{tag},
``Speaker for the dead'', it is as though she played a @card{King} and
her @T{success} is guaranteed.

@subsection{Lead Creation}

When you create a @T{lead}, you should start by defining the @T{flavor} of
the character. Then, select the following @T{mechanical} details:

@itemlist[#:style 'ordered

@item{@T{Attribute modifiers} --- Choose a modifier for each
@T{attribute}. They should total to @litchar["+0"] for a low-power
story, @litchar["+1"] for a high-power story, and @litchar["+2"] for
an epic story.}

@item{@T{Hit box}es --- Choose a number between @litchar["2"] and
@litchar["4"]. A normal person would have @litchar["1"], but @T{leads}
are typically exceptional, so a weaker @T{lead} still has
@litchar["2"]. Someone truly sturdy has @litchar["4"].}

@item{@T{Tags} --- Choose a few @T{tags}, focusing mainly on positive
or generally descriptive ones. Add one or two negative @T{tags}.  You
should have one or two for your archetype and background, one or two
for a special quality, and one or two for any special resources.}

]

@bold{Example:} Sally Summers is the Zombie Slayer, an mythical role
filled each generation by one teenage girl in all the world. She
fights with the enchanted whip, @italic{Lightbringer}, and has a
mystical connection to the spirits of past Slayers. Her attribute
modifiers are @litchar["+1"] @T{Toughness}, @litchar["+0"]
@T{Agility}, @litchar["+0"] @T{Intellect}, and @litchar["+0"]
@T{Spirit}. She has @litchar["3"] @T{hit box}es. Her initial @T{tags}
are, ``The Zombie Slayer'', ``Possesses @italic{Lightbringer}'',
``High school girl'', ``Prideful'', and ``Mystic knowledge from past
lives''.

@bold{Variant Note:} The @T{hit box} suggestion above is tuned for
representing short-term adversity, like damage and fighting spirit. If
instead you wish to represent long-term adversity, like general health
and mental wellness, you will want to tweak the scale. You want to
have both kinds of @T{hit box}es, although normally long-term
adversity shows up in the form of @T{tags}.

@subsection{Actions}

There are no strict rules for @DT{actions}. In general, describe the
activity in the @T{fiction}, then apply the @secref["bm"] and think
critically about what @T{attribute} is appropriate and what @T{tags}
apply.

The @T{consequences} of @T{tests} may have @T{mechanical} impacts. In
particular, it is common that a @T{consequence} is to gain or lose a
@T{tag} or to fill in a @T{hit box}.

@bold{Example:} Sarai fails to convince the border guards of her
identity, so her supplies are stolen and she is forced back into the
wilderness. She adds the ``Basic goods stolen'' @T{tag}. (She did not
have ``Possesses basic goods'' before because this can be assumed. The
unique circumstance is missing these things.) Later, when she visits a
frontier town and works for the tavern, she removes this @T{tag}
because she is back on her feet.

@bold{Example:} Joffrey fires a flurry of arrows at the approaching
vampire horde, but fails miserably. He adds the @T{tag}, ``No more
arrows'', and thus can no longer use his long bow.

Inside of single scenes and stories, it should be common to introduce
and remove @T{tag}s for all of the @T{lead}s.

@subsection{Combat}

There is no need to treat combat encounters and combat actions
differently than other scenes and @T{actions}. However, if your
@T{play group} wants something slightly more @T{mechanical}, use the
ideas in this section.

@bold{Initiative.} At the beginning of a combat scenario, have each
@T{lead} use a card that represents their readiness for the fight
and (potentially) draw cards for non-@T{lead} participants. The
relative ranking of the cards will determine the order in which
subsequents actions take place.

@bold{Preparation.} Use the @bold{Initiative} card as a constant
@T{modifier} throughout the battle: Add it to all cards that are used.

@bold{Range.} As an in between point to a purely verbal battleground
and the highly detailed miniature-oriented play of a board game, use
an abstracted battleground with abstract areas like, @italic{Close
Quarters}, @italic{Behind}, @italic{Flanking}, @italic{The Fray},
@italic{In The Distance} etc. Use @T{actions} to move from one to
another. Make it impossible to use @T{actions} on targets in distant
areas. Give a @litchar["-1"] @T{modifier} for using @T{actions} in
adjacent areas.

@section{Flavor}

This section gives advice on choosing the @T{flavor} of the
@T{fiction}. There are no strict rules here, so just be inspired and
have fun.

We divide our discuss into four sections:
@itemlist[#:style 'ordered

@item{@secref["flav-set"] --- The world in which the @T{fiction} takes
place.}

@item{@secref["flav-char"] --- The @T{lead} characters of the
@T{fiction}.}

@item{@secref["flav-camp"] --- The overall narrative of the entire
@T{fiction} that stretches across all of the occasions the @T{play
group} meets.}

@item{@secref["flav-stories"] --- The narratives of each individual
session of play.}

]

@bold{Advice:} I recommend thinking about the @T{flavor} in this
order, but it is not strictly necessary. I normally start a new
@T{play group} with a discussion of what kind world they want to play
in. Then, we talk about who the stars of the story (@T{leads})
are. Next, we think about the overall kind of story we want to
create. Then I start thinking about what each of the component stories
will be.

@subsection[#:tag "flav-set"]{Settings}

I normally start by picking an existing work of fiction that I want to
start from and going from there. Other times, I like to answer a
serious of questions that describe the contours of the world.

@bold{Style.} What style of world is it?
Fantastic. Silly. Gritty. Realistic. Optimistic. Pessimistic. Mythic.

@bold{Period.} When does the @T{fiction} take place?
Jurassic. Modern. Old West. Futuristic. Medieval. Dark Ages. Bronze
Age. Mythic. Iron Age. Space-Age. Age of Sail. Cold War.

@bold{Special Qualities.} What are some special things about the
world? Super Heroes. Post-apocalypse. Dystopia. Magic. Time-travel.
Zombies. Dinosaurs. Vampires. Aliens. Monsters. Points-of-Light. Talking
Animals.

@bold{Scale.} What is the scale of the world that the @T{fiction}
takes place in? Small town. City. High school. Colony
Ship. Planet. Continent. Country. Galaxy.

@bold{Genres.} Does the @T{fiction} fit an existing genre? High
fantasy. Comic fantasty. Contemporary fantasy. Spiritual fantasy. Bug
hunt. Space
opera. Weird. Horror. Pulp. Slasher. Baroque. Supernatural. Ghost
stories. Mystery. Espionage. War. Western. Martial
Arts. Egyptian. Ancient Greece. Weird West. Space 1889. Weird War
III. The Dark Elder Gods. The Dark Continent.

@subsection[#:tag "flav-char"]{Characters}

The most important part of the @T{fiction} is the characters and the
setting just exists to place them on a canvas. When coming up with
characters, think about a few different things:

@bold{Archetype.} What story archetype do they fulfill? The Chosen
One. The Outsider. The White Knight. The Dark Prince.

@bold{Background.} Where do they come from? A small town. The royal
family. The best school. An orphan. From another place.

@bold{Code.} What standards to they uphold as a guiding force in their
life? Uphold the law. Never lie. Family. Duty. Honor. Survival of the
fittest. Loyalty.

@bold{Motivation.} What motivates their actions in the story? What do
they quest for? Revenge. Glory. Honor. Duty. An ancient
artifact. Family. Love.

@bold{Job.} What is their job? Police officer. Scientist. Solider. Cook.
Researcher. Librarian. Advisor. Diplomat. Trader. Guard. Knight. Retail.

@bold{Training.} What special training do they have?
Weapons. Science. Magic. Computers. Research. Geography. Animals.

@subsection[#:tag "flav-camp"]{Campaigns}

Once you know the world that you are in, you should determine the
whole story of the @T{fiction}. I like to think of the campaign as a
season of a TV show. Here are some ideas.

@bold{War.} There is a war that has started or will star and the
@T{lead}s need to do something to stop it, win it, turn the tables,
etc.

@bold{Exploration.} The world is much bigger than the @T{lead}s
realized and they are driven to explore it and see the undiscovered
country.

@bold{Quest for the.} There is some important artifact in the world
that must be found, acquired, used, or brought to safety. Do they know
where it is? Do they know what it is?

@bold{Hero's Journey.} The @T{lead}s must leave comfort and undergo
trials before they return.

@bold{The Big Bad on the Horizon.} There is a big bad on the horizon
that must be prepared for and stopped.

@subsection[#:tag "flav-stories"]{Stories}

Your campaign is many of many stories. I like to plan a few key
moments and the kinds of things that need to happen, then let the
@T{fiction} lead some place interesting. If the campaign is a season
of a TV show, then each story is an episode. Most episodes will be
self-contained, but push the greater arc of the story too. Think about
having ``specials'' that incorprate interesting and different styles
as you go.

@section{Advice}

This section has a smattering of advice across the whole play
experience.

@subsection{Roleplaying Tips}

Have focus and keep to the point of the moment of narration. Be
concise and let others play.

Respect the other @T{lead}s and don't alter their behavior
significantly from their established patterns.

Stay consistency with the setting, campaign, and established parts of
the story. Occasionally a ret-con or plot-twist is appropriate.

Use a timer sometimes to make a moment tense and give the @T{leads}
only a short time to react.

Whenever you draw a @card{Joker}, have something unexpected happen!

You can play without a @T{gamemaster} by collaboratively filling their
role: any time you feel the need for a @T{gamemaster}, have the person
to the left of the @T{lead} in focus act as one temporarily. If you
remember to share the spotlight and respect each other, then it should
go smoothly. The major downside is that there will not be secretly
planned plot twists... or will there?

@subsection{Campaigns}

XXX hero's journey
XXX mcguffin
XXX when to gain a tag

XXX Overcoming the Monster, Rags to Riches, The Quest, Voyage and
Return, Comedy, Tragedy, Rebirth,

@subsection{Stories}

XXX clues
XXX resources
XXX gain a tag

@subsection{Characters}

Use what other roleplaying games call ``classes'' to inspire your
characters. Here's a huge number of ideas:

@sentence-table[4]{ Knight. Lady. Knight-at-heart. Troubled
Princess. Sorceress. Peaceful Monk. Daughter of the Earth.
Barbarian. Spy. Angel. Battle
Babe. Brainer. Chopper. Driver. Hardholder. Gunlugger. Gunslinger. Hocus. Techie. Skinner. Operator. Healer. Warrior. Weapon
Expert. Rogue. Jack of All Trades. Mage. High-born. Slayer. Vampire
Killer. Chosen One. Low-born. Mystic. Devout Acolyte. Errant
Occultist. Magician's Apprentice. Adventurer. Rune
Caster. Ranger. Vagabound. Outrider. Dragoon. Performer. Future
Warlord. Forgotten Child. Novice Templar. Gifted Dilettante. Noble's
Daughter. Reformed Bully. Self-Taught Mage. Untested Thief. Village
Hero. Heir to Legend. Would-be Knight. Woodsman. Angsty Shadow
Warrior. Chosen Visitor. Conniving Thief. Dumb Fighter. Explosive
Mage. Half Dragon. Cyborg. Monster. Mad Warlord. Nutjob Cleric. Pure
Sacrifice. Shiny Paladin. Tweaky Shaman. Magical Girl. Useless
Bard. Dark Blade. Shadow Assassin. Umbral Warrior Mage. Chosen
Seer. Ordinary Kid in Fantasy World. Plucky Hero. Sacred
Machine. Ancient Machine. Charming Knave. Clever Treasure
Hunter. Slimy Cutpurse. Big Bruiser. Legendary Hero. Clever
Swordsman. Sexy Sorceress. Sneaky Mage. Mystic Maniac. Little
Monster. Sexy Dynamite. Brutal Captain. Captain Charima. War
Diva. Master Tactician. Battle Priest. Holy Invoker. Mad
Preacher. Holy Dancer. Pure Divinity. Willful Scion. Mad
Oracle. Charismatic Warrior. Charming Champion. Unrelenting
Good. Adorable Wild Child. Feral Weirdo. Noble
Druid. Shape-shifter. Fragile Rock Star. Prissy Minstrel. Unrelenting
Bard. Dragon Master. Guardian Angel. Magitek
Knight. Professor. Martial Artist. Monk. Karate
Fighter. Inventor. Kung Fu Warrior. Magic Knight. Blue Mage. Red
Mage. White Mage. Black Mage. Beastmaster. Wilding. Fearless
Leader. Driver. Marksman. Archer. Investigator. Detective. Pilot. Pirate. Scientist. Android. Atlantean. Pilgrim. Acrobat. Assassin. Holy
Warrior. McGyver. Mentalist.}

Use these tropes to come up with your character concept, as well as
your initial set of @T{tags}. You can also think about unique items
and attributes as another axis of @T{tags}. Here are some ideas:

@sentence-table[4]{ Magical Sense. Sword of Pure Darkness. Vanish into
another Dimension. Earth Gadget. Future Tech. Item out of
Time. Knowledge out of Time. Mysterious Power. Seedy
Connections. Legendary Sword. Oblivious to Manipulation. Special
Insight. Magical Little Friend. Flight. Great Store of Wealth. Fire
Breath. Ridiculously Strong. Ridiculously Old. Squad of
Retainers. Divine Visions. Healing Touch. Royal Privilege. Magical
Horse. Speak to Animals. Commune with Spirits. Has a Guardian
Angel. Haunted. Hunted. Unique
Cybersuit. Attractive. Ambidexterous. Brave. Linguist. Noble. Lucky. Ace. }

A further way to create interesting characters is to connect them to
each other and other people out in the world. Here are some ideas:

@sentence-table[2]{ They accidentally summoned you. You are
siblings. You have a dark secret that even you don't know. You were
friends as kids. They have a crush on you. They have a magical
artifact that affects you. They are actually your parent. They killed
your family member. A dark power sent you to them. You trained
together. You are secretly buddies but publicly enemies. You were
lovers. You are obssessed with them. You were set up with them,
but…. They brought you out of the darkness. A dark power is after them
and only you know. They showed up on Earth and are responsible for
what happened to you. They took something from you. You had to find
them to save the world. They welcomed you when you came here for the
first time. They helped you do something shady once. They are
convinced you stole something from them. If you don't steal it,
someone will come after you. They are your rival. You've been through
thick and thin together. They constantly undermine you. They know
about your true destiny, but you don't. They want you to cast the
final ritual. They were apprenticed with you, but weren't as good as
you. You accidentally blew something up important to them. They fear
you will interfer with their plans. Your parents asked them to take
care of you. You are hopelessly in love with them. They served you in
the last war. You must acquire it at all costs. You were supposed to
receive it, but it was denied. They are your biggest fan. You know you
must protect them. They are wrong and need to know it. You were
commanded to do something you don't want. What you believe is
wrong. They are your sworn protector. They are destined to sacrifice
you. You need it to fulfill your destiny. They need your
guidance. They owe you for saving their life. Your holy quest is to
find it. They are in great danger. You protected them when they were
stranded. You know the legend of their past or future. }

Another way to think about your character is the dramatic situation
they find themselves in. This can define the character, a story, or
even the whole campaign.

@sentence-table[2]{
Supplication. Crime Pursued By
Vengeance. Pursuit. Obtaining. Self-sacrifice For An
Ideal. Deliverance. Daring Enterprise. Returners. Abduction. The
Engima. Recovery of a Lost One. Vengeance Taken For Kin Upon
Kin. Enmity of Kin. Rivalry of Kin. Slayer of Kin
Unrecognized. Self-sacrifice for Kin. Necessity of Sacrificing Loved
Ones. Discovery of the Dishonour of a Loved One. Loss of Loved
Ones. Disaster. Revolt. Rivalry of Superior vs
Inferior. Ambition. Conflict with a God. Fallying Prey to
Misfortune. Madness. Fatal Imprudence. Erroneous
Judgement. Remorse. Murderous Adultery. Involuntary Crimes of
Love. Sacrifice for Passion. Adultery. Crimes of Love. Obstacles to
Love. An Enemy Loved. Mistaken Jealousy.
}

@subsection{Consequences}

The @T{gamemaster} should try to use @T{failure} to spin new ideas
into the story. Don't just have the obvious thing go wrong, but do
something new:

@sentence-table[3]{ Add a complication. Reveal future trouble. Capture
someone. Reintroduce an old foe with a new face. Reveal some
lore. Tempt them. Provide a clue. Take something away. Withhold, ruin,
or replace something they have. }

@subsection{Actions}

When @T{leads} take @T{actions}, it is more interesting to give the
@T{player} hard choices for how to put their @T{consequences} into the
@T{fiction}. Here are some templates for different kind of actions:

@(define (action what fail-o partial-o succ-o [opts #f])
   "XXX")
@(define (actions . x) "XXX")

@actions[
@action["Resist Temptation"
        "Indulge"
        "Contain yourself, but everyone see's what's going on."
        "You manage to resist and keep it quiet."]
@action["Defy Danger"
        "Fail and face adversity."
        "Your standing, but in trouble."
        "You're safe."]
@action["Kick Butt"
        "Fail and be put into danger."
        1 2
        (list "Put them in danger."
              "Deal damage"
              "Gain the upper hand.")]
@action["Run Away"
        2 1 "Get away"
        (list "Leave something behind."
              "Get caught."
              "Your escape was noticed."
              "Your escape is temporary.")]
@action["Spout Lore"
        1 "Some details elude you." "You know what's going on."
        (list "Your understanding is subtly wrong in a dangerous way."
              "Your understanding is obviously wrong in an embarrassing way.")]
@action["Steal"
        "You are caught." 1 2
        (list "You take what you wanted."
              "They didn't see you do it."
              "You keep them from coming back for it."
              "You seriously deter them.")]
@action["Trick"
        "They realize what you're doing and are hostile."
        1 "They are suckered."
        (list "They don't do quite what you wanted."
              "After they do it, they know they've been tricked.")]
@action["Help"
        "You hinder them." 1 "You help them."
        (list "There are unwanted consequences of the help."
              "You expose yourself to danger.")]
@action["Buy Stuff"
        "You don't get what you want or can't afford it after you take it and there's retribution."
        2 1
        (list "You lose a resource related tag or gain a poverty related tag."
              "There is a problem with what you got."
              "You drew unwanted attention.")]
@action["Ritual"
        (cons 2 #f) (cons 1 1) (cons #f 2)
        (cons (list "You face adversity." "There's a dangerous side-effect"
                    "It does something humiliating." "You get a negative tag.")
              (list "You manage to do it without getting hurt."
                    "The effect is as expected."
                    "A valuable resource is not consumed."))]
]

@section{Resources}

XXX character sheet
XXX rule quick reference
XXX abstract battle map

@section{Acknowledgments}

@(define ACKS empty)
@(define (ack u . t)
(set! ACKS
      ;; XXX Sort
      (cons (apply link u t)
            ACKS)))

The ideas in this document are inspired by many other great RPGs:
@(apply itemlist (map item ACKS))

@ack["http://www.jwarts.com/thepoolrpg.pdf"]{The Pool RPG}
@ack["http://www.jwarts.com/tqb.pdf"]{The Questing Beast}
@ack["http://www.dungeon-world.com"]{Dungeon World}
@ack["https://www.reddit.com/r/DungeonWorld/comments/76uu6z/we_are_proud_to_announce_worlds_of_adventure/"]{Worlds of Adventure}
@ack["XXX"]{Apocalypse World}
@ack["XXX"]{Beyond the Wall}
@ack["XXX"]{Dragon World}
@ack["XXX"]{No Dice RPG}
@ack["XXX"]{Savage Worlds}

XXX Worlds of Adventure

XXX Dungeon World

XXX Final Fantasy and Dragon Quest jobs
