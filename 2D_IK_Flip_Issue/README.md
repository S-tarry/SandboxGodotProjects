**Subject:** IK 2D issue when mirroring a character.<br>
**Description:** when the character changes direction (using the A/D keys), their legs “bend” or twist in the opposite direction.<br>
**Code for mirroring a character:**<br>
```gdscript
  if x_input != 0:
		_animation.scale.x = sign(x_input)
```
<br>
I also tried turning off “Enable Constraint” for the bones, but that didn't help.<br>
I searched for an answer online, but couldn't find anything.<br><br>

**Video showing the bug**<br>
https://github.com/user-attachments/assets/c57c1009-9f84-422d-9fbf-939c109aca18<br><br>

**The 'Animation' scene and its elements**<br>
<img width="346" height="795" alt="Tree" src="https://github.com/user-attachments/assets/25f63a86-893e-47d2-90c7-980d7da7e238" /><br>

**Configuring the SkeletonModificationStack2D modifier**<br>
<img width="395" height="870" alt="Skeleton2D" src="https://github.com/user-attachments/assets/90efd6f5-ad86-41a1-a5b6-7725647e0a99" /><br>

**The 'Animation' scene in CharacterBody2D**<br>
<img width="351" height="783" alt="PlayerTree" src="https://github.com/user-attachments/assets/9f36a814-b441-44ae-b7bd-d8f545693354" />
