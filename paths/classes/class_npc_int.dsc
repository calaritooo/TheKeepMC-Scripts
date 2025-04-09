peterinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains fort_wakers && 15 in <player.groups> && !<player.has_flag[peter]>:
                    - if <player.flag[quests]> !contains <script[class_list].data_key[classes]>:
                        - if !<player.has_flag[classes]> || <player.flag[classes].is_empty>:
                            - chat "Interested in hearing about what Wayfair Keep can offer you? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                            - zap 2
                        - else:
                            - chat "Looks like you've already initiated in a class. If you'd like to change, denounce your current one and come back!"
                    - else:
                        - chat "You're already initiated, you'll need to finish your last task and let your trainer know you want to change!"
                - else if <player.has_flag[peter]>:
                    - chat "I already let the <player.flag[peter].to_titlecase> trainer know you were coming. If you're no longer interested in their class, let them know and come back."
                - else:
                    - narrate "<&c>You aren't ready to start a class! You must be at least rank 15 and have Fort Wakers unlocked."
        2:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "That's great! By now you may have heard mention of 'classes', yes? Well that's precisely what we train at the Keep."
                    - wait 3s
                    - chat "I can tell you about each one and see if we can't get you in training by tomorrow. What do you say? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "I'll be here!"
                        - chat "Let me know if you're interested some other time."
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y|/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Alright, which class would you like to hear about?"
                    - wait 2s
                    - narrate "<&f>1. <&7><element[Archer].click_chat[archer]>"
                    - wait 0.5s
                    - narrate "<&f>2. <&7><element[Swordsman].click_chat[swordsman]>"
                    - wait 0.5s
                    - narrate "<&f>3. <&7><element[Axeguard].click_chat[axeguard]>"
                    - wait 0.5s
                    - narrate "<&f>4. <&7><element[Shroud].click_chat[shroud]>"
                    - wait 0.5s
                    - narrate "<&f>5. <&7><element[Scholar].click_chat[scholar]>"
                    - zap 4
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "I'll be here!"
                        - chat "Let me know if you're interested some other time."
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /archer/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "The Archer is a tricky one, they need to be light and quick at all times. Using the bow as their main weapon, they aren't known for leaving survivors."
                    - wait 3s
                    - chat "Wayfair Archers possess skills unique to the keep, including revealing hidden enemies, vanishing into thin air, and landing arrows of all types imaginable."
                    - wait 3s
                    - chat "So what do you think? Is this the class for you? <&f>(<&7><element[y].click_chat[archer]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 5
                2:
                    trigger: /swordsman/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "A Swordsman is among the most disciplined of the Isles. Using the sword as their main weapon, good luck dodging a swing from these guys."
                    - wait 3s
                    - chat "Wayfair Swordsmen often train directly in the field with skills granting them the upper hand against one, three, or even ten enemies all at once!"
                    - wait 3s
                    - chat "So what do you think? Is this the class for you? <&f>(<&7><element[y].click_chat[swordsman]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 5
                3:
                    trigger: /axeguard/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "As you've probably guesses, Axeguards are most proficient with an axe in their hand. Though their most important tool, their best compagnon is their horse."
                    - wait 3s
                    - chat "Wayfair Axeguards belong to a special order with a historic lineage, passing down abilities ranging from wide, sweeping blows to being the fastest riders of the Isles."
                    - wait 3s
                    - chat "So what do you think? Is this the class for you? <&f>(<&7><element[y].click_chat[axeguard]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 5
                4:
                    trigger: /shroud/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "To be honest, I don't know much about the Shrouds. They keep to themselves, as their oath demands it. They are terrifying in numbers, only scarier when they're alone."
                    - wait 3s
                    - chat "Wayfair Shrouds swear to the highest ranks of the Isles, carrying out missions with skills rendering them naked to the eye, undetectable until it's too late."
                    - wait 3s
                    - chat "So what do you think? Is this the class for you? <&f>(<&7><element[y].click_chat[shroud]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 5
                5:
                    trigger: /scholar/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Ah.. you're looking for something a bit fancier. Scholars are the spellcasters, sorcerers, and wizards of the realm. I say realm because unfortunately we don't train them anymore."
                    - wait 3s
                    - chat "After... an incident.. they were 'removed' from the Keep and have since kept their studies private as the so-called 'Eldridge Castle'."
                    - wait 3s
                    - chat "Let's say that officially I can not help you further. But if you were to be interested, I know a guy who could?" <&f>(<&7><element[y].click_chat[scholar]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 5
        5:
            chat trigger:
                1:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Okay, do you wanna hear a bit about another class? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /archer/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "If you think this is your fit, you'll need to just talk to my colleague <italic>Elarik<reset> in Camp Cinder at the range. He'll help you get started!"
                    - flag <player> peter:archer expire:1d
                    - zap 1
                3:
                    trigger: /swordsman/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "If you think this is your fit, you'll need to just talk to my colleague <italic>Lieutenant Greene<reset> over at the pit in Camp Cinder. He'll help you get started!"
                    - flag <player> peter:swordsman expire:1d
                    - zap 1
                4:
                    trigger: /axeguard/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "If you think this is your fit, you'll need to just talk to my colleague <italic>Logan<reset>at Dockman's in Shaleight Township. He'll help you get started!"
                    - flag <player> peter:axeguard expire:1d
                    - zap 1
                5:
                    trigger: /shroud/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "If you think this is your fit, you'll need to just talk to my colleague <italic>Medalia<reset> at the Gazebo in Shaleight Township. She'll help you get started!"
                    - flag <player> peter:shroud expire:1d
                    - zap 1
                6:
                    trigger: /scholar/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "If this ever gets back to me, I'll know who it was. That being said, here in the cells you'll find locked away the Scholar mentor from before the.. incident."
                    - wait 3s
                    - chat "Let him know Peter sent you and he can help you."
                    - flag <player> peter:scholar expire:1d
                    - zap 1

petrainteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.has_flag[classes]> && <player.flag[classes].any>:
                    - foreach <player.flag[classes].keys> as:class:
                        - define player_class_<[loop_index]> <[class]>
                - if <player.has_flag[petra]>:
                    - define init_class <player.flag[petra]>
                    - if <[init_class]> == <[player_class_1]>:
                        - chat "I heard you were coming. Welcome to Wayfair Keep, I'm Petra."
                        - wait 1.5s
                        - chat "To arrive here, you completed various tasks given to you by your initiating trainer. Here, you will meet your class mentor, who will guide you until they believe you to be ready."
                        - wait 3s
                        - choose <[init_class]>:
                            - case archer:
                                - chat "Rue is your mentor. She's the best archer we've seen for centuries, you're lucky to even speak to her. You're even luckier she treats her novices with respect."
                                - wait 3s
                                - chat "Before you begin, the uniform is optional, but our sets are what will serve you best. Your skills are your tools, but your bow is your weapon. Keep that in mind."
                                - wait 3s
                                - chat "You'll find Rue anf the other archers in the towers. Dormitories and common spaces are in the walls of the castle, or as we say, the wings."
                                - wait 3s
                                - chat "That's it... off you go now."
                                - flag <player> petra:!
                            - case swordsman:
                                - chat "Mirea is your mentor. She's decisive and clear, but getting anything past her is an uphill battle we've all lost once or twice."
                                - wait 3s
                                - chat "Before you begin, the uniform is optional, but our sets are what will serve you best. Your skills are your tools, but your sword is your weapon. Keep that in mind."
                                - wait 3s
                                - chat "You'll find Mirea in the main block of the Keep. Dormitories and common spaces are in the walls of the castle, or as we say, the wings."
                                - wait 3s
                                - chat "There're no fees, you'll even earn a few talons here and there, as long as you keep your eyes and feet forward. That's it... off you go now."
                                - flag <player> petra:!
                            - case shroud:
                                - chat "Septu is your mentor. He's off-putting... at first, a little strange honestly. Rumor has it that he warms up to you though."
                                - wait 3s
                                - chat "Before you begin, the uniform is optional, but our sets are what will serve you best. Your skills are your tools, but your wit is your weapon. Keep that in mind."
                                - wait 3s
                                - chat "You'll find Septu in the basement of the Keep. Dormitories and common spaces are in the walls of the castle, or as we say, the wings."
                                - wait 3s
                                - chat "There're no fees, you'll even earn a few talons here and there, as long as you keep your eyes and feet forward. That's it... off you go now."
                                - flag <player> petra:!
                            - case axeguard:
                                - chat "Hannigan is your mentor. He's the best rider in the Isles, sure to show you a few tricks."
                                - wait 3s
                                - chat "Before you begin, the uniform is optional, but our sets are what will serve you best. Your skills are your tools, but your axe is your weapon. Keep that in mind."
                                - wait 3s
                                - chat "You'll find Hannigan in the yards, he doesn't enter the walls much. Dormitories and common spaces are in the walls of the castle, or as we say, the wings."
                                - wait 3s
                                - chat "There're no fees, you'll even earn a few talons here and there, as long as you keep your eyes and feet forward. That's it... off you go now."
                                - flag <player> petra:!
                    - else if <[init_class]> == <[player_class_2]>:
                        - chat "Couldn't get enough, could ya? Seeing as you already know your way around, I'll keep it quick."
                        - wait 3s
                        - chat "Your initiating trainer didn't know you already train with us, but we do. This is not to your advantage, so we'll see how it goes."
                        - wait 3s
                        - choose <[init_class]>:
                            - case archer:
                                - chat "Rue is your mentor. She's the best archer we've seen for centuries, you're lucky to even speak to her. You're even luckier she treats her novices with respect."
                                - wait 3s
                                - chat "Uniform is optional but you should know by now that it's wise to keep it equipped."
                                - wait 3s
                                - chat "Rue and the other archers are in the towers. Off you go!"
                                - flag <player> petra:!
                            - case swordsman:
                                - chat "Mirea is your mentor. She's decisive and clear, but getting anything past her is an uphill battle we've all lost once or twice."
                                - wait 3s
                                - chat "Uniform is optional but you should know by now that it's wise to keep it equipped."
                                - wait 3s
                                - chat "You'll find Mirea in the main block of the Keep. Off you go!"
                                - flag <player> petra:!
                            - case shroud:
                                - chat "Septu is your mentor. He's off-putting... at first, a little strange honestly. Rumor has it that he warms up to you though."
                                - wait 3s
                                - chat "Uniform is optional but you should know by now that it's wise to keep it equipped."
                                - wait 3s
                                - chat "You'll find Septu in the basement of the Keep. Off you go!"
                                - flag <player> petra:!
                            - case axeguard:
                                - chat "Hannigan is your mentor. He's the best rider in the Isles, sure to show you a few tricks."
                                - wait 3s
                                - chat "Uniform is optional but you should know by now that it's wise to keep it equipped."
                                - wait 3s
                                - chat "You'll find Hannigan in the yards, he doesn't enter the walls much. Off you go!"
                                - wait 3s
                                - flag <player> petra:!
                    - else:
                        - narrate "<&c>Error! Contact an administrator."