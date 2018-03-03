package nolithius.domainwarping.demos
{
    import flash.events.Event;

    import nolithius.domainwarping.maps.NoiseMap;
    import nolithius.domainwarping.ui.Input;
    import nolithius.domainwarping.viewers.ElevationViewer;


    /**
     * @author Ebyan "Nolithius" Alvarez-Buylla
     * http://www.nolithius.com
     */
    public class DomainWarpingDemo1 extends DomainWarpingDemo
    {
        public var seed:Input;
        public var octaves:Input;
        public var periodX:Input;
        public var periodY:Input;

        public var noiseMap:NoiseMap;
        public var noiseViewer:ElevationViewer;


        public function DomainWarpingDemo1 ()
        {
            seed = new Input("Base Seed", 1111, 0);
            seed.x = MAP_SCALE;
            seed.y = (MAP_HEIGHT + 2) * MAP_SCALE;
            addChild(seed);

            octaves = new Input("Base Octaves", 6, 1, 10);
            octaves.x = MAP_SCALE;
            octaves.y = seed.y + seed.height + Input.SPACING_Y;
            addChild(octaves);

            periodX = new Input("Base Period X", 4, 1, MAP_WIDTH);
            periodX.x = MAP_SCALE;
            periodX.y = octaves.y + octaves.height + Input.SPACING_Y;
            addChild(periodX);

            periodY = new Input("Base Period Y", 4, 1, MAP_WIDTH);
            periodY.x = MAP_SCALE;
            periodY.y = periodX.y + periodX.height + Input.SPACING_Y;
            addChild(periodY);

            noiseMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, seed.getValue(), octaves.getValue(), periodX.getValue(), periodY.getValue());

            noiseViewer = new ElevationViewer(noiseMap, MAP_SCALE);
            noiseViewer.x = MAP_SCALE;
            noiseViewer.y = MAP_SCALE;
            addChild(noiseViewer);

            seed.addEventListener(Event.CHANGE, handleInput);
            octaves.addEventListener(Event.CHANGE, handleInput);
            periodX.addEventListener(Event.CHANGE, handleInput);
            periodY.addEventListener(Event.CHANGE, handleInput);
        }


        public function handleInput (p_event:Event):void
        {
            noiseMap.seed = seed.getValue();
            noiseMap.octaves = octaves.getValue();
            noiseMap.periodX = periodX.getValue();
            noiseMap.periodY = periodY.getValue();

            noiseMap.update();
            noiseViewer.update();
        }
    }
}
