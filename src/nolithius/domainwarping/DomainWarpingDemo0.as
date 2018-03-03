package nolithius.domainwarping
{
    import nolithius.domainwarping.maps.DomainWarpMap;
    import nolithius.domainwarping.maps.NoiseMap;
    import nolithius.domainwarping.ui.MapViewer;


    public class DomainWarpingDemo0 extends DomainWarpingDemo
    {
        public static const MAP_WIDTH_COVER:int = 960;
        public static const MAP_HEIGHT_COVER:int = 960;
        public static const SEED:int = 101;


        public function DomainWarpingDemo0 ()
        {
            var noiseMap:NoiseMap = new NoiseMap(MAP_WIDTH_COVER, MAP_HEIGHT_COVER, SEED, 8, 4, 4);

            var warpX:NoiseMap = new NoiseMap(MAP_WIDTH_COVER, MAP_HEIGHT_COVER, SEED * 2, 8, 2, 2);
            var warpY:NoiseMap = new NoiseMap(MAP_WIDTH_COVER, MAP_HEIGHT_COVER, SEED * 3, 8, 2, 2);
            var domainWarpMap:DomainWarpMap = new DomainWarpMap(noiseMap, warpX, warpY, MAP_HEIGHT_COVER);

            var warpViewer:MapViewer = new MapViewer(domainWarpMap, 1);
            addChild(warpViewer);
        }
    }
}
