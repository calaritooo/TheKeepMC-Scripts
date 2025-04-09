amieassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Just cast a line but lemme know if I can help."
            - chat "Fresh catch for sale!"
            - chat "I'll buy your catch if you're sellin."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - amieinteract