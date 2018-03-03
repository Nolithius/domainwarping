package nolithius.domainwarping.viewers
{
    import nolithius.domainwarping.maps.Map;


    /**
     * @author Ebyan "Nolithius" Alvarez-Buylla
     * http://www.nolithius.com
     */
    public class TerrainViewer extends Viewer
    {
        public static const COLOR_DEEP_WATER:int = 0x005ca9;
        public static const COLOR_SHALLOW_WATER:int = 0x268cd4;
        public static const COLOR_SHORE:int = 0xFFCCAA;
        public static const COLOR_LIGHT_FOREST:int = 0x5faa5b;
        public static const COLOR_DEEP_FOREST:int = 0x008751;
        public static const COLOR_MOUNTAINS:int = 0x99a691;
        public static const COLOR_PEAKS:int = 0xFFFFFF;


        public var waterLine:int;


        public function TerrainViewer (p_map:Map, p_scale:int, p_waterLine:int)
        {
            waterLine = p_waterLine;

            super(p_map, p_scale);
        }


        public override function update ():void
        {
            super.update();

            var waterlineElevation:int = map.getElevationByPercent(waterLine / 100.0);
            var landElevation:int = Map.ELEVATION_MAX - waterlineElevation;

            for (var ix:uint = 0; ix < map.width; ix++)
            {
                for (var iy:uint = 0; iy < map.height; iy++)
                {
                    var elevation:int = map.tiles[ix][iy];

                    _rect.x = ix * scale;
                    _rect.y = iy * scale;

                    var color:int;

                    if (elevation <= waterlineElevation)
                    {
                        // Deep water
                        if (elevation <= waterlineElevation * 0.7)
                        {
                            color = COLOR_DEEP_WATER;
                        }
                        // Shallow water
                        else
                        {
                            color = COLOR_SHALLOW_WATER;
                        }
                    }
                    else
                    {
                        if (elevation < waterlineElevation + landElevation * 0.10)
                        {
                            color = COLOR_SHORE;
                        }
                        else if (elevation < waterlineElevation + landElevation * 0.25)
                        {
                            color = COLOR_LIGHT_FOREST;
                        }
                        else if (elevation >= waterlineElevation + landElevation * 0.9)
                        {
                            color = COLOR_PEAKS;
                        }
                        else if (elevation >= waterlineElevation + landElevation * 0.7)
                        {
                            color = COLOR_MOUNTAINS;
                        }
                        else
                        {
                            color = COLOR_DEEP_FOREST;
                        }
                    }

                    _bitmapData.fillRect(_rect, color);
                }
            }
        }
    }
}
