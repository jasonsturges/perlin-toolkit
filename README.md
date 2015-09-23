# Perlin Toolkit

Randomly generated background animations using perlin noise producing unique experiences each instance.

[Demo it in action here](http://labs.jasonsturges.com/blog/perlin-toolkit/).

![atomic-cloud](http://labs.jasonsturges.com/blog/perlin-toolkit/atomic-cloud.png)

### Presets

Choose a preset for animation to select an atmosphere of:

- _**Aether**_ &mdash; Fluffy upward movement
- _**Ambient**_ &mdash; Dusty still deep color tones
- _**Arc**_ &mdash; High voltage electric arcs
- _**Atomic Cloud**_ &mdash; Plumes of smokey mushroom clouds
- _**Aurora**_ &mdash; Gentle sweeping dancing lights
- _**Caustic**_ &mdash; Underwater patterns
- _**Fog**_ &mdash; Dense white mist
- _**Fusion**_ &mdash; Fast bursts of bright light
- _**Gasoline**_ &mdash; Rusty detailed smog
- _**Incandescent**_ &mdash; Soft light lit by white hot wire
- _**Ink**_ &mdash; Blotchy puddles spilling
- _**Lace**_ &mdash; Soft still of whites with a touch of color
- _**Lava**_ &mdash; Pools of red magma flowing
- _**Luminous**_ &mdash; Magical poofs of clouds
- _**Marble**_ &mdash; Still stone pattern
- _**Oil**_ &mdash; Slicks of rich color floating on the surface of water
- _**Rotary**_ &mdash; Dark circular movement
- _**Sulfur**_ &mdash; Rusty still, very similar to gasoline texture
- _**Throttle**_ &mdash; High speed blur passing by
- _**Vortex**_ &mdash; Rapid intense movement, similar to fusion texture

## Getting Started

`PerlinTexture` is a `DisplayObject`, simply added to the stage.  Implementing `BitmapData`, it includes functionality to generate perlin noise, animate per frame, as well as handle resize operations.

Perlin textures may be implemented via pure ActionScript such as:

    import labs.jasonsturges.perlin.texture.PerlinTexture;
    import labs.jasonsturges.perlin.texture.PerlinTextureStyles;

    var perlinTexture:PerlinTexture = new PerlinTexture(300, 300,
                                                        PerlinTextureStyles.AETHER());
    addChild(perlinTexture);

This would create a 300x300 animated perlin texture using the `AETHER` preset, added to the display list.

Presets are provided via the `PerlinTextureStyles` factory utility, which can be applied to a perlin texture instance via the `style` property, such as:

    perlinTexture.style = PerlinTextureStyles.LUMINOUS();

Styles may be referenced by name, using the `PerlinTextureStyles.from()` method, as in:

    perlinTexture.style = PerlinTextureStyles.from("LUMINOUS");

Styles may be set realtime on a perlin texture instance.  Below, styles are random applied to an instance:

    var styles:Vector.<String> = new <String>[
        "AETHER",
        "ATOMIC_CLOUD",
        "FOG",
        "LUMINOUS",
        "OIL"
    ];
    
    var perlinTexture:PerlinTexture = new PerlinTexture(300, 300);
    addChild(perlinTexture);
    
    var timer:Timer = new Timer(1000);
    timer.addEventListener(TimerEvent.TIMER, function ():void {
        perlinTexture.style = PerlinTextureStyles.from(styles[Math.floor(Math.random() * styles.length)]);
    });
    
    timer.start();
