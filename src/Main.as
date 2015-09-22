/*
     |      | _)  |    |   _)
     __ \   |  |  __|  __|  |  __ \    _` |
     |   |  |  |  |    |    |  |   |  (   |
    _.__/  _| _| \__| \__| _| _|  _| \__, |
                                     |___/
    Blitting, http://blitting.com
    Copyright (c) 2015 Jason Sturges, http://jasonsturges.com
*/
package {

import fl.controls.ComboBox;

import flash.display.Sprite;
import flash.events.Event;

import labs.jasonsturges.perlin.texture.PerlinTexture;
import labs.jasonsturges.perlin.texture.PerlinTextureStyles;

public class Main extends Sprite {

    //------------------------------
    //  model
    //------------------------------

    public var perlinTexture:PerlinTexture;
    public var textureComboBox:ComboBox;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function Main() {
        perlinTexture = new PerlinTexture(590, 300);
        perlinTexture.style = PerlinTextureStyles.AETHER();

        addChildAt(perlinTexture, 0);

        textureComboBox.addEventListener(Event.CHANGE, changeHandler);
    }

    protected function changeHandler(event:Event):void {
        perlinTexture.style = PerlinTextureStyles.from(textureComboBox.selectedItem.data);
    }

}
}
