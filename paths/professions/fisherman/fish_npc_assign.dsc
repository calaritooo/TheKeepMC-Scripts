stephenassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:6
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - random:
            - chat "This lake raised me."
            - chat "We do fishing expeditions out in the open sea, join us sometime!"
            - chat "There's a strange stigma behind the professional guilds, I find only honor."
        on exit proximity:
        - execute as_op silent "npc desel"
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - stepheninteract