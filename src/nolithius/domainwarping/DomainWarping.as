package nolithius.domainwarping
{
    import flash.display.Sprite;


    [SWF(frameRate="60", width="960", height="580", backgroundColor="#e4e4e4")]
    public class DomainWarping extends Sprite
    {
        public function DomainWarping ()
        {
            addChild(new DomainWarpingDemo2());
        }
    }
}
