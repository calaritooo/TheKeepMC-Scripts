medaliaassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:1
        - trigger name:click state:true
        - trigger name:chat state:true
        on exit proximity:
        - if !<player.has_flag[classes.shroud]>:
            - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
                - zap *
    interact scripts:
    - medaliainteract