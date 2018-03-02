package nolithius.domainwarping.maps
{
    import flash.display.BitmapData;


    public class NoiseMap extends Map
    {
        public function NoiseMap (p_width:int, p_height:int, p_seed:int = 0, p_octaves:int = 8, p_periodX:Number = 2, p_periodY:Number = 2)
        {
            super(p_width, p_height);

            var seed:int = p_seed;
            if (seed == 0)
            {
                seed = int(Math.random() * (int.MAX_VALUE - 1)) + 1;
            }

            var bitmapData:BitmapData = new BitmapData(width, height, false, 0);
            bitmapData.perlinNoise(width/p_periodX, height/p_periodY, p_octaves, seed, true, true, 7, true);

            var pixels:Vector.<uint> = bitmapData.getVector(bitmapData.rect);
            var pixelsLength:uint = pixels.length;

            for (var i:uint = 0; i < pixelsLength; i++)
            {
                var ix:uint = i % width;
                var iy:uint = uint(i / width);

                // Set the elevation to the blue value of this noise (grayscale)
                tiles[ix][iy] = pixels[i] & 0x0000FF;
            }
        }
    }
}