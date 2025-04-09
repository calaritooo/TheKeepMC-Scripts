jacobassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:6
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - random:
            - chat "Don't ask for ores, I ain't got 'em."
            - chat "I'm here 'cause the Guild put me here."
            - chat "Sooner you get outta this camp, the better."
        on exit proximity:
        - execute as_op silent "npc desel"
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - jacobinteract