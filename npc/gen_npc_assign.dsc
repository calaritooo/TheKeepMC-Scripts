atlaswagoncoassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - random:
            - chat "Get your travel papers here!"
            - chat "Depart on your next adventure with Atlas!"
            - chat "Hop on, we'll take care of the rest!"
        on exit proximity:
        - execute as_op silent "npc desel"
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - atlaswagoncointeract

atlaswagonco_world_script:
    type: world
    debug: true
    events:
        on player enters *_wagon flagged:wagon_destination:
        - define destination <player.flag[wagon_destination]>
        - flag <player> wagon_destination:!
        - wait 1t
        - teleport <player> <[destination]>_arrival offthread_pitch offthread_yaw

jeffassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        - trigger name:chat state:true
        on exit proximity:
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - jeffinteract