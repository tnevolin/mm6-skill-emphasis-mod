# Might & Magic 6: skill emphasis mod

# Goal

RPG character advancement should be mainly based on their skill progression with some small non skill based effects here and there from equipment, barrels, quests, etc. Putting it simply high skill should be a primary source of every property character has. That what R in RPG is. You build a role by pumping skill points into certain area. Like if you are focusing on axe skill only then you expect this character to be an outstanding axeman but appaling swordman. This is **NOT** like that in M&M engine. Mastering the skill is undoubtedly more difficult endeavour than aquiring an expensive item. Yet those expensive items give about same bonus in attack and damage as mastering the skill. I would love to turn this around and give skills their well deserved attention. Usually one could raise their selected skills somewhere to level 10 on average by the end of the game. Since there are so few of them we should make player to cherish each skill point and use every possibility to invest more in primary weapon skills.

# Recovery mechanics

Intuitive player assumption is that bigger stat value is better, the bonus is positive, penalty is negative. MM recovery mechanics uses an inverse scale which makes it a little difficult to grasp at first. This also creates inherent flaw when attack rate growths faster with skill progression and then suddenly stops at easily reachable cap. From then on it is a complete waste to invest into recovery any more. All speed increasing weapons suddenly become uneffective to develop any further.

This mod internally introduces a notion of attack rate which is a reciprocal to recovery time. All recovery time bonuses now increase the attack rate and it is computed same way as any other positive game stats. Meaning adding 100 attack rate bonus on top of initial 100 attack rate value makes player attack twice as fast which corresponds to 50 recovery. With this approach reaching recovery time cap is still possible but much harder. Thus we safely can stop worrying about the cap. See computation example below.

With all additional bonuses added melee cap is reached at the skill level 22 at the end of the game. Range cap is reached at the skill level 190 which is never. Regardless of caps recovery time in this model it is never negative.

Keep in mind that even though computation mechanics changed the attack rate value is still converted to recovery for the purpose of UI display and in game text/help and combat computations.

## Computation example

### Vanilla

<pre>
Dagger		=  60 base recovery
500 speed	= -30 recovery bonus
haste		= -25 recovery bonus

result		=   5 recovery which is actually capped at 30
</pre>

### This mod

<pre>
Total recovery reduction bonus from above example = 100 - 5 = 95
This mod treats it as attack rate increase bonus = +95
Resulting attack rate = 100 + 95 = 195
Converting back to resulting recovery = 100 * (100 / 195) = 51, cap is not reached
</pre>

# Combat skills

## Weapon skills

All skills provide same bonuses as they do in vanilla. However, these bonuses are available immediatelly at Normal rank. Rank now controls how fast these bonuses progress with level instead of triggering them. Bonuses increment per level is much higher than in vanilla and varies based on their combat impact.

## Bonus increment per level based on rank

|bonus|normal|expert|master|
|----|----:|----:|----:|
|Attack|2|3|4|
|Speed|2|3|4|
|Damage|2|3|4|
|Dagger chance to cause triple damage|3|4|5|
|Armor Class from weapon|4|6|8|
|Armor Class from shield|4|6|8|
|Armor Class from leather|2|3|4|
|Armor Class from chain|4|6|8|
|Armor Class from plate|6|9|12|
|Resistances from leather|4|6|8|
|Resistances from chain|2|3|4|

## Special abilities

### Staff special abilities

Staff has a chance to shrink or feeblemind opponent. One of these effects is randomly chosen when Staff triggers the effect. These abilities are immediately available at normal skill rank.

* Chance to cause an effect = 10% + 2% \* skill level.
* Effect duration = 5 minutes.

### Mace special abilities

Mace has a chance to paralyze opponent. This ability is immediately available at novice rank.

* Chance to cause an effect = 5% + 1% \* skill level.
* Effect duration = 5 minutes.

## Armor speed penalties

|armor type|normal|expert|master|
|----|----:|----:|----:|
|leather|10|5|0|
|chain|20|10|0|
|plate|30|15|0|

# Dual wielding

Dual wielding rules are quite complicated in MM6. Player need to remember which weapon uses attack, speed, damage bonuses and which does not. Ugh. Moreover, some of the skill bonuses and enchantment effects may not work if you apply them to the weapon in wrong hand. Most of the time you are out of luck as you cannot possibly wield some weapons in off hand. This is certainly a waste of skills and enchantments. Why not make them all count? That makes it much easier to distribute skill points and fairer to both weapon skills.

## Dual wield mechanics modification

All weapon bonuses are counted!!! Player can mix and match them as they see fit and get full benefit of weapon, skill, and enchantment bonuses from **each** weapon regardless of mix type. Weapons do not shadow each other abilities anymore.

# Two-handed weapon double damage

Two handed weapons confer double damage for their listed damage value. This gives party some damage boost at the beginning of the game when combat skills are yet undevelopped.

# Class specialty

MM6 classes are kind of indistinguishable in weapon skills. That's why Paladin is superior to Knight in any way as they can develop all the same weapon/armor skill but also have magic on top of that. I believe some class weapon specialization is in order to make them really represent their strengths.

## Additional weapon skill damage/level for classes

|initial class|weapon type affected|initial|1st promotion|2nd promotion|
|----|----|----:|----:|----:|
|Knight|all melee weapons|2|3|4|
|Paladin|all melee weapons|0|1|2|
|Archer|all ranged weapons|2|3|4|

This is similar to MM7 arms-master bonus. Knight become an ultimate arms-master with Paladin following. Archer specializes in ranged damage instead and now becomes quite powerful shooter.

