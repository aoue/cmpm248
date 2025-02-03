INCLUDE crow_storylet.ink
INCLUDE max_story.ink
INCLUDE mister_s.ink

-> very_beginning
== very_beginning ==
initial scene.
-> visit_choice

= visit_choice
* [Visit Crow.] 
    -> start_crow_convo

* [Visit Max.]
    -> start
    
* [Visit Room 777]
    -> at_door

+ [J'Accuse!]
    (some other stuff)

- -> visit_choice

-> END
