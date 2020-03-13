# Might & Magic 6: skill emphasis mod

# Goal

RPG character advancement should be mainly based on their skill progression with some small non skill based effects here and there from equipment, barrels, quests, etc. Putting it simply high skill should be a primary source of every property character has. That what R in RPG is. You build a role by pumping skill points into certain area. Like if you are focusing on axe skill only then you expect this character to be an outstanding axeman but appaling swordman. This is **NOT** like that in M&M engine. Mastering the skill is undoubtedly more difficult endeavour than aquiring an expensive item. Yet those expensive items give about same bonus in attack and damage as mastering the skill. I would love to turn this around and give skills their well deserved attention. Usually one could raise their selected skills somewhere to level 10 on average by the end of the game. Since there are so few of them we should make player to cherish each skill point and use every possibility to invest more in primary weapon skills.

# Convert recovery bonus into speed bonus

Recovery time cap is relatively easy reacheable. As soon as it hits the cap further investment in recovery time reduction is a waste. I propose to turn recovery time *reduction* bonus into attack speed *increase* bonus. Then it naturally grow same exactly way as any other game stat. Meaning adding 100 speed bonus on top of initial 100 speed value makes player attack twice as fast which corresponds to 50 recovery. With this approach reaching recovery time cap is still possible but much harder. Thus we safely can stop worrying about the cap. See computation example below.

With all additional bonuses added melee cap is reached at the skill level 22 which is pretty high and rarely reacheable. Range cap is reached at the skill level 190 which is never. Regardless of caps recovery time in this model it is never negative.

#### Computation example

##### Vanilla

<pre>
Dagger		=  60 base recovery (40 recovery reduction)
500 speed	= -30 recovery bonus
haste		= -25 recovery bonus

result		=   5 recovery which is capped at 30
</pre>

##### This mod

<pre>
Total recovery reduction bonus from above example = 100 - 5 = 95
This mod treats it as attack speed increase bonus = 95
Resulting attack speed = 100 + 95 = 195
Resulting recovery = 100 \* (100 / 195) = 51, cap is not reached
</pre>

# Weapon base speed

Instead of base recovery each weapon gets base speed which roughly corresponds to vanilla base recovery.

|weapon|base speed|resuting recovery|
|----|----:|----:|
|Staff,Axe|100|100|
|Sword|120|83|
|Spear,Mace|140|71|
|Dagger|180|55|

# Chance to hit formulas

Chance to hit is a most restricted combat parameter as it capped at 100%, obiously. In vanilla it floats somewhere in 50%-75% interval. With weapon attack bonus progressing faster with skill level it becomes quite ineffective at 80% somewhere. Same is true for monster to hit chance. This mod introduces modifed to hit chance formulas to make its interval more dynamic and to make attack and AC bonuses more important to develop.

<pre>
chance for player to hit monster = (5 + player attack) / (20 + player attack + monster AC)
chance for monster to hit player = (15 + 2 \* monster level) / (20 + 2 \* monster level + player AC)
</pre>

# Combat skills

## Weapon skills

All skills provide same bonuses as they do in vanilla. However, these bonuses are available immediatelly at Normal rank. Rank now controls how fast these bonuses progress with level instead of triggering them. Bonuses increment per level is much higher than in vanilla and varies based on their combat impact.

## Bonus increment per level based on rank

|bonus|normal|expert|master|
|----|----:|----:|----:|
|Attack|6|8|10|
|Speed|4|6|8|
|Damage|3|4|5|
|Dagger chance to cause triple damage|3|4|5|
|Armor Class from weapon|9|12|15|
|Resistances|3|4|5|
|Armor Class from armor|15|20|25|
|Armor Class from shield|20|30|40|

## Bonus improvement at master level 10 comparing to vanilla

|bonus|description|ratio|
|----|----|----:|
|Attack|player to hit chance against toughest monsters|1.8|
|Speed|attack frequency|1.5|
|Damage|increase in damage|1.5|
|Dagger chance to cause triple damage|damage multiplier|2.0|
|Armor Class from weapon|decrease in toughest monster to hit chance against player|1.4|
|Resistances|decrease in magic attack damage|1.5|
|Armor Class from armor|decrease in toughest monster to hit chance against player|1.6|
|Armor Class from shield|decrease in toughest monster to hit chance against player|2.0|

