package nolithius.domainwarping.maps
{
    public class Map
    {
        public static const ELEVATION_MAX:int = 255;


        public var width:int;
        public var height:int;
        public var tiles:Array;


        public function Map (p_width:int, p_height:int)
        {
            width = p_width;
            height = p_height;

            init();
        }


        protected function init ():void
        {
            tiles = new Array(width);
            for (var ix:uint = 0; ix < width; ix++)
            {
                tiles[ix] = new Array(height);

                for (var iy:uint = 0; iy < height; iy++)
                {
                    tiles[ix][iy] = 0;
                }
            }
        }


        public function normalize ():void
        {
            var smallest:uint = uint.MAX_VALUE;
            var largest:uint = 0;

            // Find the largest and smallest tiles
            for (var ix:uint = 0; ix < width; ix++)
            {
                for (var iy:uint = 0; iy < height; iy++)
                {
                    var elevation:int = tiles[ix][iy];

                    if (elevation > largest)
                    {
                        largest = elevation;
                    }
                    if (elevation < smallest)
                    {
                        smallest = elevation;
                    }
                }
            }

            // Normalize
            for (ix = 0; ix < width; ix++)
            {
                for (iy = 0; iy < height; iy++)
                {
                    var percent:Number = (tiles[ix][iy] - smallest) / (largest-smallest);
                    tiles[ix][iy] = Math.round(percent * ELEVATION_MAX);
                }
            }
        }


        public function getElevationByPercent (p_percent:Number):int
        {
            // Sample for accurate land-earth balance
            var sample:Array = [];
            for (var ix:uint = 0; ix < width; ix++)
            {
                for (var iy:uint = 0; iy < height; iy++)
                {
                    sample.push(tiles[ix][iy]);
                }
            }

            sample.sort(Array.NUMERIC);

            return sample[int(sample.length * p_percent)];
        }
    }
}