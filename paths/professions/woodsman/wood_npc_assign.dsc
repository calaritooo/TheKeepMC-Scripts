lukasassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:6
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - random:
            - chat "Training the woodsmen and woodswomen of tomorrow."
            - chat "Can't believe they stuck me here."
            - chat "I've been recruiting for the Woodsman's Guild for years now."
        on exit proximity:
        - execute as_op silent "npc desel"
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - lukasinteract