# Might & Magic 6: skill emphasis mod

# Goal

RPG character advancement should be mainly based on their skill progression with some small non skill based effects here and there from equipment, barrels, quests, etc. Putting it simply high skill should be a primary source of every property character has. That what R in RPG is. You build a role by pumping skill points into certain area. Like if you are focusing on axe skill only then you expect this character to be an outstanding axeman but appaling swordman. This is **NOT** like that in M&M engine. Mastering the skill is undoubtedly more difficult endeavour than aquiring an expensive item. Yet those expensive items give about same bonus in attack and damage as mastering the skill. I would love to turn this around and give skills their well deserved attention. Usually one could raise their selected skills somewhere to level 10 on average by the end of the game. Since there are so few of them we should make player to cherish each skill point and use every possibility to invest more in primary weapon skills.

# Recovery mechanics

Standard game stat mechanics is that bigger stat value is better, the bonus is positive, penalty is negative. MM recovery mechanics is an opposite which makes it a little difficult to grasp at first. Besides, due to this reverted scale it is pretty limited as cap is quite easily reacheable. From then on it is a complete waste to invest into recovery any more.

I propose to turn recovery time *reduction* bonus into attack speed *increase* bonus. Then it naturally grow same exactly way as any other game stat. Meaning adding 100 speed bonus on top of initial 100 speed value makes player attack twice as fast which corresponds to 50 recovery. With this approach reaching recovery time cap is still possible but much harder. Thus we safely can stop worrying about the cap. See computation example below.

With all additional bonuses added melee cap is reached at the skill level 22 which is pretty high and rarely reacheable. Range cap is reached at the skill level 190 which is never. Regardless of caps recovery time in this model it is never negative.

Keep in mind that even though computation mechanics changed the speed value is still converted to recovery. It is still called recovery all over the place. I don't want to change it everywhere in the texts.

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
|Attack|2|3|4|
|Speed|4|5|6|
|Damage|2|3|4|
|Dagger chance to cause triple damage|3|4|5|
|Armor Class from weapon|4|6|8|
|Armor Class from shield|10|15|20|
|Armor Class from leather|3|4|5|
|Armor Class from chain|6|8|10|
|Armor Class from plate|9|12|15|
|Resistances from leather|6|8|10|
|Resistances from chain|3|4|5|

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

### Sword and dagger special abilities

Sword and dagger special ability to serve as a secondary weapon is a foundation of dual wielding. However, holding sword/dagger in right hand ignores this ability. As such sword in right hand sucks comparing to comparable strength weapons: axe and spear. I decided to compensate sword/dagger in right hand so people still can find incentive in using it.

* Sword and dagger can be used in left hand immediatelly. No need to acheve special rank for that.
* Sword and dagger in right hand double their skill attack bonus to compencate abandoned ability.

## Armor speed penalties

|armor type|normal|expert|master|
|----|----:|----:|----:|
|leather|20|10|0|
|chain|40|20|0|
|plate|60|30|0|

# Dual wielding

Dual wielding rules are quite complicated in MM6. Player need to remember which weapon uses attack, speed, damage bonuses and which does not. Ugh. Moreover, some of the skill bonuses and enchantment effects may not work if you apply them to the weapon in wrong hand. Most of the time you are out of luck as you cannot possibly wield some weapons in off hand. This is certainly a waste of skills and enchantments. Why not make them all count? That makes it much easier to distribute skill points and fairer to both weapon skills.

## Dual wield modification proposal

* Weapon skill attack bonuses are combined. This makes them hit roughly 50% more often with both skills on master level 10.
* Weapon skill damage bonuses are combined. This does not change anything since off hand weapons (dagger, sword) do not increase damage with skill. Unless character class is melee combat oriented (Knight, Paladin). Then it does a tremendous difference. (See "Weapon usage preference analysis" below)
* Weapon skill speed bonuses are averaged. This allows both weapons to contribute their recovery bonuses if any. However, this also slows down speed progression for spear/mace-sword combo making it eventually slower comparing to axe-sword.

# Two handed weapon

Dual wielding is superior to two handed weapon in MM6 as it combines both weapons base attack and damage. Heavy two handed weapon should naturally increase damage.

## Two handed weapon damage

|bonus|normal|expert|master|
|----|----:|----:|----:|
|damage|0|1|2|

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

All stat boost spells affect whole party at novice level.

|spell|fixed|per level|
|----|----:|----:|
|All stat boosts|10|5, 5, 5|
|Protection from ...|0|3, 4, 5|
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
|Stone Skin|5|1|
|Bless|5|1|
|Heroism|5|1|
|Healing Touch|3-7, 6-14, 15-35||
|First Aid|5, 10, 25||
|Cure Wounds||5|
|Power Cure||5|

# Monsters toughness

Increased weapon bonuses makes easy vanilla monster fighting even easier. We need to beef monsters up to compensate for this. Monster damage to player is doubled. Monster HP is doubled.

# Hirelings

