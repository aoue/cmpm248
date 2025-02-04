VAR crow_suspicion_level = 0
VAR crow_flirt_level = 0

==start_crow_convo==
You open the door to face the body of a well-built man dressed in a black suit with leafy grapevine patterns. The body leans against the doorframe, arms loosely crossed. You look up to see the body has the head of a crow, who can surprisingly be described as handsome. His stunning black feathers shone iridescently in the light. His shining dark eyes gazed down at you. You can almost see a smirking expression.

CROW: “How may I help you, darling?”
-(opts)
    * (cutting_to_the_chase)[Ask about air fryer] YOU: "Do you know anything about the air fryer in the shared kitchen downstairs?"
        The crow tilts his head.
        CROW: "Cutting to the chase I see. Let's slow down for a moment and introduce ourselves. My name is Midnight. And yours?"
    *{cutting_to_the_chase}[Cutting to the chase?] Why did he say "Cutting to the chase?" You smell something fishy.
            YOU: "Where were you last night?" you ask.
            CROW: "I was feeling a bit peckish last night and went to the cafe next door to buy something to snack on. I heated it up in the kitchen."
            ~crow_suspicion_level = crow_suspicion_level + 1
            ->location_revealed
    * (impatient){cutting_to_the_chase}[Impatient] YOU: "Mr. Midnight, this is an urgent matter. Please cooperate with me."
            The crow smiles and nods, appearing to agree to cooperate.
    * (introduce){cutting_to_the_chase}[Introduce yourself] You introduce yourself, barely.
        YOU: "I'm the maintenance worker who needs you to cooperate with me."
    * (flirt){not impatient}{not introduce}[Flirt] You smile sweetly.
        YOU: "Is your name Midnight, because you're the crow that's on my mind."
        The crow looks surprised.
        CROW: "My name actually is Midnight. You're making me blush."
        He raises a hand to fan himself while looking at the ceiling.
        ~ crow_flirt_level = crow_flirt_level + 1
    * {flirt}[Sweetly ask] You speak softly with a smile.
        YOU: "Midnight, would you happen to know anything about an air fryer in the shared kitchen?"
            He smiles endearingly.
            CROW: "Why yes, I used it to heat up a snack I bought from the cafe next door."
            ~ crow_flirt_level = crow_flirt_level + 1
            -> location_revealed
    * [Ask about location] YOU: "Where were you last night?"
        CROW: "I was feeling a bit peckish last night and went to the cafe next door to buy something to snack on. I heated it up in the kitchen."
        ->location_revealed
- -> opts

==location_revealed==
- (opts)
    * [Ask about heating] YOU: "What did you use to heat it up?"
        CROW: "I used the air fryer. It did a fantastic job. My food was heated very evenly."
        ~ crow_suspicion_level = crow_suspicion_level + 1
        -> air_fryer_qs
    * [Ask about food] YOU: "What food did you heat up?"
        CROW: "Brownies. Oh, it was so delicious. You should try it. I can take you to the cafe this afternoon for a cup of coffee and some treats."
        He winks at you.
        ~ crow_flirt_level = crow_flirt_level + 1
        -> opts
    * (flirt)[Flirt] YOU: "Do you believe in love at first peck?"
        He stares at you agape. Softly, he whispers.
        CROW: "Would you do the honors?" 
        ~ crow_flirt_level = crow_flirt_level + 1
        -> opts
    * {flirt}[Peck his cheek] You stand on tippy toes to peck his cheek. You still have a mission to accomplish and continue to question him. 
        ~ crow_flirt_level = crow_flirt_level + 1
        -> opts
    - -> air_fryer_qs
    
