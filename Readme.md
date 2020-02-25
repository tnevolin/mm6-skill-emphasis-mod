# Might & Magic VI: RPG enhancement mod

# Goals

RPG character advancement should be mainly based on their skill progression with some small non skill based effects here and there from equipment, barrels, quests, etc. Putting it simply high skill should be a primary source of every property character has. That what R in RPG is. You build a role by pumping skill points into certain area. Like if you are focusing on axe skill only then you expect this character to be an outstanding axeman but appaling swordman. This is **NOT** like that in M&M engine. Expensive item gives about same bonus in attack and damage as master level skill. Even though acquiring master level skill is uncomparably more difficult than any expensive item. I would love to turn this around and give skills their well deserved attention. Usually one could raise their selected skills somewhere to level 10 on average by the end of the game. Since there are so few of them we should make player to cherish and rush every possibility to raise their character level even if by just one. The effect should be highly noticeable too.

# Recovery time

Turn recovery time into a damage rate multiplier, rather than divisor. That eliminates hard bottom cap problem and recovery time bonuses can stack indefinitely. This modification is not directly related to weapon skill emphasis. It allows to avoid hitting the cap quite early with higher recovery time bonus per skill level awareded.

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

# Skill effects progression analysis

## Attack bonus

Bare bonus not including weapon skill

|source|value (early game)|value (late game)|
|----|----:|----:|
|accuracy effect|0|10|
|weapon bonus|0|10|
|second weapon bonus|0|10|
|buffs (Bless, Hour of Power)|5|45|
|total|5|75|

Average monster AC throughout the game: 0 - 100.

Let assume monster AC grows about as fast as our bare attack bonus throughout the game for calculation simplicity. Here is how much +1 attack bonus increases chance to hit based on bare bonus player already has at the time.

|game stage|bare bonus|chance to hit improvement for +1 attack bonus|
|----|----:|----:|
|early game|0|1.7%|
||10|1.0%|
||20|0.7%|
||30|0.6%|
||40|0.5%|
|late game|50|0.4%|

Early game imporvement is relatively noticeable but it decreases strongly as game progresses.

## Recovery time

Bare bonus not including weapon skill

|source|value (early game)|value (late game)|
|----|----:|----:|
|speed effect|0|10|
|swift weapon|0|20|
|buffs (Haste)|25|25|
|total|25|55|

Here is how much +1 recovery time bonus increases attack frequency based on bare bonus player already has at the time.

|game stage|bare bonus|attack frequency improvement for +1 recovery time bonus|
|----|----:|----:|
|early game|0|1.0%|
||10|0.9%|
||20|0.8%|
||30|0.8%|
||40|0.7%|
|late game|50|0.7%|

Early game imporvement is less than corresponding attack bonus one. However it declines not as drastically as game progresses.

## Damage bonus

Bare bonus not including weapon skill

|source|value (early game)|value (late game)|
|----|----:|----:|
|might effect|0|10|
|weapon damage|10|10|
|second weapon damage|0|10|
|weapon bonus|0|10|
|weapon enchantments|0|10|
|second weapon enchantments|0|10|
|buffs (Heroism, Hour of Power)|5|45|
|total|15|105|

Here is how much +1 recovery time bonus increases attack frequency based on bare bonus player already has at the time.

|game stage|bare bonus|attack damage improvement for +1 damage bonus|
|----|----:|----:|
|early game|10|10.0%|
||20|5.0%|
||30|3.3%|
||40|2.5%|
||50|2.0%|
||60|1.7%|
||70|1.4%|
|late game|80|1.3%|

Early game imporvement is huge due to low combined damage at the time. End game improvements are still about twice as better as recovery time bonus.

## AC bonus

Bare bonus not including weapon skill

|source|value (early game)|value (late game)|
|----|----:|----:|
|speed effect|0|10|
|equipment AC|0|80|
|AC enchantments|0|10|
|buffs (Stone Skin)|5|45|
|total|5|145|

Average monster attack bonus throughout the game: 0 - 200.

Let assume monster attack bonus about as fast as our bare AC throughout the game for calculation simplicity. Here is how much +1 AC decreases monster's chance to hit us based on bare bonus player already has at the time.

|game stage|bare bonus|monster's chance to hit decrease for +1 AC|
|----|----:|----:|
|early game|0|5.0%|
||20|1.0%|
||40|0.6%|
||60|0.4%|
||80|0.3%|
|late game|100|0.2%|

Similar to attack bonus the effectiveness of AC bonus falls drastically toward the end of the game.

# Weapon skills

Stats affected by weapon skill, their increase per skill level.

|stat affected|stat increase per level|
|----|----:|
|Attack bonus|10|
|Recovery time|10|
|Damage bonus|5|
|Armor Class|5|
|Chance to stun|5|
|Chance to cause triple damage|5|

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

