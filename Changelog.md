# version 76

* Fixed Dagger crowd damage. It is now accounts for active monsters only.
* Fixed Plate cover skill. It is now applied to active player only.

# version 75

* Added code to process other custom values in monsterInfo.
* Guardian Angel now adds 1000 bonus to Endurance regardless of skill when checking whether unconscious character dies from low HP.
* Fixed Guardian Angel bug when it caused revivied character to immediatelly die again.
* Feeblemind now disables monster special abilities to do bad things to character.
* Fixed typo in monster customization Attack2 value assignment. Now it should display correctly in monster info dialog.
* Fixed book value computation to not affect any other objects (thanks to Malekith).

# version 74

* Reprogrammed monster damage computations. Experimental. Needs testing.
	* Attack1 stays as is.
	* Attack2 used Attack1 base damage. Fixed this to properly use Attack2 base damage instead.
	* Spell damage had completely inexplicable computation. Fixed it to use proper spell damage computation as in description.
		* Excluding Mass Distortion - it uses victim HP for damage computation. Hopefully, monsters don't use it.
		* Excluding Finger of Death - it uses victim HP for damage computation.

# version 73

* Fixed shield displaed recovery penalties not being reduced with mastery.

# version 72

* Fixed bug when second plate wearer didn't cover.

# version 71

* Fixed Altar of Electricity.

# version 70

* Added handler for ranged weapon damage calculation by skill.

# version 69

* Fixed bug with dual wielding use.

# version 68

* Sword speed bonus: 0-4-4.
* Axe speed bonus: 0-2-2.
* Sword damage bonus: 0-0-1.
* Bow damage bonus: 0-1-1.
* Archer bow damage bonus: 1-1-1.
* Dual wield uses full skill level instead of dividing by sqrt(2).
* Melee weapon group is split to two groups: {sword, dagger} and others.

# version 67

* Fixed Shrapmetal. It does not autoaim anymore as it should. 

# version 66

* Fixed shield reducing projectile damage.

# version 65

* Fixed occasional crash when checking monster stats.

# version 64

* Guardian Angel spell modification.
	* Spell lowers death HP threshold by 10 per skill point for all characters.
	* Spell duration is 1 hours + 5 minutes times skill level.
	* Spell description is updated accordingly.

# version 63

* Added ranged attack of different kind to some lesser outdoor monsters. The attack type is either weaker version of what advanced kind already has (Goblin King, Mystic of Baa) or something lore wise (Catpurse throws knifes, Skeleton shoots arrows). That reduces the slaughter shooting over the river tactics as well as increase value of shield spell (more arrow shooting monsters).

Highly experimental feature as I manually modified monsters statistics. Please report any irregularities.

# version 62

