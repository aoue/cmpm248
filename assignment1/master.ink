INCLUDE max_story.ink
INCLUDE crow_storylet.ink
INCLUDE mister_s.ink
VAR num_of_choices = 0

-> very_beginning
== very_beginning ==

    [The Mystery of the Broken Airfryer.]
    
    One fine morning, a crime most grievous was discovered in a particular hotel. One of the public airfryers, available to guests for their use, was found horribly damaged.
    The boss called me in to deal with it.
    BOSS: "Now, listen carefully."
    BOSS: "You need to find who did this."
    BOSS: "And you need to make them pay."
    * [For a new airfryer, you mean?]
    YOU: "For a new airfryer, you mean?"
    - 
    BOSS: "That too."
    BOSS: "But mostly, you need to find them for me."
    He leans back in his chair. It's a wide, imposing chair, and it dwarfs the rest of his office.
    * [Are you sure you don't just want me to fix it, boss?]
    YOU: "Are you sure you don't just want me to fix it, boss?"
    YOU: "Normally, that's what us maintenance folks do."
    YOU: "We just fix stuff. We don't go hunting nobody."
    -
    BOSS: "Normally, that's true."
    BOSS: "However! This is not a normal situation!"
    BOSS: "We have to come down hard on this—right now—or people will think they can do whatever the hell they want to my airfryers."
    BOSS: "And, by extension, the whole property."
    BOSS: "Chaos is, after all, a ladder. The first step is just as serious as the last."
    BOSS: "In other words, a single broken airfryer is anarchy."
    
    * [I get you.]
    YOU: "I get you."
    -
    BOSS: "You're maintenance. Fix this."
    BOSS: "Find them for me."
    He hands you a list.
    BOSS: "The top suspects, all who happen to be guests under our roof right now."
    BOSS: "Sound them out and let me know who's our man."
    
    -> visit_choice
    
    = visit_choice
    
    * [Suspect no. 1, MR S.]
        ~num_of_choices += 1
        -> start_mr_s ->
    
    * [Suspect no. 2, Crow.] 
        ~num_of_choices += 1
        -> start_crow_convo ->
    
    * [Suspect no. 3, Max.]
        ~num_of_choices += 1
        -> start_max ->
        
    
    + {num_of_choices >= 3} [J'Accuse!]
        You know who did it. Accuse them!
        
        **{max_suspicion >= 1} [Max.]
            ->accuse_max
        
        **{mr_s_suspicion >= 3} [MR S.]
            -> sleepwalker_jaccuse
        
        **{crow_suspicion_level >= 3} [The Crow.]
            -> accuse_crow
        
        **[The Boss.]
            -> accuse_boss
    
    - -> visit_choice
    
    -> END

/* 
The one fallback accuse option you always have. 
He's gonna fire you, though.
*/
== accuse_boss
    YOU: "It was you boss! You're the one who broke the airfryer."
    BOSS: "Are you an idiot?"
    * [Wait, what?]
        YOU: "Wait, what?"
    - 
    He shakes his head.
    BOSS: "You are."
    BOSS: "I know I didn't break it."
    BOSS: "Which means you're wrong. And I know you're wrong."
    YOU: "Oh. Well, sorry about that, boss."
    BOSS: "It's fine, I've already forgiven you."
    BOSS: "Also, you're fired."
    * [No way!]
        YOU: "No way!"
    -
    You're escorted from the building by security.
    It's not even lunchtime yet. It feels like it's going to be a very, very long day.
    
    -> END


