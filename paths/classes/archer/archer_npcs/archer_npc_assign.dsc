elarikassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - if !<player.has_flag[classes.archer]>:
            - random:
                - chat "I'm somewhat of a new trainer, but that's neither here nor there."
                - chat "Grab a bow and arrow and let's see what we can do with ya."
                - chat "Did you talk to Peter yet? Head on over to his tent, he'll get you sorted."
        on exit proximity:
        - if !<player.has_flag[classes.archer]>:
            - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
                - zap *
    interact scripts:
    - elarikinteract