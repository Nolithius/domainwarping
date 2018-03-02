package nolithius.domainwarping.maps
{
    /**
     * Domain Warp Map
     * @author Ebyan "Nolithius" Alvarez-Buylla
     * http://www.nolithius.com
     */
    public class DomainWarpMap extends Map
    {
        /**
         * Creates a Domain Warp/Noise Distortion map based on the basemap, distorting the x and y values with their corresponding maps, with a strength defined by the amplitude.
         * @param    p_baseMap      The base map to distort.
         * @param    p_warpX        The values, in (0, 255), to distort the map on the x, which will be mapped to (-1, 1).
         * @param    p_warpY        The values, in (0,255), to distort the map on the y, which will be mapped to (-1, 1).
         * @param    p_amplitude    How many tiles should a value of 1 (or -1) reach towards.
         */
        public function DomainWarpMap (p_baseMap:Map, p_warpX:Map, p_warpY:Map, p_amplitude:Number)
        {
            super(p_baseMap.width, p_baseMap.height);

            for (var ix:int = 0; ix < p_baseMap.width; ix++)
            {
                for (var iy:int = 0; iy < p_baseMap.height; iy++)
                {
                    // Map distortion from (0, 255) to (-1, 1)
                    var distortionVectorX:Number = p_warpX.tiles[ix][iy] / 255.0 * 2 - 1;
                    var distortionVectorY:Number = p_warpY.tiles[ix][iy] / 255.0 * 2 - 1;

                    // Calculate sourceX and sourceY by addind the offset, rounding, and ensuring we loop around
                    var sourceX:int = Math.round(ix + distortionVectorX * p_amplitude);
                    var sourceY:int = Math.round(iy + distortionVectorY * p_amplitude);

                    // Some fancy math to handle wrapping around an arbitrary amount of times on the negative
                    if (sourceX < 0)
                    {
                        sourceX += Math.ceil(Math.abs(sourceX) / p_baseMap.width) * p_baseMap.width;
                    }

                    sourceX = sourceX % p_baseMap.width;

                    if (sourceY < 0)
                    {
                        sourceY += Math.ceil(Math.abs(sourceY) / p_baseMap.height) * p_baseMap.height;
                    }

                    sourceY = sourceY % p_baseMap.height;

                    // Grab the modified index from the base map, and set on the resulting map
                    tiles[ix][iy] = p_baseMap.tiles[sourceX][sourceY];
                }
            }
        }
    }
}
