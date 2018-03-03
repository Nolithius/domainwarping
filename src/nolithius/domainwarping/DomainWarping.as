package nolithius.domainwarping
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import nolithius.domainwarping.demos.*;


    /**
     * Main document class for Domain Warping Demo.
     * @author Ebyan "Nolithius" Alvarez-Buylla
     * http://www.nolithius.com
     */
    [SWF(frameRate="60", width="960", height="580", backgroundColor="#e4e4e4")]
    public class DomainWarping extends Sprite
    {
        public function DomainWarping ()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            // The article's cover image
//            addChild(new DomainWarpingDemo0());

            // A vanilla Perlin noise single viewer
//            addChild(new DomainWarpingDemo1());

            // Noise distortion domain warping
//            addChild(new DomainWarpingDemo2());

            // Water line and coloration
            addChild(new DomainWarpingDemo3());
        }
    }
}
