package nolithius.domainwarping.demos
{
    import flash.events.Event;

    import nolithius.domainwarping.maps.DomainWarpMap;
    import nolithius.domainwarping.maps.NoiseMap;
    import nolithius.domainwarping.ui.Input;
    import nolithius.domainwarping.viewers.ElevationViewer;


    /**
     * @author Ebyan "Nolithius" Alvarez-Buylla
     * http://www.nolithius.com
     */
    public class DomainWarpingDemo2 extends DomainWarpingDemo
    {
        public var baseSeed:Input;
        public var baseOctaves:Input;
        public var basePeriodX:Input;
        public var basePeriodY:Input;
        public var warpXSeed:Input;
        public var warpXOctaves:Input;
        public var warpXPeriodX:Input;
        public var warpXPeriodY:Input;
        public var warpYSeed:Input;
        public var warpYOctaves:Input;
        public var warpYPeriodX:Input;
        public var warpYPeriodY:Input;
        public var amplitude:Input;

        public var noiseMap:NoiseMap;
        public var warpXMap:NoiseMap;
        public var warpYMap:NoiseMap;
        public var domainWarpMap:DomainWarpMap;

        public var noiseViewer:ElevationViewer;
        public var domainWarpViewer:ElevationViewer;


        public function DomainWarpingDemo2 ()
        {
            baseSeed = new Input("Base Seed", 1111, 0);
            baseSeed.x = 3;
            baseSeed.y = (MAP_HEIGHT + 2) * MAP_SCALE;
            addChild(baseSeed);

            baseOctaves = new Input("Base Octaves", 8, 1, 10);
            baseOctaves.x = baseSeed.x;
            baseOctaves.y = baseSeed.y + baseSeed.height + Input.SPACING_Y;
            addChild(baseOctaves);

            basePeriodX = new Input("Base Period X", 4, 1, 10);
            basePeriodX.x = baseSeed.x;
            basePeriodX.y = baseOctaves.y + baseOctaves.height + Input.SPACING_Y;
            addChild(basePeriodX);

            basePeriodY = new Input("Base Period Y", 4, 1, 10);
            basePeriodY.x = baseSeed.x;
            basePeriodY.y = basePeriodX.y + basePeriodX.height + Input.SPACING_Y;
            addChild(basePeriodY);

            warpXSeed = new Input("Warp X Seed", 2222, 0);
            warpXSeed.x = baseSeed.x + baseSeed.width + Input.SPACING_X;
            warpXSeed.y = baseSeed.y;
            addChild(warpXSeed);

            warpXOctaves = new Input("Warp X Octaves", 8, 1, 10);
            warpXOctaves.x = warpXSeed.x;
            warpXOctaves.y = warpXSeed.y + warpXSeed.height + Input.SPACING_Y;
            addChild(warpXOctaves);

            warpXPeriodX = new Input("Warp X Period X", 2, 1, 10);
            warpXPeriodX.x = warpXSeed.x;
            warpXPeriodX.y = warpXOctaves.y + warpXOctaves.height + Input.SPACING_Y;
            addChild(warpXPeriodX);

            warpXPeriodY = new Input("Warp X Period Y", 2, 1, 10);
            warpXPeriodY.x = warpXSeed.x;
            warpXPeriodY.y = warpXPeriodX.y + warpXPeriodX.height + Input.SPACING_Y;
            addChild(warpXPeriodY);

            warpYSeed = new Input("Warp Y Seed", 3333, 0);
            warpYSeed.x = warpXSeed.x + warpXSeed.width + Input.SPACING_X;
            warpYSeed.y = warpXSeed.y;
            addChild(warpYSeed);

            warpYOctaves = new Input("Warp Y Octaves", 8, 1, 10);
            warpYOctaves.x = warpYSeed.x;
            warpYOctaves.y = warpYSeed.y + warpYSeed.height + Input.SPACING_Y;
            addChild(warpYOctaves);

            warpYPeriodX = new Input("Warp Y Period X", 2, 1, 10);
            warpYPeriodX.x = warpYSeed.x;
            warpYPeriodX.y = warpYOctaves.y + warpYOctaves.height + Input.SPACING_Y;
            addChild(warpYPeriodX);

            warpYPeriodY = new Input("Warp Y Period Y", 2, 1, 10);
            warpYPeriodY.x = warpYSeed.x;
            warpYPeriodY.y = warpYPeriodX.y + warpYPeriodX.height + Input.SPACING_Y;
            addChild(warpYPeriodY);

            amplitude = new Input("Amplitude", 20, 1, 200);
            amplitude.x = warpYSeed.x + warpYSeed.width + Input.SPACING_X;
            amplitude.y = warpYSeed.y;
            addChild(amplitude);

            noiseMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, baseSeed.getValue(), baseOctaves.getValue(), basePeriodX.getValue(), basePeriodY.getValue());

            noiseViewer = new ElevationViewer(noiseMap, MAP_SCALE);
            noiseViewer.x = MAP_SCALE;
            noiseViewer.y = MAP_SCALE;
            addChild(noiseViewer);

            warpXMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, warpXSeed.getValue(), warpXOctaves.getValue(), warpXPeriodX.getValue(), warpXPeriodY.getValue());
            warpYMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, warpYSeed.getValue(), warpYOctaves.getValue(), warpYPeriodX.getValue(), warpYPeriodY.getValue());
            domainWarpMap = new DomainWarpMap(noiseMap, warpXMap, warpYMap, amplitude.getValue());

            domainWarpViewer = new ElevationViewer(domainWarpMap, MAP_SCALE);
            domainWarpViewer.x = (MAP_WIDTH + 3) * MAP_SCALE;
            domainWarpViewer.y = MAP_SCALE;
            addChild(domainWarpViewer);

            baseSeed.addEventListener(Event.CHANGE, handleInput);
            baseOctaves.addEventListener(Event.CHANGE, handleInput);
            basePeriodX.addEventListener(Event.CHANGE, handleInput);
            basePeriodY.addEventListener(Event.CHANGE, handleInput);
            warpXSeed.addEventListener(Event.CHANGE, handleInput);
            warpXOctaves.addEventListener(Event.CHANGE, handleInput);
            warpXPeriodX.addEventListener(Event.CHANGE, handleInput);
            warpXPeriodY.addEventListener(Event.CHANGE, handleInput);
            warpYSeed.addEventListener(Event.CHANGE, handleInput);
            warpYOctaves.addEventListener(Event.CHANGE, handleInput);
            warpYPeriodX.addEventListener(Event.CHANGE, handleInput);
            warpYPeriodY.addEventListener(Event.CHANGE, handleInput);
            amplitude.addEventListener(Event.CHANGE, handleInput);
        }


        public function handleInput (p_event:Event):void
        {
            noiseMap.seed = baseSeed.getValue();
            noiseMap.octaves = baseOctaves.getValue();
            noiseMap.periodX = basePeriodX.getValue();
            noiseMap.periodY = basePeriodY.getValue();

            noiseMap.update();
            noiseViewer.update();

            warpXMap.seed = warpXSeed.getValue();
            warpXMap.octaves = warpXOctaves.getValue();
            warpXMap.periodX = warpXPeriodX.getValue();
            warpXMap.periodY = warpXPeriodY.getValue();

            warpXMap.update();

            warpYMap.seed = warpYSeed.getValue();
            warpYMap.octaves = warpYOctaves.getValue();
            warpYMap.periodX = warpYPeriodX.getValue();
            warpYMap.periodY = warpYPeriodY.getValue();

            warpYMap.update();

            domainWarpMap.amplitude = amplitude.getValue();

            domainWarpMap.update();
            domainWarpViewer.update();
        }
    }
}
