

/* State Variables */
VAR mr_s_suspicion = 0  // A variable counting overall suspicion. Needs to be above a certain number to allow the player to accuse this character at the end of the story.
VAR knows_insurance = 0
VAR knows_travels = 0

LIST susMarkers = POLICEMANS_KNOCK, RIDDLER, REVOLUTIONARY, INSURANCE_LIAR, QUITTER, INFAMOUS, CONFESSION
//~ susMarkers = (POLICEMANS_KNOCK, RIDDLER, REVOLUTIONARY, INSURANCE_LIAR, QUITTER, INFAMOUS, CONFESSION)


=== start_mr_s ===
    You drudge heavily to the door of the next room, 'Room ZZZ.'
    It used to say '777', but someone's written on the plaque with a faded magic marker.
    
    * [Knock politely on the door.]
        - - (not_police)
        You knock politely on the door.
    
    * (police)[Knock officiously.]
        You rap your knuckles against the door in an official sort of way. One that makes it clear you have questions you expect to be answered.
    
    * [Just knock.]
        -> not_police
    
    - 
    "It's open," comes a weak voice from inside. "I'm afraid I can't let you in myself, but please, do come in."

    "I'm terribly sorry." The voice comes again as you step inside. "Things are, I confess, a bit of a mess hereabouts at the moment. I'm afraid my health has been...—and you see I do so rarely have the chance to receive anyone at all these days."
    
    You step into the cramped room and a tall, thin man smiles bashfully at you from beneath the covers of a bed in the center of the room. 
        
    MR S: "Call me MR S. And please, it's not an alias. It's simply my name."
    
    { police: 
        MR S: "And you sir? Are you the police?"
    - else:
        MR S: "I'm sorry, but I don't believe we've met?"
    }

    -> loop

/* The main conversation loop
Will present the player with options based on what has just been said.
Then, will display the sleepwalker's reaction.
Continue until the player ends it or there's nothing else to say.
*/

= loop
    // (Suspicion {suspicion}/5)
    // Tunnel: the character's reaction to what you just said.
    -> sleepwalker_reactions ->
    // Tunnel: If no character reaction, then the character tries to say something for themself
    // -> sleepwalker_topics -> 
    
    //  Thread: the player's immediate reaction option. Will only ever be 1 available.
    <- your_reaction_topics

    // Thread the player's new topic choices.
    <- your_topics
    
    // Finally, after enough topics have been exhausted, the player can leave. 
    //{limitToThree():
    <- i_should_go
    //}
    
    -> DONE


/* For new topics you can bring up with the character */
= your_topics
    * (name) {limitToThree()} [Your name is really just 'S'?]
        YOU: "Your name is really just 'S'?"
        MR S: "Is that so strange, really? I have a friend in Prague, a MR K, who does quite well for himself."
        MR S: "I assure you, there are quite a few men like us. Ordinary men with unordinary names."
        MR S: "Not many, of course. By definition."
        
    * (sleep_mask) {limitToThree()} [Is he wearing a sleeping mask?]
        Is he wearing a sleeping mask? You wonder.
        He is. He's wearing a sleeping mask. What a curious sight.
        
    * (shabby_room) {limitToThree()} [Take in the room.]
        It's a shabby little room. Like all the rooms here, the higher up you go, the smaller and cheaper they are. The seventh floor is near the top. MR S clears his throat.
        MR S: "Please, make yourself at home if you can."
        MR S: "As much as anyone can in a place like this..."

    * (business) {limitToThree()} [Here on business, MR S?]
        YOU: "Here on business, MR S?"
        MR S: "Naturally."
        MR S: "I never travel unless I absolutely must."
        YOU: "And must you often?"
        { knows_insurance:
            MR S: "Oh, a great deal, I'm afraid. You know the insurance business, hardly ever a day in the same place."
        -else:
            MR S: "No, hardly ever."
            ~knows_travels = 1
        }

    * (airfryer) {limitToThree()} [Airfryers.]
        YOU: "Ever use an airfryer, MR S?"
        MR S: "From time to time, I've have had the pleasure."
        He's right it's a pleasure.
    
    * (worst_thing_ever) {airfryer} {limitToThree()} [The crime.]
        YOU: "What's the worst thing you've ever done, MR S?"
        MR S: "... What a question."
        MR S: "... It's that I've waited far too long, I suppose."
        MR S: "Not just here and now, but throughout my entire life. I've always waited for the perfect moment."
        MR S: "But do you know? That moment never comes."
        He laughs.
        MR S: "It's pathetic, isn't it? If one must regret, it should at least be something that one has done."
        YOU: "Mhm."
        YOU: "That's not really what I meant, MR S."
        MR S: "I'm sorry to misunderstand."
    
    * (airfryer_brutality) {worst_thing_ever} {limitToThree()} [The crime, again.]
        YOU: "What's the worst thing you've ever done, MR S... to an airfryer?"
        MR S: "But, what on earth do you mean?"
        YOU: "What? You think airfryers don't have rights?"
        YOU: "That they don't deserve respect?"
        MR S: "Why, not at all! But of course they do!"
        MR S: "Each made thing is a precious thing, as far as I'm concerned!"
    
    - -> loop