* Added blaster entries everywhere bow goes. I completely forgot blaster is a weapon. :(
* Slight modification to spear type base damages to keep their 1H (spear < trident < halberd) and 2H (spear > trident > halberd) values. Nothing too drastic, though. Evened out their bonuses too.
  * Spear: 1d11
  * Trident: 2d6
  * Halberd: 4d3
* Also fixed parameters not being changed for some spear type items.
* Archer does not give more damage to ranged weapons (bow, blaster) with skill. Instead they double attack and recovery bonuses for them.
* Slightly increased initial recovery bonus for dagger and blaster to bring them closer to their vanilla values. Their recovery does not progress with skill anyway.
* Corrected blaster attack. Previous calculations didn't account for vanilla skill rank attack multiplier.

# version 61

* Two handed weapon does not double own damage. Each weapon stats are now modified accordingly instead. It is cleaner this way.
	* Max bonus for two-handed swords and axes is increased to match dual wielding option.
	* Base damage for all spears, tridents, halberds is modified to even them out a little. Spear is slightly stronger two-handed and halberd is slightly stronger one-handed with trident in between.
	* Some weapon bonuses are spread more evenly according to their price.
* Two-handed weapon damage increment by skill is increased to 3 to match improved general weapon stat progression.

# version 60

* Reverted sword and axe base recovery to vanilla values. I didn't see much use making axe exceptionally bad and unusable in early game. Each weapon should have its merits.

# version 59

* Reverted spear attack bonus to 2x of normal. I have analyzed it and it really doesn't add much on average but may be slightly useful against heavily armored monster that party encounter early. Like gold dragon in the temple of the snake.
* Set damage progression to 2-3-4, recovery progression to 4-5-6. This should not be too much against doubled monster health. Anything below that was too indistinguishable from vanilla progression.
* Restored double weapon damage for two-handed sword, spear, and axe. They need to match damage of their dual versions. That makes two-handed spear quite a strong early game weapon but this benefit wear down quickly with skill advancement.
* Dagger is redesigned as crowd fighting weapon giving it extra damage per each enemy in melee range per level of skill. It overtakes best combos with 10+ enemies in close combat.

# version 58

* Double own damage is applied to two handed swords only and not to other two handed weapons. Otherwise, two handed spear becomes an extremely powerful in early game.
* All combat classes get spear and leather as initial skills. It seems to be a most powerful and fast combination in early game. If so then why seeking anything else?
* Added damage rate for current player against given monster in monster info. That shows more precise damage rate than the one in player screen against generic 100 AC monster.
* Disabled monster anti-sub zigzagging and let them go straight to the party to catch up quicker. This maneuver is no good against homing missiles anymore.
* Monster engagement area is increased. Now more monsters jump at you when you disturb at least one.

# version 57

* Modified classes starting skills. Gave them mostly their preferable weapon and best armor. Removed magic from starting skills to allow better magic distribution across party. Archer is no longer bound to stuck with air magic. Also archer no longer has bow skill by default but it can be chosen. I guess one shooter doesn't really save the party in early game.
* Fixed bug with magic attack.

# version 56

* Monster damage is doubled. I think it still should be fair enough with additional buffs but let me know if it is too much.

# version 55

## Shrine behavior changed

Shrines provide one blessing per calendar year and these blessing are accumulated and never lost and can be claimed any time regardless of month. Seer still tells you which shrine to visit but this has no effect.

For example, if player never visited shrine of might first year and then visited it second year they are entitled for two blessings for two passed years right away (i.e. +10 and +3 might). This way blessings opportunity is never lost even when player unable to reach the shrine in its corresponding month.

This feature makes this version incompatible with older saves due to newly introduced counter variables.

I have pretty limitedly tested it on few shrines and few months. It seems to work properly but bugs still may be lurking around. Let me know if you see any inconsistencies or installation problems.

# version 54

* Spear attack bonus grows tuned down a little on higher ranks. It is now: 4-5-6 and the same is reflected in spear skill description.
* Spear does not grant AC bonus anymore and it is also reflected in description.
* Monster HP is doubled to match the corresponding early dagger and 2h weapons damage increase. Even with this buff I believe they are still easy to beat but let's adjust slowly.

# version 53

* Dagger does not have modified tripled damage chance. Nor that was ever implemented.
* Instead dagger damage bonus is tripled. That makes it very desirable early game weapon.
* Spear attack grows twice as fast with skill. That emulates spear to be long reach armor piercing weapon improving hit chance against heavy armored targets.

# version 52

* Displayed more info on monster information dialog.
* Magic immunity threshold lifted to 1000. Now all immunities are just 200 resistances.

# version 51

* Plate wearers now cover party members from physical melee attacks only. It doesn't suit plate skill to work anti-magic.
* Shield wearers reduces damage of all kind of physical and magical projectiles damage.

# version 50

* Party beneficial miscellaneous skills are now advanced simultaneously for all party members.
	* Identify Item
	* Merchant
	* Repair
	* Perception
	* DisarmTraps

# version 49

* Close range spell damages are increased to compete with knight melee damage.

# version 48

Further reduced weapon skill progression and magic to make magic more aligned with might.

* Monsters HP reverted to their vanilla value. They are no more double tough.
* Recovery bonus by mastery: 2, 3, 4.
* Damage bonus by mastery: 0, 1, 2.
* Reverted some spell damage to original values.

# version 47

* All learned melee weapon, ranged weapon, and armor skills are advanced at the same level when any one is advanced withing a group. This unlocks melee/ranged weapon and armor switching along the game without losing past skill point investments.
* Dual weapon skill levels are adjusted to simulate two weapons skill point investment split. They are divided by sqrt(2) for the purpose of skill contribution if different weapon types.

# version 46

* Reduced Factor and Banker cost 5 times. They are now more useful and pay for themselves after ~1k gold found, not after ~10k as in vanilla.
* Added more NPC shortcuts.

# version 45

Further tune up of might vs. magic balance.

* Reverted attribute effects back to vanilla. Linear scale requires more attribute balance thinking which I despise. Better leave it as it was.
* [Slightly decreased weapon speed and damage bonuses](https://github.com/tnevolin/mm6-skill-emphasis-mod#bonus-increment-per-level-based-on-rank).
* [Slightly increased spell damage here and there](https://github.com/tnevolin/mm6-skill-emphasis-mod#modified-spell-values).

# version 44

* New hirelings hot key: Alt-6 = Weapons Master, Squire

# version 43

* Reverted recovery formula to pre version 42.
* Set melee recovery cap to 10. It is almost never reachable now.
* Attack bonus/level by mastery: 2, 3, 4.
* Recovery bonus/level by mastery: 4, 5, 6.
* Damage bonus/level by mastery: 2, 3, 4.
* Two handed weapon adds 2 bonus damage per skill regardless of rank.
* Axe base recovery is 120.
* Sword base recovery is 100.
* Paladin and Knight damage bonus is added to extra hand weapon only if it is differnt type from main hand weapon (not sword-sword or dagger-dagger).
* Monster damage is no longer doubled.
* Monster experience is no longer doubled.

# version 42

* Changed formula for recovery to never reach cap.
* Attack bonus/level by mastery: 4, 5, 6.
* Recovery bonus/level by mastery: 4, 5, 6.
* Damage bonus/level by mastery: 4, 5, 6.

# version 41

* Further removed some useless NPCs.

# version 40

* Changed book price progression to make it more steep. Cheapest book is now 4 times cheaper. Most expensive one is 10 times more expensive.

# version 39

* Staff adds small amount of all resistances to all party members.

# version 38

* Damage rate against enemy with AC = 100 is displayed in character states screen and quick reference screen next to corresponding attack number.

# version 37

* Plate wearer sometimes takes a hit for other team member shielding them with their body.
* Weapon attack bonus per skill: 2,3,4.
* Weapon speed bonus per skill: 4,5,6.

# version 36

* Enhanced engagement algorithm so it don't trigger when party gem is green.
* Temple healing prices are equalized across all temples and are scaled with party experience.
* Inn room prices are equalized across all temples and are scaled with party experience.
* Inn food prices are equalized across all temples and are scaled with party experience.

# version 35

* Training ground prices are adjusted to match limit. This way all of them will be used eventually.

# version 34

* Monster engagement range is widened. They attack party immediately and in larger groups. No more sniping them one by one.

# version 33

* Monsters' hit points is doubled.
* Monsters' physical attack dice rolls is doubled.
* Monsters' spell attack level is doubled.
* Monsters' armor class is doubled and smoothened up a little. A lot of vanilla monters had pretty low armor class even medium level creatures.
* Monsters' level is smoothened up a little. A lot of vanilla monters had pretty low level even medium level creatures.
* Monsters' movement speed is significantly increased. Party cannot outrun them anymore. Yet they still do stupid zigzag movement.
* Monsters' experience is doubled.
* Attack bonus by mastery: 4, 5, 6.
* Recovery bonus by mastery: 6, 7, 8.
* Axe recovery bonus is -20.
* Sword recovery bonus is -10.

# version 32

* Disabled primary stat fountains raising primary stats by 2 if below 15. They are real temptation to visit them **before** visiting altars. The strategy requiring quick maps traversal in front of yet strong monsters. That breaks the steady development and exploration plan.

# version 31

* Added keyboard shortcut to bring WindMaster, WaterMaster.

# version 30

* Added keyboard shortcut to bring Pathfinder, Tracker.

# version 29

* 2h weapons do not get extra damage per skill level anymore.
* 2h weapons confer double listed damage.
* Recovery bonus by mastery: Novice = 2, Expert = 3, Master = 4.
* Dual weapons contribute their full recovery bonus (both base and skill) toward resulting recovery.
* Weapon base recovery bonuses are reverted to vanilla values.
* Chance to hit formulas are reverted to vanilla algorithms.
* Staff chance to cause a special effect = 10% + 2% \* skill level.
* Mace chance to cause a special effect = 5% + 1% \* skill level.
* Staff now does not cause both special effects independently. It is either one or another exclusively.
* Sword and dagger do not have special bonus when held in right hand anymore.
* Weapon skill AC by rank: 4,6,8.
* Shield skill AC by rank: 4,6,8.
* Leather skill AC by rank: 2,3,4.
* Chain skill AC by rank: 4,6,8.
* Plate skill AC by rank: 6,9,12.
* Chain skill resistance by rank: 2,3,4.
* Leather skill resistance by rank: 4,6,8.
* All stat boosts power changed to 10 + 2 * level.
* Stone Skin power changed to 20 + 4 * level.

# version 28

* Physical attack chance to hit formulas revamped completely to maintain attack and AC importance throughout the whole game. See readme.

# version 27

* Dragon towers shoot homing fireballs.

# version 26

* Reprogrammed keyboard shortcuts to use MME functions.

# version 25

* Keyboard shortcuts to bring desired professionals to the party.

# version 24

* Fixed homing algorithm. Sometimes object target index is out of monster map range and causes game crash.

# version 23

* Removed homing from Fire Blast, Meteor Shower, Sparks, Starburst, Poison Spray.

# version 22

* Fixed Feeblemind so it actually works.
* Staff special abilities duration is 5 minutes.
* Mace special abilities duration is 5 minutes.

# version 21

* Missile in flight auto aim.

# version 20

* [fix] Staff is now properly causes Shrunk based on Staff skill rank.
* [fix] Staff skill now does not add damage bonus for two-handed weapon.

# version 19

* Staff causes Shrunk instead of Slowed. Effect strength is based on Staff skill rank.
* Staff chance to cause an effect is 5% + 2% \* skill level.
* Staff effect duration is 10 minutes.
* Mace effect duration is 10 minutes.

# version 18

* Removed skill advancement cost modification. The vanilla version is good as is.
* Learning skill bonus multiplers are 3/4/5 instead of 1/2/3 in vanilla.

# version 17

* Two handed weapon adds 2 bonus damage per skill regardless of rank.

# version 16

* Archer/BattleMage/WarriorMage adds 2/3/4 damage/level to all ranged weapons.
* Staff chance to cause an effect is 10% + 4% \* skill level.
* Staff effect duration is 3 minutes.
* Mace chance to cause an effect is 5% + 2% \* skill level.
* Mace effect duration is 3 minutes.

# version 15

* Stat effects ratio is reduced to 1:5.
* Monster XP is back to normal.
* All stat boosts affect whole party.
* All stat boosts formula is 10 + 5 \* level.

# version 14

* Skill advancement cost formula is reverted to vanilla but cost is capped at 10.

# version 13

* Blade (sword, dagger) in right hand doubles its skill attack bonus.
* Blade (sword, dagger) can be held in left hand at novice rank.
* Stone Skin power = 5 + 1 * level.
* Bless power = 5 + 1 * level.
* Heroism power = 5 + 1 * level.
* Arms Master costs 1000.
* Weapons Master costs 1500.
* Squire costs 2000.
* Attribute breakpoints changed.

# version 12

* ArmsMaster, WeaponsMaster, Squire now correctly add to weapon/armor skill.

# version 11

* Flattened skill advancement cost a little.

# version 10

* Protection spells strength multiplier by rank: 3/4/5.

# version 9

* ?

# version 8

* Stat effect = ((S - 1) / 2) - 6
* Shield skill AC bonus reduced.
* Armor skill AC bonus reduced.
* Armor skill resistance bonus increased.
* Weapon skill attack bonus reduced.
* Weapon skill speed bonus reduced.
* Weapon skill damage bonus reduced.
* Weapon skill AC bonus reduced.
* Weapon skill resistance bonus removed.
* Monster HP is reduced (x2 now).

# version 7

* Staff does not add to resistances.
* Armor Class from shield: |20|25|30|
* Armor Class from leather: |5|10|15|
* Armor Class from chain: |10|15|20|
* Armor Class from plate: |15|20|25|
* Resistances from leather: |3|4|5|

# version 5

* Updated MMExtension.

# version 4

* Updated installation package and instructions.

# version 3

* Healing Touch heals 3-7/6-14/15-35. Reduced expert rank effect.
* First Aid heals 5/10/25. Reduced expert rank effect.

# version 2

* Fixed Healing Touch.

# version 1

* Recovery time bonus is attack speed bonus.
* Weapon base recovery/speed bonuses are doubled (see readme).
* Chance to hit formulas changed (see readme).
* Dual wielding recovery is an average of both weapons recovery with all effects and skill bonuses included.
* Dual wielding attack is a sum of both weapons attack all effects and skill bonuses included.
* Dual wielding damage is a sum of both weapons damage all effects and skill bonuses included.
* Weapon skill adds 6/8/10 attack/level for all weapons.
* Weapon skill adds 4/6/8 speed/level for weapons with recovery bonus.
* Weapon skill adds 3/4/5 damage/level for weapons with damage bonus.
* Weapon skill adds 9/12/15 AC/level for weapons with AC bonus.
* Weapon skill adds 3/4/5 resistance/level for Staff.
* Mace chance to cause paralysis is 6/8/10.
* Staff chance to cause slow and feeblemind is 12/16/20.
* Mace and staff effect duration is 1 minute per skill level.
* Two handed weapon adds 0/1/2 damage/level to all two handed weapons.
* Knight/Cavalier/Champion adds 2/3/4 damage/level to all melee weapons.
* Paladin/Crusader/Hero adds 0/1/2 damage/level to all melee weapons.
* Archer/BattleMage/WarriorMage adds 0/1/2 damage/level to all ranged weapons.
* Leather/Chain/Plate speed penalties are 20/40/60.
* Armor skill adds 15/20/25 AC.
* Shield skill adds 20/30/40 AC.
* All 4 spells those hit chance was based on skill level are now always hit.
* Ring of Fire damage is 3 + 1-3 per level.
* Meteor Shower damage is 4 + 1-4 per level.
* Inferno damage is 5 + 1-5 per level.
* Starburst damage is 8 + 1-8 per level.
* Ice Blast damage is 10 + 1-10 per level.
* Death Blossom damage is 8 + 1-8 per level.
* Mind Blast damage is 4 + 1-4 per level.
* Harm damage is 5 + 1-5 per level.
* Flying Fist damage is 14 + 1-14 per level.
* Prismatic Light damage is 10 + 1-10 per level.
* Stone Skin adds 5 AC per level.
* Bless adds 5 attack per level.
* Heroism adds 2 damage per level.
* Healing Touch heals 3-7/9-21/15-35.
* First Aid heals 5/15/25.
* Cure Wounds heals 5 \* level.
* Power Cure heals 5 \* level.

* Monsters have 4 times hit points.
* Monsters attack 2 times stronger.
* Monsters provide 2 times experience.

