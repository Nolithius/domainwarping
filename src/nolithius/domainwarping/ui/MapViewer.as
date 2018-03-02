package nolithius.domainwarping.ui
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.geom.Rectangle;

    import nolithius.domainwarping.maps.Map;


    public class MapViewer extends Sprite
    {
        public var map:Map;
        public var scale:int;


        public function MapViewer (p_map:Map, p_scale:int)
        {
            map = p_map;
            scale = p_scale;
            _rect = new Rectangle(0, 0, p_scale, p_scale);

            draw();
        }


        public function draw ():void
        {
            if (!_bitmapData)
            {
                _bitmapData = new BitmapData(map.width * scale, map.height * scale, false, 0x000000);
                _bitmap = new Bitmap(_bitmapData);
                addChild(_bitmap);
            }

            for (var ix:uint = 0; ix < map.width; ix++)
            {
                for (var iy:uint = 0; iy < map.height; iy++)
                {
                    var elevation:int = map.tiles[ix][iy];

                    _rect.x = ix * scale;
                    _rect.y = iy * scale;

                    _bitmapData.fillRect(_rect, elevation << 16 | elevation << 8 | elevation);
                }
            }
        }


        protected var _rect:Rectangle;
        protected var _bitmapData:BitmapData;
        protected var _bitmap:Bitmap;
    }
}
