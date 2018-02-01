# Perlin Toolkit

Randomly generated background animations using perlin noise producing unique experiences each instance.

[Demo it in action here](http://labs.jasonsturges.com/flash/perlin-toolkit/).

![screen-capture](http://labs.jasonsturges.com/flash/perlin-toolkit/screenshot.png)

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

#### Using the Perlin Toolkit

Perlin textures may be implemented via pure ActionScript such as:

    import labs.jasonsturges.perlin.texture.PerlinTexture;
    import labs.jasonsturges.perlin.texture.PerlinTextureStyles;

    var perlinTexture:PerlinTexture = new PerlinTexture(300, 300,
                                                        PerlinTextureStyles.AETHER());
    addChild(perlinTexture);

This would create a 300x300 pixel animated perlin texture using the `AETHER` preset, added to the display list.

#### Using Presets

Presets are provided via the `PerlinTextureStyles` factory utility, which can be applied to a perlin texture instance via the `style` property, such as:

    perlinTexture.style = PerlinTextureStyles.LUMINOUS();

Styles may be referenced by name, using the `PerlinTextureStyles.from()` method, as in:

    perlinTexture.style = PerlinTextureStyles.from("LUMINOUS");

Styles may be set realtime on a perlin texture instance.  Below, styles are randomly applied to an instance:

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

## Best Practices

Perlin noise is computationally intensive, and should not be overused in an implementation.  Overuse will slow frame rate or even lock runtime.  Both size and perlin operations need consideration for best performance.

Limit octaves to 8 or lower.  Too many octaves will freeze the runtime.

For larger viewport bounds, it is recommended to scale a smaller instance.  For example, generate perlin noise at 300x300 pixels and then upscale to fill a region.  As perlin noise is abstract, it typically looks good at any scale.

The following example creates a perlin texture instance at 300x300, then resizes to fill the stage.  Resize the viewport window to review quality at different sizes.

    package {
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    
    import labs.jasonsturges.perlin.texture.PerlinTexture;
    import labs.jasonsturges.perlin.texture.PerlinTextureStyles;
    
    public class Example extends Sprite {
    
        protected var perlinTexture:PerlinTexture;
    
        public function Example() {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
    
            // Instantiate at 300x300 pixels:
            perlinTexture = new PerlinTexture(300, 300, PerlinTextureStyles.AETHER());
            addChild(perlinTexture);
    
            // Resize by scaling
            resize(stage.stageWidth, stage.stageHeight); // or dispatch a resize event
            stage.addEventListener(Event.RESIZE, resizeHandler);
        }
    
        protected function resize(width:Number, height:Number):void {
            perlinTexture.scaleX = width / 300;
            perlinTexture.scaleY = height / 300;
        }
    
        protected function resizeHandler(event:Event):void {
            resize(stage.stageWidth, stage.stageHeight);
        }
    
    }
    }


