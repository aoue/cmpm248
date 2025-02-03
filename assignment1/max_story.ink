VAR max_suspicion = 0
VAR visited_silk = false
VAR visited_persist = false

== start_max ==

Boss: You should go investigate Maximillian Von Profitstein LLC, he is this sly businessman that always stays in my hotel when he is on a businesstrip. I swear I heard noises in the kitchen last night and I swear I saw him running away in a chef hat? Please check on him.
-> talk_to_max

=== talk_to_max ===
You approach the businessman's room, it is a family suite on the fourth floor. You chuckle, it is always the business people that like to show off their wealth and buy rooms unneccessarily too big. The smell of cheap Macy's colone seeps from under the door. You stumble over trays of half-eaten room service food as you put your fist up to knock, dreading the fact that you'll have to clean up this mess once the air fryer is all taken care of.
 *[Knock at the door] -> first_interaction
 
 == first_interaction == 

The door opens. Before you stands a 5'10 man with a puzzling complextion. He is wearing the hotel's custom made "premium package" bathrob, stiched with the worlds finest yellow and purple linen from Bruges, Belgium. Looking at his face you cannot tell if he is 20 or 25, and with the pertruding gut and overfilled muscles it seems to be no secret he is on a steriod cycle. His bare, red feet stand in front of you, it looks like he has done a lot of running recently. He grins back at you with a pearly white smile. He parts his thinning, wet hair in front of you as he begins to speak.

Max: I could've sworn I stopped myself from ordering room service after drinking last night? Oh well, what do I owe you?

His breath smells like Jameson and Crest3D white toothpaste. He begins to pull out a wad of cash. One dollar bills lay within folded 20s.

+ ["I'm investigating the air fryer incident. Know anything?" ]
    -> open_approach

+"Do you even remember last night?"

    -> last_night

+ "Is that robe made of real silk?" 
    -> silk_detour

=== open_approach ===
"Thank you Mr. Profitstein, I am actually here to investi- "

Max: Ah ah ah. Let me stop you there. It is Dr. Maximillian Von Profitstein LLC, I didnt go through 2 years of University of Phoenix's online PhD program to be called "Mister" my whole life.

+ "I'm Sorry" 
Max: Oh come on I'm just joking with you please call me Max!
->ask_about_fryer


==ask_about_fryer==

"I am actually here to investigate our air fryer being destroyed, you wouldn't know anything about this would you?

Max: "An air fyer? I have never heard of such a thing"

+{visited_silk} "Wait how is that possible? you just told me you had a kitchen appliance business!"
Max gulps and begind to sweat profusely.
->jump_through_window

+"It's a kitchen appliance"
Ohh yes yes, I saw one of those in the hotel kitchen the other night.
->persist

==persist==
+"Aha! You were in the kitchen! Tell me exactly what happened. Now"
-> actual_timeline


=== last_night ===
Max: Oh man, you should've been there. I went to the burlesque down the street on a business meeting! It was all fun until APPARENTLY I was supposed to pay because I invited everyone out... thats alright I handled that problem pretty easily. 

You pause for a moment. Burlesque up the street? The only thing on this road is a Burger King and some abandoned buildings. You look in the room behind him and see suitcases being packed even though Max is supposed to stay two more days.

+ "I'll cut to the chase."  
    -> ask_about_fryer

+ ["The burlesque huh?"]  
      
    -> burlesque
    
+ "Leaving so soon?"
 ->leaving_soon
 
 ==leaving_soon==
 "I thought you were staying for the weekend"
 
 Max: That's really none of your business, but if you must know yes something came up last night and I had to change my plans. The wife called me up apparently she left the dishwasher open before her girl's trip to Costa Rica.
 
 +"You went to a burlesque when you have a wife?"
 Now that you mention it ->burlesque
 
 + "Funny because sometime late last night our air fryer was suddenly broken. You wanna try again with where you were?"
 -> actual_timeline
 
 +"Sorry, your right. I will just get to the point." 
 ->ask_about_fryer
 
 ==burlesque ==
 "There is no burlesque up the street. There's just a crummy Burger King that put onions on my whopper when I specifically told them NO ONIONS. Anyways, I'm not buying it.
 
 +"I am willing to bet you messed with the air fryer!"
 ->jump_through_window
 
 +"How about you try again? Where were you last night"
 ->actual_timeline
 
 ==jump_through_window==
 Max flees to the other side of the suite and starts fumbling to get the window open.
 
 As he begins to open the window his linen robe gets caught in the windowseal and traps Max. You thank the Belgium silk for being strong enough to hold him in place without tearing.
 +"Nowhere to go now Max"
 -> caught_in_window
 
 ==actual_timeline==
 Max: Okay, okay I am sorry. I'll tell you. It all happened because of my business partner Reginald Cornelius Stocksworth. You see we weren't at a burlesque or anywhere else for that matter, we were actually at Porterhouse Steakhouse on 41st.
 
 You recall this exact steakhouse, you have been on dates here before.
 
 Max: He demanded scallops. SCALLOPS! At a steakhouse! They weren’t on the menu. The waiter laughed at us. My business partner was not amused.
 
 Max picks up a glass of watered down jack and coke. You wonder if it has been there all night. You also wonder how he pulled a glass of jack and coke out of nowhere. 
 
 Max takes a sip as he stares at the ground, dramatically. He speaks to you with the same tone of someone confessing their problems to a therapist. 
 
 Max: I knew if he didn't have a good dinner there was no way I could close the deal. I had two options: Tell bite the bullet and lose the deal, or lie my way to greatness. So I did what any true businessman would do.
 
 + "You lied." 
 -> lie_and_escape
 
