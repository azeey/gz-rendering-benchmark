# Discoloration and Banding

Discoloration and banding issues occur when the scene has low ambient values (aka low lights). (e.g., [Edifice demo](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Edifice%20demo) depot scene.)

## Gamma Correction

### Discoloration

When using Ogre2, one issue that is causing the discoloration is an incorrect application of gamma correction. The current gamma correction is done manually in `gz-gui`'s `MinimalScene.cc`.

#### Depot scene with manual gamma correction vs. usage of `glEnable(GL_FRAMEBUFFER_SRGB)`

<img src="./img/depot manual.png" width ="450"/> <img src="./img/depot glenable.png" width ="450"/>

Note the discoloration the barrels (more pink/grey than red) as well as the crates in the background (parts are colored red despite having a tan albedo texture).

In `MinimalScene.cc`, the discoloration disappears when the manual application of gamma correction in `LoadConfig()` is removed from and `glEnable(GL_FRAMEBUFFER_SRGB)` is added to `LoadConfig()`. However, <mark>the GUI elements become faded (a lighter color), while the scene as a whole darkens a bit.</mark>

### Banding

When testing with a gradient material, it is observed that there is a banding issue for the `gz-gui` view, but none for the camera sensor view. 

### Gradients texture displayed with `gz-gui` view (left) vs. camera sensor view (right), with 

<img src="./img/gradients manual.png" width ="900"/>

However, when removing manual gamma correction and adding `glEnable(GL_FRAMEBUFFER_SRGB)`, 

#### Gradients texture displayed with `gz-gui` view (left) vs. camera sensor view (right)

<img src="./img/gradients glenable.png" width ="900"/>