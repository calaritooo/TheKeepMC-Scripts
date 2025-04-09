amieinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains fort_wakers:
                    - chat "Lemme know..."
                    - wait 1s
                    - execute as_op silent "npc sel amie"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"