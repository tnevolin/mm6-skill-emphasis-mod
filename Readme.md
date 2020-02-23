# Might & Magic VI: RPG enhancement mod

# Goals

RPG character advancement should be mainly based on their skill progression with some small non skill based effects here and there from equipment, barrels, quests, etc. Putting it simply high skill should be a primary source of every property character has. That what R in RPG is. You build a role by pumping skill points into certain area. Like if you are focusing on axe skill only then you expect this character to be an outstanding axeman but appaling swordman. This is *NOT* like that in M&M engine. Expensive item gives about same bonus in attack and damage as master level skill. Even though acquiring master level skill is uncomparably more difficult than any expensive item. I would love to turn this around and give skills their well deserved attention. Usually one could raise their selected skills somewhere to level 10 on average by the end of the game. Since there are so few of them we should make player to cherish and rush every possibility to raise their character level even if by just one. The effect should be highly noticeable too.

# Recovery time

Turn recovery time into a damage rate multiplier, rather than divisor. That eliminates hard bottom cap problem and recovery time bonuses can stack indefinitely.

## Current damage rate formula

damage rate = average damage \* chance to hit / (100 - recovery time)

## New damage rate formula

damage rate = average damage \* chance to hit / 100 \* (100 + recovery time) / 100

# Weapon skills

Not all weapon skills provide all effects. For example, Staff skill does not reduce recovery time.

Effects are kicked in when their appropriate skill rank is achieved. For example Sword skill reduces recovery time starting from expert rank.

Table below 

|affected stat|stat increase<br>per level|damage rate change<br>per level<br>early game - late game|comment|
|----|----:|----|----|
|Attack bonus|10|15% - 5%||
|Recovery time|10|10% - 5%||
|Damage bonus|5|50% - 10%||
|Armor Class|5|25% - 5%||
|Chance to stun|5|5%-5%|50% at level 10.|
|Chance to cause triple damage|5|5%-5%|50% at level 10.|

## Example for Axe skill

|game stage|skill rank|damage increase for each skill level increase|
|----|----|----:|
|early game|novice|15%|
|mid game|expert|15%|
|late game|master|20%|

# Shield and armor skills

AC bonus increases by 5 per skill.

Shield bonus is doubled with Expert and tripled with Master.

## Recovery penalties

|defense type|penalty normal|penalty expert|penalty master|
|----|----:|----:|----:|
|shield|30|30|30|
|leather|20|10|0|
|chain|40|20|0|
|plate|60|30|00|

# Magic skills



Armor recovery penalty is 60
Armor recovery penalty is 60
Armor recovery penalty is 60

AC bonus increases by 5 per skill.