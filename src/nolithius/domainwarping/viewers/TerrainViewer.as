package nolithius.domainwarping.viewers
{
    import nolithius.domainwarping.maps.Map;


    public class TerrainViewer extends Viewer
    {
        public var waterLine:int;


        public function TerrainViewer (p_map:Map, p_scale:int, p_waterLine:int)
        {
            waterLine = p_waterLine;

            super(p_map, p_scale);
        }


        public override function update ():void
        {
            super.update();

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
    }
}