/* For threading reaction options to what the character has just said. */
= your_reaction_topics
    * (unordinary) {came_from(-> name)} [By definition of what?]
        YOU: "By definition of what?"
        MR S: "..."
        MR S: "By the definition of unordinary."
    * {came_from(-> unordinary)} [I don't get it.]
        YOU: "I don't get it."
        MR S: "That's... it's not important."
        YOU: "...You like to talk in riddles, MR S?"
        MR S: "Hardly."
        ~ sus()
        ~ susMarkers += RIDDLER
    
    * (sleep_mask_2) {came_from(-> sleep_mask)} [Your sleeping mask, MR S?]
        YOU: "Your sleeping mask, MR S?"
        MR S: "Well, of course it's mine."
        YOU: "..."
        MR S: "..."
        YOU: "I'm not bothering you when you should be sleeping, am I?"
        MR S: "No, no. Of course not."
    * (sleep_mask_3) {came_from(-> sleep_mask_2)} [Won't you take it off?]
        YOU: "Won't you take it off?"
        MR S: "There would hardly be any point."
        MR S: "You see, my eyes are closed."
    * {came_from(-> sleep_mask_3)} [I want to see your face.]
        YOU: "I want to see your face."
        MR S: "That's..."
        MR S: "Do you really?"
        ** [I really do.]
            YOU: "I really do."
            MR S: "... I say."
            MR S: "I'm terribly sorry, but... I shouldn't."
            MR S: "On another day, perhaps."
        ** [Only if it's okay with you.]
            YOU: "Only if it's okay with you."
            MR S: "It... would be, on any other day."
            MR S: "I'm sorry, it's unpardonably rude of me, but I must refrain."
            MR S: "I really must."
        ** [No, nevermind.]
            YOU: "No, nevermind."
            MR S just nods.
        --MR S: "Though perhaps you will see my face one way or another before too long."
        YOU: "What's that supposed to mean?"
        MR S: "I'm going to be famous, I think."
        ~ sus()
        ~ susMarkers += INFAMOUS
        
    * (commendable) {seen_ever(-> not_police)} [I'm with maintenance.]
        YOU: "I'm with maintenance. I keep the hotel running."
        MR S: "That's very commendable of you."
    * (job) {came_from(-> commendable)} [It's just my job.]
        YOU: "It's just my job."
        MR S: "You should be proud of your job, no matter what it is."
    * (insurance) {came_from(-> job)} [What's your job, MR S?]
        ~ knows_insurance = 1
        YOU: "What's your job, MR S?"
        The answer comes out quickly, automatically.
        MR S: "Insurance salesman."
        MR S: "Why? Would you like to buy some?"
    * {knows_travels} {seen_ever(-> insurance)} [I thought you didn't travel, MR S?]
        YOU: "I thought you hardly ever traveled, MR S? And yet you're an insurance salesman?"
        MR S: "Did I? I'm sure I mispoke."
        MR S: "In fact, the opposite is true. I travel a great deal for my work."
        MR S: "...Selling insurance."
        ~ sus()
        ~ susMarkers += INSURANCE_LIAR
    
    * (belief) {seen_ever(-> insurance)} [I don't believe in insurance.]
        YOU: "I don't believe in insurance."
        MR S: "That's very sensible."
        MR S: "Me neither."
    * {came_from(-> belief)} [Why do you sell insurance then?]
        YOU: "Why do you sell insurance then?"
        MR S: "...An excellent question."
        MR S: "I won't be working this job much longer, I think."
        YOU: "What will you do instead?"
        MR S: "Nothing, perhaps."
        ~ sus()
        ~ susMarkers += QUITTER
    
    * (policemans_knock) {seen_ever(-> police)} [I'm not the police.]
        YOU: "I'm not the police. I'm with hotel maintenance. I keep the whole place running."
        MR S: "I see."
        MR S: "Only, I thought you might have been a policeman at first. It's a policeman's knock you have."
        YOU: "First I've ever heard of that. 
        MR S: "Oh yes."
    * {came_from(-> policemans_knock)} [You're familiar with the policemen's knock?]
        YOU: You're familiar with the policeman's knock, MR S?"
        MR S: Well, I suppose I am. Not that I've ever been in trouble with the law, mind you, but one has seen what one has seen of the world. 
        MR S: All parts of it. In all shades.
        ~ sus()
        ~ susMarkers += POLICEMANS_KNOCK
    
    * (shabby_room_2) {came_from(-> shabby_room)} [It's a nice room.]
        YOU: "It's a nice room."
        MR S: "..."
        His silence indicates that he does not think it is, in fact, a nice room.
        MR S: "Ahem, yes. It's enough for me, at any rate."
    * (revolutionary){came_from(-> shabby_room_2)} [...Much nicer than my place.]
        YOU: "...Much nicer than my place."
        MR S: "Oh, I'm sorry."
        YOU narrow your eyes.
        MR S: "Well, it's true."
        MR S: "No one deserves to live in such a—in a place like this."
        MR S: "Much less one somehow worse."
        YOU: "What, you some kind of idealist, MR S?"
        YOU: "A revolutionary?"
        His eyes are suddenly very far away.
        MR S: "When did trying to live in the way that we want become 'revolution?'"
    * {came_from(-> revolutionary)} [Well are you or aren't you?]
        YOU: "Well are you or aren't you?"
        MR S: "A revolutionary?"
        MR S: "I wouldn't say that."
        ~ sus()
        ~ susMarkers += REVOLUTIONARY
        
    * (airfryer_2) {came_from(-> airfryer)} [You like airfryers?]
        YOU: "You like airfryers?"
        MR S: "I suppose so."
        YOU: "Not me."
        You shake your head seriously.
        YOU: "I LOVE 'em."
        MR S: "It's beautiful to love something, don't you think?"
    * {came_from(-> airfryer_2)} [As long as that something's an airfryer.]
        YOU: "As long as that something's an airfryer."
        MR S: "I say, you really do like airfryers, don't you?"
        YOU: "Not me."
        You shake your head seriously.
        MR S: "Oh, my mistake. Of course not."
        MR S: "—You love them."
        YOU: "Exactly right."
        
    * (airfryer_bru_2) {came_from(-> airfryer_brutality)} [Just stare at him.]
        You just stare at him. He's clearly uncomfortable. A sure sign that you're on the right track.
        MR S: "Um."
        MR S: "Why do you ask?"
        YOU: "Someone broke one of the airfryers we keep here."
        MR S: "I say."
        YOU: "A communal one, too."
        He shakes his head sadly.
        MR S: "That kind of thing... it's heartbreaking, really."
    * (airfryer_bru_3) {came_from(-> airfryer_bru_2)} [It was you, wasn't it!]
        YOU: "It was you, wasn't it!"
        MR S: "No! I swear!"
        MR S: "I've been here in my room, trying in vain to sleep! And to shake this sickness of mine!"
        MR S: "I have been quite ill for some days and only recently even well-enough to receive visitors!"
        YOU: "I can see you're sweating. Feeling guilty, MR S?"
        MR S: "I have a fever!"
        MR S: "I have no plans to commit any crime until tomorrow at the very earliest!"
    * (confession) {came_from(-> airfryer_bru_3)} [You can't expect me to believe this.]
        YOU: "You can't expect me to believe this."
        MR S: "It is the truth!"
        His voice grows weak, suddenly.
        MR S: "But, no. Perhaps I do not."
        Ah-ha—practically a confession, if I've ever heard one.
        ~ sus()
        ~ susMarkers += CONFESSION

    - -> loop


/* For direct reactions to what the player has just said */
= sleepwalker_reactions

    // * { came_from(-> police)} ->
    //     came from police.
    
    // * { one_turn_after(-> i_should_go)} ->
    //     if you must, then you must.
        
    // Sticky fallback to make sure we don't get stuck
    + ->
    - ->->
    
/* For when the player is ready to leave the conversation entirely. */
= i_should_go
    * [I should go. (Leave)]
        YOU: "I should go."
        MR S: "Of course."
        MR S: "Thank you for helping me to take my mind away from everything for a while."
        { mr_s_suspicion > 2:
            YOU: "No, it's been my pleasure. I'm sure of it." 
            YOU: "I'll be seeing you."
            MR S: "Oh, surely not."
            YOU: "Oh, MR S..."
            YOU: "Surely, surely, surely..."
            You leave the puzzled MR S behind and close the door.
        - else:
            YOU: "Thanks for your time." test
            MR S: "As I said, you're quite welcome."
        }

    -> sleepwalker_boss_call ->
    ->->

/* For when the player calls the boss on the phone at the end of the conversation with the sleepwalker. */
== sleepwalker_boss_call ==
    You're in the hallway outside room 777. What's next?
    * [Check-in with the boss on the phone.]
        You decide to call the boss.
        YOU: "Hey boss."
        BOSS: "Have you found them yet? The criminal?"
        { mr_s_suspicion > 2:
            YOU: "Well, maybe I have boss."
            YOU: "This guy was one sick freak, let me tell you."
            YOU: "Made my skin crawl."
            BOSS: "Good, good."
            YOU: "I never thought I'd meet someone sick enough to mess up an airfryer."
            -> sleepwalker_boss_call
        - else:
            YOU: "I don't think so, boss."
            YOU: "They were a bit strange, maybe. But not the sick freak we're looking for."
            YOU: "They're not so far gone as to mess up an airfryer, I don't think."
            BOSS: "How disappointing."
            BOSS: "I don't need to remind you what happens if you don't figure this out, I'm sure."
            YOU: "You don't need to. I'm going to crack this one, no matter what."
            YOU: "For myself. For airfryers everywhere."
            BOSS: "..."
            BOSS: "Fine. I'm glad we're on the same page."
            -> sleepwalker_boss_call
        }
    * [Question the next guest.]
        // link to next character
        // -> sleepwalker_jaccuse
        ->->
        

    - ->->


/* Only for when the player accuses the sleepwalker at the end of the game */
== sleepwalker_jaccuse  ==
// LIST susMarkers = POLICEMANS_KNOCK, RIDDLER, REVOLUTIONARY, INSURANCE_LIAR, QUITTER, INFAMOUS, CONFESSION

YOU: "I know who did it, boss! I figured it out!"
BOSS: "You did? You wonderful silly old thing, you!"
BOSS: "This is why I keep you around!"
YOU: "It was that shifty MR S!"

-> accusations
= accusations
    * { susMarkers ? POLICEMANS_KNOCK} [The policeman's knock!]
        YOU: "He said I had a policeman's knock, didn't he?! Well, I say:"
        YOU: "How would he know that unless he was a criminal, eh?"
        YOU: "Must have spent a lot of time getting chased around to get that familiar!"

    * { susMarkers ? RIDDLER} [A riddler!]
        YOU: "He spoke in darn riddles!"
        YOU: "He was always trying to confuse me with his words and such!"

    * { susMarkers ? REVOLUTIONARY} [A revolutionary!]
        YOU: "He was some kind of dangerous revolutionary type of guy!"
        YOU: "Saying stuff about... well, it was all sorts of revolutionary mumbo-jumbo!"
        YOU: "None of it ever makes any sense to anyone!"
    
    * { susMarkers ? INSURANCE_LIAR} [An insurance salesman!]
        YOU: "He was an insurance salesman!"
        YOU: "And he lied about it!"

    * { susMarkers ? QUITTER} [Soon to be unemployed!]
        YOU: "He was going to quit his job, he said! Economic treason!"
        YOU: "He has a duty to produce objects for a set wage!"

    * { susMarkers ? INFAMOUS} [Delusions of grandeur!]
        YOU: "He was crazy, he was! He thought he was gonna become famous or something!"
        YOU: "And what for? He's insane! He's a danger to society!"

    * { susMarkers ? CONFESSION} [He practically confessed!]
        YOU: "He practically confessed to it! Right in front of me!"
        YOU: "He was denying it, but he would, wouldn't he? Guilty as all hell, I just know it!"
    
    + [He was just an all-round bad guy! (finish)]
            YOU: "He was just an all-round bad guy!"
            YOU: "Can we get him, boss?"
            BOSS: "Of course. There's no other choice."
            BOSS: "It's our duty to teach antisocial types like him a lesson before they do any more harm—"
            BOSS: "—or break something more valuable than just an airfryer."
            YOU: "... More valuable than an airfryer?"
            He sighs.
            BOSS: "Well, just try to imagine it. For the sake of argument."
            YOU: "I dunno about that one, Boss..."
            
            MR S ended up paying a two hundred dollar fine for property damage. His security deposit on the hotel room was also confiscated.
            You see his photo the next day in the paper. He took a shot at a public official from the roof of the hotel with an antique rifle, and missed him completely. He received the death penalty and was finally executed sixteen months later.
            He never touched another airfryer.
            -> END
    
    - 
    // Shuffle
    BOSS: "{~!Disgusting!|Unconscionable!|Positively damning!|Hear, hear!|The nerve!|Some people!|Simply unpardonable!}"
    -> accusations


== function sus()
    ~ mr_s_suspicion += 1
    { 
    - mr_s_suspicion == 1:
        ("A somewhat strange man."
    - mr_s_suspicion == 2:
        ("That's a bit suspicious, isn't it?"
    - mr_s_suspicion == 3:
        ("Why does he say it like that?"
    - mr_s_suspicion == 4:
        ("I wouldn't trust him as far as I could throw him."
    - mr_s_suspicion == 5:
        ("This is the kind of sick man who'd break an airfryer."
    - else:
        ("Unconscionably suspicious!"
    }
    <> You think to yourself.)


/* 
Helper functions borrowed from the Overboard example.) 
*/
=== function seen_ever(->x)
    // has this piece of content ever been seen?
    ~ return TURNS_SINCE(x) >= 0 
=== function came_from(-> x) 
    // were you at "x" during this turn
    ~ return TURNS_SINCE(x) == 0
=== function one_turn_after(-> x) 
    // were you at "x" during the last turn (or this one)
    ~ return TURNS_SINCE(x) <= 1 && seen_ever(x)
=== function seen_very_recently(-> x)
    // did we see this line recently?
    ~ return TURNS_SINCE(x) <= 3 && seen_ever(x)


=== function oneChoice(choiceCount) 
    ~ return choiceCount == CHOICE_COUNT()
=== function limitToThree() 
    // Overboard's house style is to limit every moment to 3 choices maximum 
    // We actually do this in the UI, but you can do it in inky if you want to
    ~ return CHOICE_COUNT() < 3 


