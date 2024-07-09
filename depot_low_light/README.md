# Shadows

## Jagged shadows

Shadows can be sharper in certain scenes. (e.g., [Edifice demo](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Edifice%20demo) depot scene with low light.)

In [Ogre2Scene.cc](https://github.com/gazebosim/gz-rendering/blob/gz-rendering8/ogre2/src/Ogre2Scene.cc#L654), increasing `texSize` from `2048u` (original value) to `4096u` increases shadow texture resolution for different light types (point, directional, spot) with no significant performance implications (hovers around ~60 FPS for all scenes).

#### Point light with `texSize = 2048u` vs. `texSize = 4096u`:

<img src="./jagged shadows texSize/point light texsize 2048u.png" width ="450"/> <img src="./jagged shadows texSize/point light texsize 4096u.png" width ="450"/>

#### Directional light with `texSize = 2048u` vs. `texSize = 4096u`:

<img src="./jagged shadows texSize/directional light texsize 2048u.png" width ="450"/> <img src="./jagged shadows texSize/directional light texsize 4096u.png" width ="450"/>

Spotlights are interesting - the larger the `<outer_angle>` is, the more jagged the shadows are. When comparing `texSize = 2048u` vs. `texSize = 4096u`, the difference in shadow texture resolution is minimal for `<outer_angle> = 1`, whereas it is more noticeable for `<outer_angle> = 2`.

#### Spot light with `texSize = 2048u` vs. `texSize = 4096u`, where `<outer_angle> = 1`:

<img src="./jagged shadows texSize/spot light outang 1 texsize 2048u.png" width ="450"/> <img src="./jagged shadows texSize/spot light outang 1 texsize 4096u.png" width ="450"/>

#### Spot light with `texSize = 2048u` vs. `texSize = 4096u`, where `<outer_angle> = 2`:

<img src="./jagged shadows texSize/spot light outang 2 texsize 2048u.png" width ="450"/> <img src="./jagged shadows texSize/spot light outang 2 texsize 4096u.png" width ="450"/>