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
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Matrix;

public class PerlinTexture extends Sprite {

    //------------------------------
    //  model
    //------------------------------

    protected var bitmapData:BitmapData;
    protected var bitmap:Bitmap;
    protected var transparent:Boolean = true;
    protected var fillColor:uint = 0xff0000;
    protected var pixelSnapping:String = PixelSnapping.AUTO;
    protected var smoothing:Boolean = true;

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
    //------------------------------

    public function PerlinTexture(width:int = 300, height:int = 300, style:PerlinTextureStyle = null) {
        bitmapData = new BitmapData(width, height, transparent, fillColor);
        bitmap = new Bitmap(bitmapData, pixelSnapping, smoothing);
        addChild(bitmap);

        resize(width, height);

        if (style)
            this.style = style;

        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    protected function addedToStageHandler(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);

        addEventListener(Event.FRAME_CONSTRUCTED, frameConstructedHandler);
        addEventListener(Event.EXIT_FRAME, exitFrameHandler);
    }

    protected function frameConstructedHandler(event:Event):void {
        if (bitmapData) {
            bitmapData.lock();
            render();
        }
    }

    protected function render():void {
        if (animation != null)
            animation.call(this);

        perlinNoise(bitmap.width, bitmap.height, octaves, seed, stitch, fractalNoise, channelOptions, grayScale, offsets);
    }

    protected function exitFrameHandler(event:Event):void {
        if (bitmapData)
            bitmapData.unlock();
    }

    protected function removedFromStageHandler(event:Event):void {
        removeEventListener(Event.FRAME_CONSTRUCTED, frameConstructedHandler);
        removeEventListener(Event.EXIT_FRAME, exitFrameHandler);

        removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    public function set style(style:PerlinTextureStyle):void {
        fractalNoise = style.fractalNoise;
        octaves = style.octaves;
        seed = style.seed;
        stitch = style.stitch;
        channelOptions = style.channelOptions;
        grayScale = style.grayScale;
        offsets = style.offsets;
        animation = style.animation;
    }

    public function resize(width:Number, height:Number):void {
        width = Math.ceil(width);
        height = Math.ceil(height);

        if ((bitmapData) &&
                (bitmapData.width == width) &&
                (bitmapData.height == height))
            return;

        if ((width < 1) || (height < 1))
            return;

        var cachedBitmapData:BitmapData = bitmapData;

        bitmapData = null;
        bitmap.bitmapData = null;

        bitmapData = new BitmapData(width, height, transparent, fillColor);
        bitmap.bitmapData = bitmapData;
        bitmap.pixelSnapping = pixelSnapping;
        bitmap.smoothing = smoothing;

        if (!cachedBitmapData)
            return;

        var matrix:Matrix = new Matrix();
        matrix.scale(width / cachedBitmapData.width, height / cachedBitmapData.height);
        bitmapData.draw(cachedBitmapData, matrix);

        cachedBitmapData.dispose();
        cachedBitmapData = null;
    }

    public function perlinNoise(baseX:Number, baseY:Number, numOctaves:uint, randomSeed:int, stitch:Boolean, fractalNoise:Boolean, channelOptions:uint = 7, grayScale:Boolean = false, offsets:Array = null):void {
        bitmapData.perlinNoise(baseX, baseY, numOctaves, randomSeed, stitch, fractalNoise, channelOptions, grayScale, offsets);
    }

}
}
