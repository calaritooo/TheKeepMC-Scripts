peterassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:6
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - if !<player.has_flag[classes]> || <player.flag[classes].is_empty>:
            - random:
                - chat "Looking to train among the best? Let me know if you're interested."
                - chat "I represent Wayfair Keep, one of the oldest places still standing."
                - chat "Our best friend's our weapon, the Keep believes it's a part of who we are."
                - chat "Archer? Rider? Swordsman? We'll get you sorted."
        on exit proximity:
        - zap peterinteract 1
    interact scripts:
    - peterinteract

petraassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:6
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - if !<player.has_flag[classes]> || <player.flag[classes].is_empty>:
            - random:
                - chat "How did you get here?"
                - chat "I'm afraid I don't recognize you.."
                - chat "Every initiate has passed through me, but I haven't seen you before."
        on exit proximity:
        - stop
    interact scripts:
    - petrainteract