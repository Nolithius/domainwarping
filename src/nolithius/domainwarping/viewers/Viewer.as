package nolithius.domainwarping.viewers
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Rectangle;

    import nolithius.domainwarping.maps.Map;


    /**
     * @author Ebyan "Nolithius" Alvarez-Buylla
     * http://www.nolithius.com
     */
    public class Viewer extends Sprite
    {
        public var map:Map;
        public var scale:int;


        public function Viewer (p_map:Map, p_scale:int)
        {
            map = p_map;
            scale = p_scale;
            _rect = new Rectangle(0, 0, p_scale, p_scale);

            update();
        }


        public function update ():void
        {
            if (!_bitmapData)
            {
                _bitmapData = new BitmapData(map.width * scale, map.height * scale, false, 0x000000);
                _bitmap = new Bitmap(_bitmapData);
                addChild(_bitmap);
            }
        }


        protected var _rect:Rectangle;
        protected var _bitmapData:BitmapData;
        protected var _bitmap:Bitmap;
    }
}