## Resulting weapon damage rate increase at master level 10 due to improved skills

Damage rate defines amount of damage delivered in unit of time. It is a product of all three offensive parameters: hit chance, speed, damage. Hit chance is calculated based on attack. Speed and damage are directly influenced by skill.

|weapon|attack|speed|damage|damage rate improvement compared to vanilla|
|----|----:|----:|----:|----:|
|Staff|+100|0|0|1.5|
|Sword|+100|+100|0|2.2|
|Dagger|+100|0|x2|3.0|
|Axe|+100|+100|+50|3.4|
|Spear|+100|0|+50|2.2|
|Mace|+100|0|+50|2.2|

Axe becomes an ultimate weapon of destruction as it is intended to be. Axe+Sword is now also a most destructive dual wield combo (see dual wield section for details).

Other weapons are weaker but possess some other qualities instead. Staff is an ultimate anti magic and complete protection tool. Sword is powerful dual wield companion. Spear is for physical damage protection. Mace is a counter attack tool. Dagger is faster and stronger at the beginning but doesn't progress that well with skill.

## Special abilities

### Mace special abilities

Mace has a chance to paralize opponent. This ability is immediatelly available at normal skill rank.

I've replaced stun to paralize because stun does not add to monster recovery in MM6 (= useless). Paralize is a stronger version of stun that has duration and is visual.

* Chance to cause an effect = 6% on normal, 8% on expert, 10% on master.
* Duration of an effect = 1 minute per skill level.

**Skill master level 20 roughly keeps one enemy under effect all the time.**

### Staff special abilities

Staff adds to AC and all resistances. See multiplers in weapon bonuses table above.

Staff has a chance to slow and feeblemind. These abilities are immediatelly available at normal skill rank.

* Chance to cause an effect = 12% on normal, 16% on expert, 20% on master.
* Duration of an effect = 1 minute per skill level.

**Skill master level 10 roughly keeps one enemy under effect all the time.**

## Armor recovery penalties

|armor type|normal|expert|master|
|----|----:|----:|----:|
|leather|20|10|0|
|chain|40|20|0|
|plate|60|30|0|

# Dual wield

Dual wield rules are quite complicated in MM6. Player need to remember which weapon uses attack, speed, damage bonuses and which does not. Ugh. Moreover, some of the skill bonuses and enchantment effects may not work if you apply them to the weapon in wrong hand. Most of the time you are out of luck as you cannot possibly wield some weapons in off hand. This is certainly a waste of skills and enchantments. Why not make them all count? That makes it much easier to distribute skill points and fairer to both weapon skills.

## Dual wield modification proposal

* Weapon skill attack bonuses are combined. This makes them hit roughly 50% more often with both skills on master level 10.
* Weapon skill damage bonuses are combined. This does not change anything since off hand weapons (dagger, sword) do not increase damage with skill. Unless character class is melee combat oriented (Knight, Paladin). Then it does a tremendous difference. (See "Weapon usage preference analysis" below)
* Weapon skill speed bonuses are averaged. This allows both weapons to contribute their recovery bonuses if any. However, this also slows down speed progression for spear/mace-sword combo making it eventually slower comparing to axe-sword.

# Two handed weapon

Dual wield is superior to two handed weapon in MM6 as it combines both weapons base attack and damage. Heavy two handed weapon should naturally increase damage.

## Two handed weapon damage

|bonus|normal|expert|master|
|----|----:|----:|----:|
|damage|2|3|4|

# Class speciality

MM6 classes are kind of undistingushable in weapon skills. That's why Paladin is superior to Knight in any way as they can develop all the same weapon/armor skill but also have magic on top of that. I believe some class weapon specialization is in order to make them really represent their strengths.

## Additional weapon skill damage/level for classes

