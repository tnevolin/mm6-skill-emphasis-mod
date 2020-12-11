# Might & Magic 6: skill emphasis mod installation

[This document in nice formatting](https://github.com/tnevolin/mm6-skill-emphasis-mod/blob/master/Installation.md)

This mod requires GrayFace patch.

## Install GrayFace patch

https://github.com/GrayFace/Misc/releases/download/MM6Patch-2.4/MM6.Patch.v2.4.exe

* Download patch by link above.
* Run it and follow instructions.

## Install this mod

https://github.com/tnevolin/mm6-skill-emphasis-mod/tree/master/_releases

* Go to the release directory by the link above.
* Download latest release.
* Unpack it to a separate folder.
* Copy everything into game directory overriding existing folders/files if needed.
* Open mm6.ini in game directory and add following lines at the bottom
<pre>
[ExeMods]
MMExtension=(path to the game directory)\ExeMods\MMExtension.dll
</pre>
* Run game. MMExtension will generate data tables at first run. You'll see black screen for a minute or so. Don't panic and let it finish. Then play game normally.

