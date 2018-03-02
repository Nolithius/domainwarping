package nolithius.domainwarping
{
    import nolithius.domainwarping.maps.DomainWarpMap;
    import nolithius.domainwarping.maps.NoiseMap;
    import nolithius.domainwarping.ui.MapViewer;


    public class DomainWarpingDemo2 extends DomainWarpingDemo
    {
        public function DomainWarpingDemo2 ()
        {
            var seed:int = 100;

            var noiseMap:NoiseMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, seed, 8, 4, 4);
            noiseMap.normalize();

            var baseViewer:MapViewer = new MapViewer(noiseMap, MAP_SCALE);
            baseViewer.x = MAP_SCALE;
            baseViewer.y = MAP_SCALE;
            addChild(baseViewer);

            var warpX:NoiseMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, seed * 2, 8, 2, 2);
            var warpY:NoiseMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, seed * 3, 8, 2, 2);

            var domainWarpMap:DomainWarpMap = new DomainWarpMap(noiseMap, warpX, warpY, MAP_HEIGHT);

            var warpViewer:MapViewer = new MapViewer(domainWarpMap, MAP_SCALE);
            warpViewer.x = (MAP_WIDTH + 3) * MAP_SCALE;
            warpViewer.y = MAP_SCALE;
            addChild(warpViewer);
        }
    }
}