== lie_and_escape ==
 Max: I nodded confidently and said: I know the chef, surely I can convince him to prepare some scallops. Once he sees my muscles, he'll have no choice but to oblige!
 

Max: Then, I stood up, excused myself and began my quest.
-> the_hunt_for_scallops

==the_hunt_for_scallops
Max: I checked every fine dining restaurant in a six-block radius. Do you know how hard it is to find scallops at 11:43 PM on a Tuesday?!

+ "Why didn’t you just tell him the truth?"  
    Max: *Because I am a businessman, not a disappointment.*  
    -> seafood_heist

+ "What happened next?" 
-> seafood_heist

+ "You seem like an incredible businessman. Do you mind if I tell you about my business idea before you continue?
Max: Uhm, sure I guess?
->business_idea

== seafood_heist == 
Max: Desperate, I located a seafood restaurant called "Captain Jimbo’s Maritime Delights", which looked *only slightly* condemned. They had scallops… *but they were frozen solid*.

Max leans in forward, lowering his voice. The smell of toothpaste is gone, only liquor now.

Max: I did what had to be done. I stole the frozen scallops, ran across the city chased by Captain Jimbo's hounds, and broke into your hotel kitchen.

+ "So you put them in the air fryer?"  
    Max: I never said that!  
    -> deflect_and_deny

+ "What did you do, Dr. Maximillian Von Profitstein LLC?"  
    Max: *A strategic heat-based maneuver.*  
    -> deflect_and_deny

=== deflect_and_deny ===
Max: Look, let’s focus on what matters: The scallops were cooked to perfection. You guys have a microwave after all! Theres no evidence that I used the air fryer.

+ "So you used the microwave, successfully delivered the scallops, closed the deal, and the air fryer survived."  
    -> scallop_success

+ "I'm not buying it. Nobody uses microwaves now that air fryers exist. Something happened, and the air fryer… wasn’t fine."  
    ~ max_suspicion += 1
    -> scallop_disaster

+ "Okay, so what happened next then?"
    ~ max_suspicion += 1
    -> scallop_escape

=== scallop_success ===
Max: Exactly right. Against all odds, I delivered the scallops to the chef and demanded he cook them up because Mr. Stocksworth had an allergy to everything else on the menu. I eventually returned to my table and patiently waited. When the waiter gave Mr. Stocksworth his scallops, he took one bite, and was awestruck. After that, he had no choice but to sign the deal.  

Max: And the air fryer? It remains unbroken, unharmed, and more powerful than ever.

You can't help but belive Max, he seemed to have gone through quite the jorney. As an inspiring businessman yourself, you admire his courage and dedication to his business.

-> wrap_up

=== scallop_disaster ===
Max: *Sigh.* Fine. You got me. I used the air fryer and it slightly overheated.  

Max: In my defense, how was I supposed to know scallops were never meant to be superheated at 400°F for twenty minutes. They were frozen solid!

"So you're admitting to the crime?

Max: Absolutely not! I swear it was still making noises when I left! It was working! Plus the deal still went through! I mean, sure, the air fryer overheated. Sure, I had to flee the hotel wearing a chef’s hat as a disguise. But the scallops were delivered, and that’s what matters. Your air fryer was not broken by me!
->wrap_up

=== scallop_escape ===
Max: ...I never made it back.  

Max throws his empty glass on the pile of dishes you are standing next to.  

Max: Remember Jimbo's hounds? They made it into the hotel. With nothing else to grab I unplugged the air fryer and threw it at the dogs. They ran off scared and I picked up the air fryer and plugged it back in. I swear I heard it beep to start up so I know it couldn't have been broken by me.

