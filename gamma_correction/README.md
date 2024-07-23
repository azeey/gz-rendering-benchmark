# Discoloration and Banding

Discoloration and banding issues occur when the scene has low ambient values. (e.g., [Edifice demo](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Edifice%20demo) depot scene with low light.)

## Gamma Correction

### Discoloration

When using Ogre2, one issue that is causing the discoloration is an incorrect application of gamma correction. The current default gamma correction for the GUI is done [manually in `gz-gui`'s `MinimalScene.cc`](https://github.com/gazebosim/gz-gui/blob/179f0e659f8cf03edcfe9d445d59875a8a16c3e8/src/plugins/minimal_scene/MinimalScene.cc#L1548-L1553), supported by QML's [`GammaAdjust`](https://github.com/gazebosim/gz-gui/blob/179f0e659f8cf03edcfe9d445d59875a8a16c3e8/src/plugins/minimal_scene/MinimalScene.qml#L60-L66).

#### Depot scene with manual gamma correction vs. usage of `glEnable(GL_FRAMEBUFFER_SRGB)`

<img src="./img/depot manual.png" width ="450"/> <img src="./img/depot glenable.png" width ="450"/>

For the left image, note the discoloration the barrels (more pink/grey than red) as well as the crates in the background (some shadows are colored red despite the texture having a tan albedo texture).

What is interesting is that the discoloration disappears when the manual application of gamma correction is removed from and `glEnable(GL_FRAMEBUFFER_SRGB)` is added to `MinimalScene.cc`'s `LoadConfig()`. However, it should be noted that the GUI elements become faded (a lighter color), while the overall scene becomes a bit darker.

### Banding

#### Gradients texture displayed with `gz-gui` view vs. camera sensor view, with manual gamma correction

<img src="./img/gradients manual.png" width ="900"/>

When displaying the gradient texture with manual gamma correction, it is observed that a banding issue is present in the `gz-gui` view, but it does not appear in the camera sensor view. So, it seems like <mark>gamma correction is done properly for camera sensors, but incorrectly for the GUI.</mark> 

#### Gradients texture displayed with `gz-gui` view vs. camera sensor view, with usage of `glEnable(GL_FRAMEBUFFER_SRGB)`

<img src="./img/gradients glenable.png" width ="900"/>

However, when removing manual gamma correction and adding `glEnable(GL_FRAMEBUFFER_SRGB)`, `gz-gui`'s banding issue disappears, but the camera sensor's view displays a brighter version of the gradient texture, which is interesting. Addiitonally, similar to the depot scene outputs from above, the GUI elements become faded.

### Inconsistency in rendering scenes with vs. without QML

#### Simple Demo (no QML) vs. Simple Demo QML

<img src="./img/simple demo no qml vs yes qml.png" width ="900"/>

`simple_demo` and `simple_demo_qml` examples from [`gz-rendering`](https://github.com/gazebosim/gz-rendering/tree/gz-rendering8/examples). 

Note how compared to the no QML scene, the QML scene is a somewhat dimmer, and also how the shadows are darker. Perhaps the gamma correction for QML (which is used to render the GUI, but not the camera sensors) is incorrectly done.

#### Gradients (no QML) in sRGB color space (default) vs. linear color space

<img src="./img/demo gradients default PFG_RGBA8_UNORM_SRGB.png" width ="300"/> <img src="./img/demo gradients force PFG_RGBA8_UNORM.png" width ="300"/>

Modified the `simple_demo` (no QML) program to display gradients texture (see `gradients demo`). The default pixel format for the destination texture is sRGB (as set with `Ogre::PFG_RGBA8_UNORM_SRGB` in [`Ogre2RenderTarget.cc`](https://github.com/gazebosim/gz-rendering/blob/a7cf4f0dba349f9f6fa9a70a8f082862e387f2e7/ogre2/src/Ogre2RenderTarget.cc#L583)). Forcing the destination texture's pixel format to be linear (with `Ogre::PFG_RGBA8_UNORM`) does show the gradients texture in the darker linear space, which is expected. 

#### Gradients QML in sRGB color space (default) vs. linear color space

<img src="./img/demo gradients_qml default PFG_RGBA8_UNORM_SRGB.png" width ="300"/> <img src="./img/demo gradients_qml force PFG_RGBA8_UNORM.png" width ="300"/>

Modified the `simple_demo_qml` program to display gradients texture (see `gradients_qml demo`). `gradients_qml` demo does not have manual gamma correction support from QML, so it is expected that both outputs look like Gradients (no QML)'s forced linear color space output.