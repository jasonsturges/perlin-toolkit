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
    //  model
    //------------------------------

    public var animation:Function;
    public var channelOptions:uint;
    public var fractalNoise:Boolean;
    public var grayScale:Boolean;
    public var octaves:uint;
    public var offsets:Array;
    public var seed:int;
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
