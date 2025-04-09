oscarinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "You need it, I probably, might have it!"
                    - wait 1s
                    - execute as_op silent "npc sel oscar"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

gusinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - if <player.has_flag[quests.swordsman.proper_equipment]>:
                        - chat "They told me you were coming for the gear, want it or not? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else:
                        - chat "From general tools to protection, I got it."
                        - wait 1s
                        - execute as_op silent "npc sel gus"
                        - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"
        2:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Right, first one's paid. The sets after, no. Off you go"
                    - wait 2s
                    - flag <player> quests.swordsman.proper_equipment.objective.2:1
                    - toast targets:<player> icon:spectral_arrow "<&6>Quest: Joining the Keep <&7>Objective complete!"
                    - toast targets:<player> icon:spectral_arrow "<&6>Quest: Joining the Keep <&7>Return to Lieutenant Greene!"
                    - give to:<player> swordsman_uniform_boots quantity:1
                    - give to:<player> swordsman_uniform_chestplate quantity:1
                    - give to:<player> swordsman_uniform_helmet quantity:1
                    - give to:<player> swordsman_uniform_leggings quantity:1
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Okay. Come back when you need it."
                    - zap 1

derrickinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "Have a look.."
                    - wait 1s
                    - execute as_op silent "npc sel derrick"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

karlinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "What do you want, kid?"
                    - wait 1s
                    - execute as_op silent "npc sel karl"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

georgeinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "Second page if you're lookin' to sell!"
                    - wait 1s
                    - execute as_op silent "npc sel george"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

jamesinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - if <player.has_flag[quests.archer.proper_equipment]>:
                        - chat "Oh mate, they told me you were one of the new initiates... in... ah! Archery. Come for the equipment did ya? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else:
                        - chat "Check it out!"
                        - wait 1s
                        - execute as_op silent "npc sel james"
                        - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"
        2:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "No worries, here you are mate, the first one's paid by the Keep. Just don't lose it or it's paid by you."
                    - wait 2s
                    - flag <player> quests.archer.proper_equipment.objective.2:1
                    - toast targets:<player> icon:spectral_arrow "<&6>Quest: Joining the Keep <&7>Objective complete!"
                    - toast targets:<player> icon:spectral_arrow "<&6>Quest: Joining the Keep <&7>Return to Elarik!"
                    - give to:<player> archer_uniform_boots quantity:1
                    - give to:<player> archer_uniform_chestplate quantity:1
                    - give to:<player> archer_uniform_helmet quantity:1
                    - give to:<player> archer_uniform_leggings quantity:1
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Oh, okay. Come back when you need it."
                    - zap 1

alyxinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.has_flag[professions.alchemist.novice]> && <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "Glove up before you touch anything."
                    - wait 1s
                    - execute as_op silent "npc sel alyx"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You must be a member of the Alchemists' Guild to speak to this person!"

lincinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "Here's the catalog."
                    - wait 1s
                    - execute as_op silent "npc sel linc"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

barryinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "Second page for some extra change and machinery."
                    - wait 1s
                    - execute as_op silent "npc sel barry"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

miguelinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "Lowest prices in the whole region!"
                    - wait 1s
                    - execute as_op silent "npc sel miguel"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

austininteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "Have a look!"
                    - wait 1s
                    - execute as_op silent "npc sel austin"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

johannesinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - chat "Check out what I got.."
                    - wait 1s
                    - execute as_op silent "npc sel johannes"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"