# Weapon usage preference analysis

## Singe wield vs. Dual wield vs. two-handed

Single wield is inferior to any other wielding type as it was in vanilla. It is a waste to not use extra hand. If not for offense than for defense (shield) at least.

Dual wield in this mod combines attack and speed bonuses from both weapon giving dual wielding some boost. Not too big, though. Attack improves badly in long run. Speed progresses well at the beginning but then slows down and get capped. Damage is the only bonus that keeps progressing well beyond levels 20-30. Unfortunately, only weapons could be held in off hand (sword, dagger) do not confer damage bonus. So dual wielding does better in this mod comparing to vanilla but not enough to confidently outrun two-handed weapon progression.

The inherent problem with wielding two different items in both hands (weapon-weapon or weapon-shield) is that skill points are split between two skills slowing down their progression comparing to a single type two-handed weapon that doesn't share skill point pool with anything else. Therefore, two-handed axe generally progresses about 1.4 time faster than their one-handed counterparts. That is 1.4 accuracy \* 1.4 speed \* 1.4 damage. Two-handed weapon is always preferrable for Archer as a single non specialized melee fighter class that can hold them. Magic classes (Cleric, Druid, Sourcerer) are not capable of wielding any significantly offensive 2h or dual combo.

Specialized melee fighter classes (Paladin, Knight) are special case as they receive damage bonus for **every** weapon held. As such Knight should definitely prefer axe-sword dual wielding for max offense benefit. He does not need sacrifice weapon offensive power for additional protection as his plate and abundant HP protect him enough already. Paladin receives half of Knight damage bonus and, therefore, may opt for either dual or two-handed wielding - player's choice.

Sword-sword and dagger-dagger combos are special case as they progress as fast as two-handed weapon due to same weapon type in both hands. However, since they both lack damage bonus, these combos have mediocre offense and do not compete with axe-sword, spear-sword options.

## Class weapon usage suggestions

|class|preferred wielding|comment|
|----|----|----|
|Knight|Axe-Sword|Best offensive combo for Knight.|
|Paladin|Axe-Sword or 2h Axe|Both are about equally offensive in Paladin hands. 2h Axe is slightly better at the beginning due to two-handed weapons double damage. Dual wielding starts slowly overtaking it after level 20 or so. They are about same in the middle.|
|Archer|2h Axe, 2h Spear|2h Axe is the most effective skill point investment offensive option. 2h Spear is good for extra protection but Archer is probably not the weakest one in your party. Unless you are playing without casters at all.|
|Cleric|Mace-Shield|Mace definitely for paralyzing. Shield is for extra protection if you don't care about small recovery penalty.|
|Druid|Mace/Dagger-Shield|Double daggers are about twice as offensive comparing to a single dagger, of course. However, they still is not match to any other decent combo. Better protect the weakling.|
|Sourcerer|Staff|Best option due to its special effects benefitting whole party greatly.|

# Spells

All spells always hit. Making just a few spells to hit depending on skill level is too fine grained and hard to visualize mechanics that is absolutely not needed.

Most spells generally progress well with skill level. This is an adjustment for those that do not. I've reshuffled their fixed and per level values so that they have more standard strength formula: X + 1-X / level. At the same time I tried to make old and new versions about equally strong at level 4.

All stat boost spells affect whole party at novice level.

|spell|fixed|per level|
|----|----:|----:|
|All stat boosts|10|2, 2, 2|
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
|Stone Skin|20|4|
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

Extremely non-lenear stat breakpoint/effect progression renders any stat boosting effects useless toward the end of the game.

## Solution

* Make stat effect either exactly linear or close to linear.
* Reduce initial stat effect to stat value ratio from vanilla 1:2 down to 1:5.

These changes together make stat boosts weak but relevant to the end of the game. At the same time it does not allow stat effect to overflow character secondary stats (attack, recovery, damage, AC, ...).


 Here is the modified table below. It is 1 effect per 5 stat increase along all scale. However, breakpoint intervals getting bigger at 50, 100, 200, 300. Most likely you will never go above 300 so your Extreme Energy will always work and produce same predictable result.

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

# Learning skill bonus multiplier

* Novice triples bonus.
* Expert quadruples bonus.
* Master quintuples bonus.

# Missiles auto aim in flight

Missiles (arrows and spells) constantly 3D auto aim their initial target while in flight. Both party and monster cannot dodge missiles by moving sideways/up/down as long as there are no obstacles between missile and target. Running or flying past bunch of shooters in real-time mode is not safe anymore. Nor is flying up/down in turn based mode. It is still possible to avoid the missile by hiding behind an obstacle as before.

This invalidate the strategy of running past shooting outdoor monsters to some important location. Now these previously largely ignored outdoor troops actually guard their territory. One need to kill them all to be able to pass safely.

Later addition. Dargon towers shoot homing fireballs now. They are faster than flight speed. Therefore now it is really dangerous to fly without switching them off first.

# Bringing needed hirelings to party

This is a convenience fix. I am tired to reload game hundreds times just to find needed hireling. Time waste. I have implemented a keyboard shortcut that brings available outside walking peasants to the party and set their professions. I've added just two now but can do more if people need more shortcuts.

* Works outside only and brings outside peasants only if they are available.
* Hiring peasant NPC removes them from the map so you may run out of them on a particular map.

| Shorcut | Hirelings |
|----:|----:|
| Alt+1 | Instructor, Teacher |
| Alt+2 | Merchant, Trader |
| Alt+3 | Pathfinder, Tracker |