+"So what happened to the scallops?"
->post_throw

==post_throw==
Max: Well with the sound of dogs and an air fryer being thrown, I heard heavy footsteps coming down the hall. I didn't want to raise attention so I grabbed my frozen scallops and left.

You notice a sense of guilt flowing over Max's face.

Max: I vanished into the night, leaving my business partner alone at the steakhouse. 30 missed calls last night. He still doesn’t know where I am. 

+"So where are the scallops now?"
-> max_on_the_run

==max_on_the_run==
Max: I sold them to buy a plane ticket out of here, hence why I am all packed up. 

"Why not just tell Mr. Stocksworth what happened.

Max: Do you have any idea what it’s like to live in constant fear of a seafood-obsessed billionaire hunting you down? Mr. Stocksworth doesn't like to have his time wasted, and he wants to see me punished for standing him up.

Max: So I couldn’t have broken the air fryer. Because I was too busy running for my life. Sure I threw it, but you know how durable those things are you have to believe me.

You look at Max up and down. You can tell he is a lost man, he will never learn from his mistakes. You know he could've broken the air fryer, but you can't help but believe him a little bit. He just opened up to you about how he fears for his life. Why would you not take his word?

-> wrap_up

=== silk_detour ===
~visited_silk = true
Max: Well, I would assume you know the answer is yes. You do work at this hotel. Anyways I must say you have great taste. Imported from Belgium. I had done work there when I needed cheap labor for a kitchen utility business I ran back in the day.

+ "Kitchen appliances huh? That is kind of what I am here to talk about."
    You see 
    -> ask_about_fryer

+ "I've always kind of respected businessman like you"  
    ->respect
    
==respect==
Max: Oh yeah why is that?

"Out sourcing is the future of business. Why pay employees more when you can get it for cheaper. I am actually starting my own business to get out of this stupid job. I mean my boss has me running around looking for the culprit who broke our air fryer!"
You notice Max has a bead of sweat running down his forehead. Or maybe that is some of the cheap product he uses to keep his hair so slicked back.

+ "Actually, speaking of that air fryer"
->ask_about_fryer

+ "Is that not just ridiculous! Anyways about my business idea[..]"
->business_idea

==business_idea ==
"I plan on having a business called "SockSync™ – The AI-Powered Sock Matching Subscription Service"

Max takes a sigh of relief as you explain your idea.

"You see, Matching socks is a modern nightmare. Laundry day leaves millions of people confused, disoriented, and emotionally drained. Some socks go missing. Others mysteriously shrink. Society has accepted this as just the way things are."

"SockSync™ is a state-of-the-art, AI-driven sock matching subscription service that analyzes, categorizes, and reunites socks using machine learning, blockchain, and a hint of black magic."

Max: Um, how would this technology exactly work?

"Step 1: You ship ALL your socks to our headquarters in Des Moines, Iowa. Location chosen for tax reasons.
Step 2: Our proprietary AI "SockGPT" scans each sock’s texture, fiber density, and "vibe" to determine optimal pair compatibility.
Step 3: Our team of "Certified Sock Technicians™" (CSTs) painstakingly matches, labels, and digitally registers each sock on the Ethereum blockchain to ensure permanent pairing records.
Step 4: Socks are shipped back bi-annually, complete with a SockDNA™ report that includes:
    Temperature history, how warm your feet were
    Environmental data, were they near an air fryer haha
    Sock Horoscopes, your left sock is a Gemini"
    
Max: Wow! This is uh very innovative. How about I offer you some money to get started and we can forget about you coming here in the first place!

+ [Wait, why was I here]
"Wait Dr. Max I have to tell you something" ->ask_about_fryer

+ "Sounds great! Screw my boss and his mismatched socks anyways!"
You take the money. And close the door. Behind the door you here laughing and a vague "I cannot believe it" from behind the wall. ->leave_room

==caught_in_window==
Max: Fine, believe what you want to believe. I didn't break your air fryer, I was simply hot and tried to open the window. Now get out of here before I teach you about my fist-fighting business I opened up.
~max_suspicion +=1
->leave_room

=== wrap_up ===
Max: Listen, do we really have to report this? How about a business deal? I’ll give you the rest of the money I was going to give you for room service.

+ "Bribing me won’t work."  
    Max: I prefer to call it *strategic incentive allocation.*  
    -> leave_room

+ "Deal."  
You take the money. Surely, Max did not commit the crime.
~max_suspicion = 0 
    -> leave_room

=== leave_room ===
*You sigh, leaving Maximillianin in his room.*  

Your boss isn't going to be happy. But at least you got answers.  
...Or at least whatever that was.  

-> END
