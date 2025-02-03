INCLUDE max_story.ink
INCLUDE crow_storylet.ink
INCLUDE mister_s.ink
VAR num_of_choices = 0

-> very_beginning
== very_beginning ==
initial scene.
-> visit_choice

= visit_choice
* [Visit Crow.] 
~num_of_choices += 1
    -> start_crow_convo

* [Visit Max.]
~num_of_choices += 1
    -> start_max
    
* [Visit Room 777]
~num_of_choices += 1
    -> at_door

+{num_of_choices == 3} [J'Accuse!]
    (some other stuff)
*{max_suspicion >= 1} Max
->accuse_max

- -> visit_choice

-> END
