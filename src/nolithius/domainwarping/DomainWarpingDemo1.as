package nolithius.domainwarping
{
    import nolithius.domainwarping.maps.NoiseMap;
    import nolithius.domainwarping.ui.BaseUI;
    import nolithius.domainwarping.ui.MapViewer;


    public class DomainWarpingDemo1 extends DomainWarpingDemo
    {
        public function DomainWarpingDemo1 ()
        {
            trace("Hello world");

            var baseUI:BaseUI = new BaseUI();
            baseUI.x = MAP_SCALE;
            baseUI.y = (MAP_HEIGHT + 2) * MAP_SCALE;
            addChild(baseUI);

            var noiseMap:NoiseMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, parseInt(baseUI.seed.text), 6, 4, 4);
            noiseMap.normalize();

            var baseViewer:MapViewer = new MapViewer(noiseMap, MAP_SCALE);
            baseViewer.x = MAP_SCALE;
            baseViewer.y = MAP_SCALE;
            addChild(baseViewer);


        }
    }
}
