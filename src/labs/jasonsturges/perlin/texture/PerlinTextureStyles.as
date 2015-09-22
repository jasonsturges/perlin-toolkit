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
 * Factory of preset perline texture styles
 * provided as a convenience.
 */
public class PerlinTextureStyles {

    //------------------------------
    //  static factory
    //------------------------------

    public static function from(name:String):PerlinTextureStyle {
        switch (name) {
            case "Aether":
                return PerlinTextureStyles.AETHER();
                break;
            case "Ambient":
                return PerlinTextureStyles.AMBIENT();
                break;
            case "Arc":
                return PerlinTextureStyles.ARC();
                break;
            case "Atomic Cloud":
                return PerlinTextureStyles.ATOMIC_CLOUD();
                break;
            case "Aurora":
                return PerlinTextureStyles.AURORA();
                break;
            case "Caustic":
                return PerlinTextureStyles.CAUSTIC();
                break;
            case "Fog":
                return PerlinTextureStyles.FOG();
                break;
            case "Fusion":
                return PerlinTextureStyles.FUSION();
                break;
            case "Gasoline":
                return PerlinTextureStyles.GASOLINE();
                break;
            case "Incandescent":
                return PerlinTextureStyles.INCANDESCENT();
                break;
            case "Ink":
                return PerlinTextureStyles.INK();
                break;
            case "Lace":
                return PerlinTextureStyles.LACE();
                break;
            case "Lava":
                return PerlinTextureStyles.LAVA();
                break;
            case "Luminous":
                return PerlinTextureStyles.LUMINOUS();
                break;
            case "Marble":
                return PerlinTextureStyles.MARBLE();
                break;
            case "Oil":
                return PerlinTextureStyles.OIL();
                break;
            case "Rotary":
                return PerlinTextureStyles.ROTARY();
                break;
            case "Sulfur":
                return PerlinTextureStyles.SULFUR();
                break;
            case "Throttle":
                return PerlinTextureStyles.THROTTLE();
                break;
            case "Vortex":
                return PerlinTextureStyles.VORTEX();
                break;
        }

        return null;
    }

    //------------------------------
    //  static textures
    //------------------------------

    /** AMBIENT */
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

    /** LACE */
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

    /** MARBLE */
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

    /** SULFUR */
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

    /** AETHER */
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

    /** ARC */
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

    /** ATOMIC_CLOUD */
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

    /** AURORA */
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

    /** CAUSTIC */
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

    /** FOG */
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

    /** FUSION */
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

    /** GASOLINE */
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

    /** INCANDESCENT */
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

    /** INK */
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

    /** LAVA */
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

    /** LUMINOUS */
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

    /** OIL */
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

    /** ROTARY */
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

    /** THROTTLE */
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

    /** VORTEX */
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