|initial class|weapon type affected|initial|1st promotion|2nd promotion|
|----|----|----:|----:|----:|
|Knight|all melee weapons|2|3|4|
|Paladin|all melee weapons|0|1|2|
|Archer|all ranged weapons|0|1|2|

This is similar to armsmaster bonus in MM7 but more class special. Knight become an ultimate weapon armsmaster with Paladin following. Archer specializes in ranged damage instead and now becomes quite powerful shooter.

# Weapon usage preference analysis

## Dual weild recovery

Now when dual wield recovery is an average of **actual** both weapon recoveries it is beneficial to combine any weapon with any to get a recovery bonus from weapon in each hand.

#### Examples

Spear + Dagger benefits from dagger speed and result in 160 speed.

Spear + Sword has initial speed of 120. It progresses about half as slow as in vanilla due to Sword contributing only half of its bonus with skill advancement.

Axe + Sword has initial recovery of 110. However, it progresses faster than any other combo due to both weapon skills contributing to recovery. It becomes fastest combo when both weapon skills contribute 70 speed to common pool.

## Dual wield vs. two handed weapon

Dual wield is very beneficial at low skill level as it combines base damage and attack of both weapons. Then it keeps combining attack from both weapons. However, attack is the least beneficial parameter. Its progression slows down tremendously at higher skill levels. On top of that it is capped at 100% hit chance. Will all huge attack bonuses in this mod it is impossible to improve hit chance more than twice comparing to vanilla. Damage, in turn, keeps growing lineraly and is not limited. Will all other conditions being equal two handed weapon will prevail toward the end of the game. This is true to non melee combat oriented classes (Archer, Cleric, Druid, Sourcerer).

It is different for melee combat oriented classes like Knight (and Paladin to lesser extent). With their inherent skill damage bonus it adds to **ALL** weapons including those normally not increasing damage with skill like Sword and Dagger. With dual wielding Knight keeps adding to damage of both weapons which eventually overruns two handed damage bonus.

Knight should master Sword and switch to dual wielding as soon as possible. Paladin is about as good with dual weapon as with two handed one. For other classes two handed weapon produces more damage in long term. Still magic classes may opt for dual dagger for high initial speed.

## Class weapon usage suggestions

|class|suggestions|
|----|----|
|Knight|Axe+Sword, invest all extra skill points in it.|
|Paladin|Any dual wielding or two handed weapon is good to level 10. Put rest into magic. If you didn't plan to evolve magic at all choose Knight instead|
|Archer|Two handed Spear for additional AC and damage. Invest the rest into ranged weapon!|
|Cleric|Mace for paralization and shield for AC. Invest the rest to magic.|
|Druic|Dual Daggers for speed or Dagger+Sheid for AC. Invest the rest to magic.|
|Sourcerer|Staff for AC and slow/feeblemind. Invest the rest to magic.|

# Spells

All spells always hit. Making just a few spells to hit depending on skill level is too fine grained and hard to visualize mechanics that is absolutely not needed.

Most spells generally progress well with skill level. This is an adjustment for those that do not. I've reshuffled their fixed and per level values so that they have more standard strength formula: X + 1-X / level. At the same time I tried to make old and new versions about equally strong at level 4.

|spell|fixed|per level|
|----|----:|----:|
|Ring Of Fire|3|1-3|
|Meteor Shower|4|1-4|
|Inferno|5|1-5|
|Starburst|8|1-8|
|Ice Blast|10|1-10|
|Death Blossom|8|1-8|
|Mind Blast|4|1-4|
|Harm|5|1-5|
|Flying Fist|14|1-14|
|Prismatic Light|10|1-10|
|Stone Skin||5|
|Bless||5|
|Heroism||2|
|Healing Touch|3-7, 9-21, 15-35||
|First Aid|5, 15, 25||
|Cure Wounds||5|
|Power Cure||5|

## Bless, Heroism, Hour Of Power problem

Bless and Heroism grant relatively small bonus of +15 even at master level 10. Whereas, Hour Of Power is insanely overpowered granting +45 of both attack and damage at master level 10. This is an enourmous advantage that renders basic self magic spells utterly useless. The only fix to that I found is to increase skill multiplier for basic self spells based on mastery.

