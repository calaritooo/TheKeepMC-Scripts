henriassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:6
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - random:
            - chat "You hopin' to make the most out of one of man's oldest professions?"
            - chat "Join the Agriculturalist's Guild! Turn that pocket change into something useful."
            - chat "Who taught you to plow like that?"
            - chat "We prefer the term, 'Agriculturalist'."
        on exit proximity:
        - execute as_op silent "npc desel"
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - henriinteract