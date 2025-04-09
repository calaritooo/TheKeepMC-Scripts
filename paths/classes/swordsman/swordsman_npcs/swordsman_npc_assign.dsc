lieutenantgreeneassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        - trigger name:chat state:true
        on enter proximity:
        - if !<player.has_flag[classes.swordsman]>:
            - random:
                - chat "What do you want?"
                - chat "If you wanna train, you gotta talk to Peter first."
                - chat "I've initiated some of the best Swordsman to come out of the Keep."
        on exit proximity:
        - if !<player.has_flag[classes.swordsman]>:
            - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
                - zap *
    interact scripts:
    - lieutenantgreeneinteract