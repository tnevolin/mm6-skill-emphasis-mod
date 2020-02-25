# Might & Magic VI: RPG enhancement mod

# Goals

RPG character advancement should be mainly based on their skill progression with some small non skill based effects here and there from equipment, barrels, quests, etc. Putting it simply high skill should be a primary source of every property character has. That what R in RPG is. You build a role by pumping skill points into certain area. Like if you are focusing on axe skill only then you expect this character to be an outstanding axeman but appaling swordman. This is **NOT** like that in M&M engine. Expensive item gives about same bonus in attack and damage as master level skill. Even though acquiring master level skill is uncomparably more difficult than any expensive item. I would love to turn this around and give skills their well deserved attention. Usually one could raise their selected skills somewhere to level 10 on average by the end of the game. Since there are so few of them we should make player to cherish and rush every possibility to raise their character level even if by just one. The effect should be highly noticeable too.

# Recovery time

Turn recovery time into a damage rate multiplier, rather than divisor. That eliminates hard bottom cap problem and recovery time bonuses can stack indefinitely.

#### Example

##### Vanilla

<pre>
Dagger		=  60 base recovery time
500 speed	= -30 recovery time bonus
haste		= -25 recovery time bonus

summary		=   5 recovery time, capped at 30
</pre>

##### This mod

<pre>
recovery time bonus = 100 - 5
corrected recovery time = 100 \* 100 / (1 + recovery time bonus) = 51 recovery time, no capping needed
</pre>

Melee cap is reached at the skill level 24 which is pretty high. Range cap is reached at the skill level 190 which is never.
Regardless of caps recovery time in this model is never negative.

# Weapon skills

Stats affected by weapon skill, their increase per skill level, approximate resulting damage rate increase throughout the game.

|stat affected|stat increase|damage rate increase|comment|
|----|----:|----:|----|
|Attack bonus|10|15% - 00%||
|Recovery time|10|10% - 05%||
|Damage bonus| 5|50% - 10%||
|Armor Class| 5|25% - 05%||
|Chance to stun| 5|05%|50% at level 10|
|Chance to cause triple damage| 5|05%|50% at level 10|

#### Example for Axe skill

|skill rank|damage rate increase per skill level|comment|
|----|----:|----|
|normal|15%|Attack bonus|
|expert|15%|Attack bonus, Recovery time|
|master|20%|Attack bonus, Recovery time, Damage bonus|

# Shield and armor skills

AC bonus increases by 5 per skill level.

## Recovery penalties

|defense type|penalty normal|penalty expert|penalty master|
|----|----:|----:|----:|
|shield|30|30|30|
|leather|20|10|0|
|chain|40|20|0|
|plate|60|30|0|

# Magic skills

All spells always hit.

All protection spells have tripple strength. Otherwise, they are pretty useless.

Most spells generally progress well with skil level. This is an adjustment for those that do not.

|spell|fixed|per level|
|----|----:|----:|
|Ring Of Fire|3|1-3|
|Meteor Shower|4|1-4|
|Inferno|5|1-5|
|Starburst|8|1-8|
|Ice Blast|10|1-10|
|Stone Skin|5|5|
|Death Blossom|8|1-8|
|Bless|5|5|
|Healing Touch|3-7, 6-14, 9-21||
|Heroism|5|2|
|Mind Blast|4|1-4|
|First Aid|5, 15, 25||
|Harm|5|1-5|
|Cure Wounds|5|4|
|Flying Fist|14|1-14|
|Power Cure|10|4|
|Prismatic Light|10|1-10|

