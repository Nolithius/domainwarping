package nolithius.domainwarping.maps
{
    /**
     * Multiply two maps together
     * @author Ebyan "Nolithius" Alvarez-Buylla
     * http://www.nolithius.com
     */
    public class MultiplyMap extends Map
    {
        public var map1:Map;
        public var map2:Map;


        public function MultiplyMap (p_map1:Map, p_map2:Map)
        {
            super(p_map1.width, p_map1.height);

            map1 = p_map1;
            map2 = p_map2;

            update();
        }


        public override function update ():void
        {
            for (var ix:uint = 0; ix < width; ix++)
            {
                for (var iy:uint = 0; iy < height; iy++)
                {
                    tiles[ix][iy] = multiply(map1.tiles[ix][iy], map2.tiles[ix][iy]);
                }
            }

            normalize();
        }

        protected function multiply (p_value1:int, p_value2:int):int
        {
            return Math.round(p_value1 * p_value2 / 255.0);
        }
    }
}