I've changed the probability of different professions appearence based on nice analysis [here](https://gamefaqs.gamespot.com/pc/41610-might-and-magic-vi-the-mandate-of-heaven/faqs/24566).

Some useless professions should not appear at all. Some profession cost are adjusted.

| profession | random chance | cost |
|----|----:|----:|
| Smith | 10 | 100 |
| Armorer | 10 | 100 |
| Alchemist | 10 | 100 |
| Scholar | 10 | 500 |
| Guide | 0 | 100 |
| Tracker | 10 | 200 |
| Pathfinder | 10 | 300 |
| Sailor | 10 | 100 |
| Navigator | 10 | 200 |
| Healer | 10 | 500 |
| Expert Healer | 10 | 2000 |
| Master Healer | 10 | 5000 |
| Teacher | 10 | 300 |
| Instructor | 10 | 700 |
| Arms Master | 10 | 1000 |
| Weapons Master | 10 | 1500 |
| Apprentice | 10 | 200 |
| Mystic | 10 | 1000 |
| Spell Master | 10 | 2000 |
| Trader | 10 | 100 |
| Merchant | 10 | 200 |
| Scout | 10 | 300 |
| Counselor | 0 | 200 |
| Barrister | 0 | 300 |
| Tinker | 10 | 200 |
| Locksmith | 10 | 300 |
| Fool | 10 | 100 |
| Chimney Sweep | 10 | 200 |
| Porter | 10 | 100 |
| Quarter Master | 0 | 200 |
| Factor | 10 | 500 |
| Banker | 10 | 1000 |
| Cook | 0 | 300 |
| Chef | 10 | 400 |
| Horseman | 10 | 100 |
| Bard | 10 | 1000 |
| Enchanter | 10 | 1000 |
| Cartographer | 10 | 200 |
| Wind Master | 10 | 2000 |
| Water Master | 10 | 1000 |
| Gate Master | 10 | 2000 |
| Acolyte | 10 | 200 |
| Piper | 10 | 300 |
| Explorer | 10 | 100 |
| Pirate | 10 | 500 |
| Squire | 10 | 2000 |
| Psychic | 10 | 400 |
| Gypsy | 10 | 100 |
| Negotiator | 0 | 500 |
| Duper | 10 | 200 |
| Burglar | 10 | 2000 |
| Peasant | 0 | 1 |
| Serf | 0 | 1 |
| Tailor | 0 | 5 |
| Laborer | 0 | 1 |
| Farmer | 0 | 1 |
| Cooper | 0 | 5 |
| Potter | 0 | 2 |
| Weaver | 0 | 2 |
| Cobbler | 0 | 3 |
| Ditch Digger | 0 | 1 |
| Miller | 0 | 2 |
| Carpenter | 10 | 5 |
| Stone Cutter | 10 | 4 |
| Jester | 0 | 10 |
| Trapper | 0 | 5 |
| Beggar | 0 | 1 |
| Rustler | 0 | 3 |
| Hunter | 0 | 5 |
| Scribe | 0 | 10 |
| Missionary | 0 | 10 |
| Clerk | 0 | 8 |
| Guard | 0 | 10 |
| Follower of Baa | 0 | 1 |
| Noble | 0 | 100 |
| Gambler | 0 | 10 |

# Stat effect

## Problem

Extremely non-lenear stat breakpoint/effect progression renders any stat boosting effects (spells, potions) useless toward the end of the game.

## Solution

* Make stat effect either exactly linear or close to linear.
* Reduce initial stat effect to stat value ratio from vanilla 1:2 down to 1:5.

These changes together make stat boosts weak but relevant to the end of the game. At the same time it does not allow stat effect to overflow character secondary stats (attack, recovery, damage, AC, ...).


 Here is the modified table below. It is +2 effect per +5 stat increase along all scale. However, breakpoint intervals getting bigger and bigger at 50 and then at 200. Most likely you will never go above 200 so your Extreme Energy will always work and produce same predictable result.

| Statistic | Effect |
|----:|----:|
| 500 | 100 |
| 400 | 80 |
| 350 | 70 |
| 300 | 60 |
| 280 | 56 |
| 260 | 52 |
| 240 | 48 |
| 220 | 44 |
| 200 | 40 |
| 180 | 36 |
| 160 | 32 |
| 140 | 28 |
| 120 | 24 |
| 100 | 20 |
| 90 | 18 |
| 80 | 16 |
| 70 | 14 |
| 60 | 12 |
| 50 | 10 |
| 45 | 9 |
| 40 | 8 |
| 35 | 7 |
| 30 | 6 |
| 25 | 5 |
| 20 | 4 |
| 15 | 3 |
| 10 | 2 |
| 5 | 1 |
| 0 | 0 |

# Skill advancement cost

Capping skill advancement cost at **10** to encourage specialization and discourage throwing cheap points into low level skills. This way high levels advancement is less expensive.

#### Examples

How far can you get with same skill point investment in vanilla and this mod capped version.

| vanilla | this mod |
|----:|----:|
|10|10|
|20|25|
|30|50|

