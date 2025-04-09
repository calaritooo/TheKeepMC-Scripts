riolassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - riolinteract