johnathonassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "In my opinion, the guilds are a scam. I'm in 4 myself so let me tell ya."
            - chat "The beautiful Camp Cinder, a once important military camp. Now mostly just a trading post."
            - chat "Head on over to my brother Gus in Shaleight, damn good drunkard. Oh, and a blacksmith on the side!"
            - chat "Bastards won't approve my papers for the capital, in the meantime I'm stuck here."
            - chat "Welcome to camp, keep yourself in line and you'll be fine."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - johnathoninteract

lizzieassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - random:
            - chat "Freshest sea buggers around!"
            - chat "Ever seen a flying fish?"
            - chat "SH! Don't wanna scare the fishies."
            - chat "Lookin' into catching some serious stuff? Head to the guild."
        on exit proximity:
        - execute as_op silent "npc desel"
        - zap *
    interact scripts:
    - lizzieinteract

davisassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Looking for some horse armor?"
            - chat "Been here in Camp for a decade or so."
            - chat "Lookin' for one of your own? They'll see ya a high-jumper over in Shaleight."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - davisinteract

coryassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Just cooled some blades!"
            - chat "Fresh out the forge!"
            - chat "I'll make any hunk of metal high quality."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - coryinteract

samassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Latest finds include weird mushrooms and not-so-essential oils!"
            - chat "I became the Camp Cinder herbologist weeks ago, I know a thing or two."
            - chat "I'll save you the scavenging for just a few tals."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - saminteract

adamaassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "General stuff and finds? I can help."
            - chat "Materials on sale!"
            - chat "Latest shipment's here."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - adamainteract

jeremyassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Lookin' to start a farm?"
            - chat "The owner's inside, he'll help you join the guild!"
            - chat "I'm just the farmhand but I got whatever you need."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - jeremyinteract

lauraassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - laurainteract

rhodesassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - if !<player.has_flag[completed_quests.side.something_hot_to_drink]> && !<player.has_flag[quests.side.something_hot_to_drink]>:
            - random:
                - chat "*Ahem*, get over here!"
                - chat "Pssst, come here a sec!"
                - chat "Hey pal! You look able to help a guy out.."
        - else if <player.has_flag[completed_quests.side.something_hot_to_drink]>:
            - random:
                - chat "That was awful nice of ya'."
                - chat "Don't tell the Lieutenant what you did for me."
                - chat "I might need ya' again later.."
        - else if <player.has_flag[quests.side.something_hot_to_drink]>:
            - chat "Got it yet?"
        - else:
            - stop
        on exit proximity:
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - rhodesinteract

lorathassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:4
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - if !<player.has_flag[completed_quests.side.links_of_valor]> && !<player.has_flag[quests.side.links_of_valor]>:
            - random:
                - chat "If you've got a moment, I need a hand."
                - chat "Got a sec?"
                - chat "Hey you, have a minute?"
        - else if <player.has_flag[completed_quests.side.links_of_valor]>:
            - random:
                - chat "Really appreciate it!"
                - chat "Let me know if you ever need anything."
                - chat "Won't forget what you did for me."
        - else if <player.has_flag[quests.side.links_of_valor]>:
            - chat "Got it yet?"
        - else:
            - stop
        on exit proximity:
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - lorathinteract

nicholasassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:2
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - if !<player.has_flag[completed_quests.side.taking_the_edge_off]> && !<player.has_flag[quests.side.taking_the_edge_off]>:
            - random:
                - chat "You're really not supposed to be up here.. but I need a hand if ya got one."
                - chat "Down you go! Unless you can help me out.."
                - chat "I won't tell Lieutenant Greene you came up here if you help me with something."
        - else if <player.has_flag[completed_quests.side.taking_the_edge_off]>:
            - if <player.flag[completed_quests.side.taking_the_edge_off.ending]> == 1:
                - chat "Thanks again!"
            - else:
                - chat "They put me on toilet duty. Get outta here, rat!"
        - else if <player.has_flag[quests.side.taking_the_edge_off]>:
            - chat "Got it yet?"
        - else:
            - stop
        on exit proximity:
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - nicholasinteract