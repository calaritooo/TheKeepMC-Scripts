liaassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:6
        - trigger name:click state:true
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "We at the Alchemists' Guild are happy to help."
            - chat "Recipes and basic materials available upon membership!"
            - chat "Tired of buying expensive concoctions? Make your own!"
            - chat "Interested in becoming an alchemist?"
        on exit proximity:
        - execute as_op silent "npc desel"
        - if <script[<script.name.before[assignment]>interact].step> != <script[<script.name.before[assignment]>interact].default_step>:
            - zap *
    interact scripts:
    - liainteract