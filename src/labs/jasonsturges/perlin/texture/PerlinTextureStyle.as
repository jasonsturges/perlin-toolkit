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

/**
 * Composite structure of presentation model
 * for PerlinTexture.
 */
public class PerlinTextureStyle {

    //------------------------------
    //  presentation
    //------------------------------

    /** animate function */
    public var animation:Function;

    /** channel options */
    public var channelOptions:uint;

    /** fractal noise */
    public var fractalNoise:Boolean;

    /** gray scale */
    public var grayScale:Boolean;

    /** octaves */
    public var octaves:uint;

    /** offsets */
    public var offsets:Array;

    /** seed */
    public var seed:int;

    /** stitch */
    public var stitch:Boolean;


    //------------------------------
    //  lifecycle
    //------------------------------'

    /** constructor */
    public function PerlinTextureStyle(octaves:uint,
                                       seed:int,
                                       stitch:Boolean,
                                       fractalNoise:Boolean,
                                       channelOptions:uint,
                                       grayScale:Boolean,
                                       offsets:Array,
                                       animation:Function) {
        this.octaves = octaves;
        this.seed = seed;
        this.stitch = stitch;
        this.fractalNoise = fractalNoise;
        this.channelOptions = channelOptions;
        this.grayScale = grayScale;
        this.offsets = offsets;
        this.animation = animation;
    }

}
}