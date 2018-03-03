package nolithius.domainwarping.maps
{
    /**
     * @author Ebyan "Nolithius" Alvarez-Buylla
     * http://www.nolithius.com
     */
    public class CircleGradientMap extends Map
    {
        public var outerRadius:int;
        public var innerRadius:int;


        public function CircleGradientMap (p_width:int, p_height:int, p_outerRadius:int, p_innerRadius:int = 0)
        {
            super(p_width, p_height);

            outerRadius = p_outerRadius;
            innerRadius = p_innerRadius;

            // Ensure that inner radius is <= outer radius
            if (innerRadius > outerRadius)
            {
                innerRadius = outerRadius;
            }

            update();
        }


        public override function update ():void
        {
            var outerRadiusSq:int = outerRadius * outerRadius;
            var innerRadiusSq:int = innerRadius * innerRadius;
            var dRadiiSq:Number = outerRadiusSq - innerRadiusSq;
            var centerX:int = width / 2;
            var centerY:int = height / 2;

            for (var ix:uint = 0; ix < width; ix++)
            {
                for (var iy:uint = 0; iy < height; iy++)
                {
                    var dx:int = ix - centerX;
                    var dy:int = iy - centerY;

                    var distanceSq:int = dx * dx + dy * dy;

                    if (distanceSq <= outerRadiusSq)
                    {
                        // Anything below the spread is 100%, also if the spread is the same as the radius, to avoid
                        // dividing by 0 in the else case below.
                        if (distanceSq <= innerRadiusSq || dRadiiSq == 0)
                        {
                            tiles[ix][iy] = ELEVATION_MAX;
                        }
                        else
                        {
                            var percent:Number = 1 - ((distanceSq - innerRadiusSq) / dRadiiSq);
                            tiles[ix][iy] = Math.round(ELEVATION_MAX * percent);
                        }
                    }
                    else
                    {
                        tiles[ix][iy] = 0;
                    }
                }
            }
        }
    }
}
