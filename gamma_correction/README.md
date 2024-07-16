# Discoloration and Banding

Discoloration and banding issues occur when the scene has low ambient values. (e.g., [Edifice demo](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Edifice%20demo) depot scene with low light.)

## Gamma Correction

### Discoloration

When using Ogre2, one issue that is causing the discoloration is an incorrect application of gamma correction. The currently default gamma correction is done manually in `gz-gui`'s `MinimalScene.cc`.

#### Depot scene with manual gamma correction vs. usage of `glEnable(GL_FRAMEBUFFER_SRGB)`

<img src="./img/depot manual.png" width ="450"/> <img src="./img/depot glenable.png" width ="450"/>

For the left image, note the discoloration the barrels (more pink/grey than red) as well as the crates in the background (parts are colored red despite having a tan albedo texture).

In `MinimalScene.cc`, the discoloration disappears when the manual application of gamma correction in `LoadConfig()` is removed from and `glEnable(GL_FRAMEBUFFER_SRGB)` is added to `LoadConfig()`. However, the GUI elements become faded (a lighter color), while the overall scene becomes a bit darker.

### Banding

#### Gradients texture displayed with `gz-gui` view vs. camera sensor view, with manual gamma correction

<img src="./img/gradients manual.png" width ="900"/>

When displaying the gradient texture with manual gamma correction, it is observed that a banding issue is present in the `gz-gui` view, but it does not appear in the camera sensor view. So camera sensors are correctly applying gamma correction, but not the GUI. 

#### Gradients texture displayed with `gz-gui` view vs. camera sensor view, with usage of `glEnable(GL_FRAMEBUFFER_SRGB)`

<img src="./img/gradients glenable.png" width ="900"/>

However, when removing manual gamma correction and adding `glEnable(GL_FRAMEBUFFER_SRGB)`, `gz-gui`'s banding issue disappears, but the camera sensor's view displays a brighter version of the gradient texture, which is interesting.

### Inconsistency in rendering scenes with vs. without QML

#### Simple Demo (no QML) vs. Simple Demo QML

<img src="./img/simple demo no qml vs yes qml.png" width ="900"/>

Examples from [`gz-rendering`](https://github.com/gazebosim/gz-rendering/tree/gz-rendering8/examples). 

Note how compared to the no QML scene, the QML scene is a somewhat dimmer, and also how the shadows are darker. Perhaps the gamma correction for QML (which is used to render the GUI, but not the camera sensors) is incorrectly done.

#### Gradients (no QML)

<img src="./img/gradients no qml.png" width ="300"/> 

Modified the `simple_demo` (no QML) program to display gradients. Next step is to display with QML support.