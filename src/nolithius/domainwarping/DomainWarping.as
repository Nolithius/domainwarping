package nolithius.domainwarping
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;


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
            addChild(new DomainWarpingDemo2());
        }
    }
}
