riolinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains dugres:
                    - chat "For a bad night, left side. For a sober night, the right."
                    - wait 1s
                    - execute as_op silent "npc sel riol"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"