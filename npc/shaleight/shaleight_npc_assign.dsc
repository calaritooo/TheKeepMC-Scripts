oscarassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Ey, feelin' parched?"
            - chat "Come grab a drink!"
            - chat "A swig of this should do the trick.."
            - chat "My stuff's betta than any pub's!"
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - oscarinteract

gusassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "My products are specially made to last. How long, I'm not sure."
            - chat "Ever since my wife left me for my brother, well, anywho."
            - chat "Don't talk to Oscar, a swindler that one."
            - chat "Fancy something sharp? ish?"
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - gusinteract

derrickassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        - trigger name:chat state:true radius:5
        - trigger name:proximity state:true radius:5
        on enter proximity:
        - random:
            - chat "Looking for some independence?"
            - chat "Leads, armor, saddles, I got it all!"
            - chat "Papa says no dinner tonight unless I sell 60 apples."
            - chat "I sell horse stuff. That's it."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - derrickinteract

karlassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - karlinteract

georgeassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "My product's the best in town!"
            - chat "Best seeds from the freshest produce!"
            - chat "Startin' a farm, kid?"
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - georgeinteract

jamesassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Only cosmetic shop in the whole province!"
            - chat "Try spicing up your look!"
            - chat "Hey there, looking for some colors?"
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - jamesinteract

alyxassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Lookin' for somethin' a little more exotic?"
            - chat "That hard to find stuff.. I got it."
            - chat "The only apothecary from Cinder to Vendaven!"
            - chat "I'll only sell to alchemists.. they'll fine me if you ain't one."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - alyxinteract

lincassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Welcome in! Carpentry here, Barry's got the stonework."
            - chat "I got the timber, Barry here's got the stone."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - lincinteract

barryassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - barryinteract

miguelassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:1.5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "Welcome to the archives, home to history."
            - chat "Need to put a fine finish on something?"
            - chat "Gus is great and all but let's make some.. alternative.. touches to your equipment."
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - miguelinteract

austinassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "What can I get ya?"
            - chat "With us at Not-so everyday Everyday Exotics, you'll get the best bang for your.. talon."
            - chat "They stopped stocking the smaller vendors with Nether goods, there's a shortage I heard."
            - chat "My stock ain't much but we've got bigger branches in the cities!"
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - austininteract

johannesassignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true radius:5
        - trigger name:click state:true
        on enter proximity:
        - random:
            - chat "All fruits, berries, and their variants right here!"
            - chat "Freshly grown, locally sourced!"
            - chat "Looking for something a little sweeter?"
        on exit proximity:
        - execute as_op silent "npc desel"
    interact scripts:
    - johannesinteract