==air_fryer_qs==
- (opts)
    * (condition)[Air fryer condition] YOU: "Was the air fryer in good condition when you left?"
        He nodded.
        CROW: "Yes, it worked perfectly well when I used it. I made sure to clean up after myself. I wouldn't want to trouble you. Why?"
    * [Others using air fryer] YOU: "Did you see anyone else use the air fryer?"
        He shook his head.
        CROW: "No, I was the only one in the kitchen when I used the air fryer."
        He shrugs.
        CROW: "If someone came after, I wouldn't know."
        ~ crow_suspicion_level = crow_suspicion_level + 1
    * (buttons){condition}[Broken] YOU: "The air fryer was discovered to be broken this morning. Management is trying to find the cause."
        CROW: "My goodness, that's terrible news! It was in pristine condition last night. The buttons on it were gorgeous. I hope it gets fixed soon."
    * {buttons}[Buttons] YOU: "How did you use the buttons?"
        CROW: "I used the button to set the temperature for my food. One satisfying click did the job."
        He nods vigorously.
        CROW: "I will say that the click of the button is very satisfying. I wonder how they made it that way."
        ~ crow_suspicion_level = crow_suspicion_level + 1
    * [This morning] YOU: "Have you gone to the kitchen this morning?"
        CROW: "No, I was just getting dressed when you knocked on the door."
        He straightens his tie.
        CROW: "I am preparing to attend my friend's party. Would you like to be my plus one?"
            ~ crow_flirt_level = crow_flirt_level + 1
        ** [Accept] You smile and nod.
            YOU: "Yes, I can be your plus one. First, help me with this problem."
        ** [Reject] You flat out reject him.
            YOU: "No, I'm very busy. Please answer my questions."
    * {buttons}[End interrogation] ->crow_end_convo
    - -> opts

// this tunnels out of the crow conversation storylet
==crow_end_convo==
You've asked all you needed from the crow. You say your farewell and walk away from the door.
Your boss rings you.
BOSS: "What do you make of that crow guy?"
{
    - crow_suspicion_level < 3 && crow_flirt_level < 2:
        YOU: "He has been very cooperative. I don't think he's supsicious."
        BOSS: "Hmph, keep an eye on him. I don't trust crows."
    - crow_suspicion_level < 3 && crow_flirt_level >= 2:
        YOU: "He has been cooperative. He's very charming as well. I think we got along very well."
        BOSS: "Hmph, he could be stringing you along. Don't fall for his charms."
    - crow_suspicion_level >= 3 && crow_flirt_level < 2:
        YOU: "He's raised a few red flags. He might be the culprit. We'll come back to it later."
        BOSS: "Hehe, he thinks he's clever. Just wait until we catch him."
    - crow_suspicion_level >= 3 && crow_flirt_level >= 2:
        YOU: "He's raised a few red flags. He might be culprit. He keeps trying to distract me with his flirtatious responses."
        BOSS: "Hehe, he thinks he's clever. I'm proud of you for not falling for his charms."
}       
->->

//call this if accusing the crow
==accuse_crow==
You accuse Midnight the Crow to be the culprit of the broken air fryer.
CROW: “Darling, how could you? I thought we had a good thing going.”
He looks appalled by your accusation.
CROW: “Well, that is part of your charm. You’re an elusive one. Always direct and immune to my charms.”
He smiles sweetly at you.
CROW: “I forgive you for accusing me. I won’t give up on you.”
Management attempts to grab him. Suddenly, his body disappears, the suit falling into a pile on the floor. A small black-feathered creature emerges from the pile and quickly flies onto a lamp hanging from the ceiling. It’s a crow with handsome features.
The crow opens its beak, emitting laughter.
CROW: “Yes, I am the one who broke the air fryer. Those buttons were very satisfying to press. I pecked at all the buttons several times to feel that sensation as much as I could. I didn’t imagine that the brand new sturdy air fryer was too weak to handle my love for it. You should invest in a stronger air fryer.”
Midnight the Crow flew out the doors of the hotel.
CROW: “I’ll be back for you my darling!”
You don’t know if you could handle this bird.
-> END

// after this storylet ends, let's say suspicion level needs to be 3 points to accuse the crow