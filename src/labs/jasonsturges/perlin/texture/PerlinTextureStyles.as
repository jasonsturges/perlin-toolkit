/*
     |      | _)  |    |   _)
     __ \   |  |  __|  __|  |  __ \    _` |
     |   |  |  |  |    |    |  |   |  (   |
    _.__/  _| _| \__| \__| _| _|  _| \__, |
                                     |___/
    Blitting, http://blitting.com
    Copyright (c) 2015 Jason Sturges, http://jasonsturges.com
*/
package labs.jasonsturges.perlin.texture {
import flash.geom.Point;
import flash.utils.getTimer;

/**
 * Factory of preset perlin texture styles.
 */
public class PerlinTextureStyles {

    //------------------------------
    //  static factory
    //------------------------------

    public static function from(name:String):PerlinTextureStyle {
        var style:PerlinTextureStyle;
        
        switch (name.toLowerCase()) {
            case "aether":
                style = PerlinTextureStyles.AETHER();
                break;
            case "ambient":
                style = PerlinTextureStyles.AMBIENT();
                break;
            case "arc":
                style = PerlinTextureStyles.ARC();
                break;
            case "atomic":
            case "atomic cloud":
            case "atomic_cloud":
                style = PerlinTextureStyles.ATOMIC_CLOUD();
                break;
            case "aurora":
                style = PerlinTextureStyles.AURORA();
                break;
            case "caustic":
                style = PerlinTextureStyles.CAUSTIC();
                break;
            case "fog":
                style = PerlinTextureStyles.FOG();
                break;
            case "fusion":
                style = PerlinTextureStyles.FUSION();
                break;
            case "gasoline":
                style = PerlinTextureStyles.GASOLINE();
                break;
            case "incandescent":
                style = PerlinTextureStyles.INCANDESCENT();
                break;
            case "ink":
                style = PerlinTextureStyles.INK();
                break;
            case "lace":
                style = PerlinTextureStyles.LACE();
                break;
            case "lava":
                style = PerlinTextureStyles.LAVA();
                break;
            case "luminous":
                style = PerlinTextureStyles.LUMINOUS();
                break;
            case "marble":
                style = PerlinTextureStyles.MARBLE();
                break;
            case "oil":
                style = PerlinTextureStyles.OIL();
                break;
            case "rotary":
                style = PerlinTextureStyles.ROTARY();
                break;
            case "sulfur":
                style = PerlinTextureStyles.SULFUR();
                break;
            case "throttle":
                style = PerlinTextureStyles.THROTTLE();
                break;
            case "vortex":
                style = PerlinTextureStyles.VORTEX();
                break;
        }

        return style;
    }


    //------------------------------
    //  static textures
    //------------------------------

    /** AMBIENT - Dusty still deep color tones */
    public static function AMBIENT(channelOptions:uint = 7, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                1,
                Math.random() * int.MAX_VALUE,
                true,
                true,
                channelOptions,
                grayScale,
                null,
                null
        );
    }

    /** LACE - Soft still of whites with a touch of color */
    public static function LACE(channelOptions:uint = 15, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                1,
                Math.random() * int.MAX_VALUE,
                true,
                true,
                channelOptions,
                grayScale,
                null,
                null
        );
    }

    /** MARBLE - Still stone pattern */
    public static function MARBLE(channelOptions:uint = 8, grayScale:Boolean = true):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                24,
                Math.random() * int.MAX_VALUE,
                false,
                false,
                channelOptions,
                grayScale,
                [],
                null
        );
    }

    /** SULFUR - Rusty still, very similar to gasoline texture */
    public static function SULFUR(channelOptions:uint = 3, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                24,
                Math.random() * int.MAX_VALUE,
                false,
                false,
                channelOptions,
                grayScale,
                [],
                null
        );
    }


    //------------------------------
    //  animated textures
    //------------------------------

    /** AETHER - Fluffy upward movement */
    public static function AETHER(channelOptions:uint = 15, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                2,
                Math.random() * int.MAX_VALUE,
                true,
                true,
                channelOptions,
                grayScale,
                [new Point(), new Point()],
                function ():void {
                    for (var i:uint = 0; i < this.offsets.length; i++) {
                        this.offsets[i].x = 0;
                        this.offsets[i].y += Math.random() * 10;
                    }
                }
        );
    }

    /** ARC - High voltage electric arcs */
    public static function ARC(channelOptions:uint = 9, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                1,
                Math.random() * int.MAX_VALUE,
                false,
                false,
                channelOptions,
                grayScale,
                [new Point()],
                function ():void {
                    for (var i:uint = 0; i < this.offsets.length; i++) {
                        this.offsets[i].x = Math.random() * 500;
                        this.offsets[i].y = Math.random() * 500;
                    }
                }
        );
    }

    /** ATOMIC_CLOUD - Plumes of smokey mushroom clouds */
    public static function ATOMIC_CLOUD(channelOptions:uint = 1, grayScale:Boolean = true):PerlinTextureStyle {
        return new PerlinTextureStyle(
                8,
                Math.random() * int.MAX_VALUE,
                false,
                false,
                channelOptions,
                grayScale,
                [new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point()],
                function ():void {
                    for (var i:uint = 0; i < this.offsets.length; i++) {
                        this.offsets[i].x = Math.random() > 0.5 ? -1 : 1;
                        this.offsets[i].y += Math.random() * (10 / (i + 1));
                    }
                }
        );
    }

    /** AURORA - Gentle sweeping dancing lights */
    public static function AURORA(channelOptions:uint = 7, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                4,
                Math.random() * int.MAX_VALUE,
                false,
                true,
                channelOptions,
                grayScale,
                [new Point(0.7, -0.7), new Point(0.9, -0.9), new Point(17, -1), new Point(1.3, -2.7)],
                function ():void {
                    this.offsets[0].x += 5;
                    this.offsets[0].y -= 5;
                    this.offsets[1].x += 0.9;
                    this.offsets[1].y -= 0.9;
                    this.offsets[2].x += 4;
                    this.offsets[2].y -= 5;
                    this.offsets[3].x += 9;
                    this.offsets[3].y -= 3;
                }
        );
    }

    /** CAUSTIC - Underwater patterns */
    public static function CAUSTIC(channelOptions:uint = 12, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                8,
                Math.random() * int.MAX_VALUE,
                false,
                false,
                channelOptions,
                grayScale,
                [new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point()],
                function ():void {
                    this.offsets[0].x += 8;
                    this.offsets[0].y += 8;
                    this.offsets[1].x -= 7;
                    this.offsets[1].y -= 7;
                    this.offsets[2].x += 6;
                    this.offsets[2].y -= 6;
                    this.offsets[3].x -= 5;
                    this.offsets[3].y += 5;
                    this.offsets[4].x += 4;
                    this.offsets[4].y -= 4;
                    this.offsets[5].x -= 3;
                    this.offsets[5].y += 3;
                    this.offsets[6].x += 2;
                    this.offsets[6].y -= 2;
                    this.offsets[7].x -= 1;
                    this.offsets[7].y += 1;
                }
        );
    }

    /** FOG - Dense white mist */
    public static function FOG(channelOptions:uint = 1, grayScale:Boolean = true):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                6,
                Math.random() * int.MAX_VALUE,
                false,
                true,
                channelOptions,
                grayScale,
                [new Point(0.7, -0.7), new Point(0.9, -0.9), new Point(17, -1), new Point(1.3, -2.7), new Point(28, -9), new Point(3.7, -20.1)],
                function ():void {
                    this.offsets[0].x += 1; //5;
                    this.offsets[0].y -= 1; //5;
                    this.offsets[1].x += 2; //0.9;
                    this.offsets[1].y -= 2; //0.9;
                    this.offsets[2].x += 3; //4;
                    this.offsets[2].y -= 3; //5;
                    this.offsets[3].x += 4; //9;
                    this.offsets[3].y -= 4; //3;

                    this.offsets[4].x += 2;
                    this.offsets[4].y -= 2;
                    this.offsets[5].x += 2;
                    this.offsets[5].y -= 2;
                }
        );
    }

    /** FUSION - Fast bursts of bright light */
    public static function FUSION(channelOptions:uint = 15, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                4,
                Math.random() * int.MAX_VALUE,
                true,
                true,
                channelOptions,
                grayScale,
                null,
                function ():void {
                    this.seed++;
                }
        );
    }

    /** GASOLINE - Rusty detailed smog */
    public static function GASOLINE(channelOptions:uint = 3, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                12,
                Math.random() * int.MAX_VALUE,
                false,
                false,
                channelOptions,
                grayScale,
                [new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point()],
                function ():void {
                    this.offsets[0].x -= 0.1;
                    this.offsets[0].y -= 2.1;
                    this.offsets[1].x -= 0.2;
                    this.offsets[1].y -= 0.2;
                    this.offsets[2].x += 5.3;
                    this.offsets[2].y -= 0.3;
                    this.offsets[3].x -= 0.4;
                    this.offsets[3].y -= 0.4;
                    this.offsets[4].x += 0.5;
                    this.offsets[4].y -= 2.5;
                    this.offsets[5].x -= 0.6;
                    this.offsets[5].y -= 0.6;
                    this.offsets[6].x += 0.7;
                    this.offsets[6].y += 8.7;
                    this.offsets[7].x -= 0.8;
                    this.offsets[7].y -= 0.8;
                    this.offsets[8].x -= 2.9;
                    this.offsets[8].y -= 0.9;
                    this.offsets[9].x += 1.0;
                    this.offsets[9].y -= 3.0;
                    this.offsets[10].x -= 1.1;
                    this.offsets[10].y += 3.1;
                    this.offsets[11].x -= 1.2;
                    this.offsets[11].y -= 2.2;
                }
        );
    }

    /** INCANDESCENT - Soft light lit by white hot wire */
    public static function INCANDESCENT(channelOptions:uint = 9, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                1,
                Math.random() * int.MAX_VALUE,
                false,
                false,
                channelOptions,
                grayScale,
                [new Point()],
                function ():void {
                    for (var i:uint = 0; i < this.offsets.length; i++) {
                        this.offsets[i].x = Math.cos(getTimer() / 60) + Math.random() * 4;
                        this.offsets[i].y = Math.sin(getTimer() / 60) + Math.random() * 4;
                    }
                }
        );
    }

    /** INK - Blotchy puddles spilling */
    public static function INK(channelOptions:uint = 1, grayScale:Boolean = true):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                2,
                Math.random() * int.MAX_VALUE,
                false,
                false,
                channelOptions,
                grayScale,
                [new Point(), new Point()],
                function ():void {
                    for (var i:uint = 0; i < this.offsets.length; i++) {
                        this.offsets[i].x = Math.random() > 0.5 ? -1 : 1;
                        this.offsets[i].y += Math.random() * (10 / (i + 1));
                    }
                }
        );
    }

    /** LAVA - Pools of red magma flowing */
    public static function LAVA(channelOptions:uint = 1, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                2,
                Math.random() * int.MAX_VALUE,
                false,
                true,
                channelOptions,
                grayScale,
                [new Point(0.7, -0.7), new Point(0.9, -0.9)],
                function ():void {
                    this.offsets[0].x += 5;
                    this.offsets[0].y -= 5;
                    this.offsets[1].x += 1;
                    this.offsets[1].y -= 1;
                }
        );
    }

    /** LUMINOUS - Magical poofs of clouds */
    public static function LUMINOUS(channelOptions:uint = 15, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                4,
                Math.random() * int.MAX_VALUE,
                false,
                true,
                channelOptions,
                grayScale,
                [new Point(0.7, -0.7), new Point(0.9, -0.9), new Point(17, -1), new Point(1.3, -2.7)],
                function ():void {
                    this.offsets[0].x += 5;
                    this.offsets[0].y -= 5;
                    this.offsets[1].x += 0.9;
                    this.offsets[1].y -= 0.9;
                    this.offsets[2].x += 4;
                    this.offsets[2].y -= 5;
                    this.offsets[3].x += 9;
                    this.offsets[3].y -= 3;
                }
        );
    }

    /** OIL - Slicks of rich color floating on the surface of water */
    public static function OIL(channelOptions:uint = 7, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                3,
                Math.random() * int.MAX_VALUE,
                false,
                false,
                channelOptions,
                grayScale,
                [new Point(), new Point(), new Point()],
                function ():void {
                    this.offsets[0].y += 4;
                    this.offsets[1].y += 2;
                    this.offsets[2].y += 1;
                }
        );
    }

    /** ROTARY - Dark circular movement */
    public static function ROTARY(channelOptions:uint = 1, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                1,
                Math.random() * int.MAX_VALUE,
                true,
                false,
                channelOptions,
                grayScale,
                [new Point()],
                function ():void {
                    this.seed = Math.random() * 5000;
                }
        );
    }

    /** THROTTLE - High speed blur passing by */
    public static function THROTTLE(channelOptions:uint = 6, grayScale:Boolean = false):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                2,
                Math.random() * int.MAX_VALUE,
                true,
                true,
                channelOptions,
                grayScale,
                [new Point(0.7, -0.7), new Point(0.9, -0.9)],
                function ():void {
                    this.offsets[0].x += 50;
                    this.offsets[0].y -= 50;
                    this.offsets[1].x += 11;
                    this.offsets[1].y -= 11;
                }
        );
    }

    /** VORTEX - Rapid intense movement, similar to fusion texture */
    public static function VORTEX(channelOptions:uint = 8, grayScale:Boolean = true):PerlinTextureStyle {
        return new PerlinTextureStyle
        (
                8,
                Math.random() * int.MAX_VALUE,
                true,
                true,
                channelOptions,
                grayScale,
                [new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point(), new Point()],
                function ():void {
                    this.seed = Math.random() * 5000;
                }
        );
    }

}
}
