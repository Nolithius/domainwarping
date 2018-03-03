package nolithius.domainwarping.demos
{
    import flash.events.Event;

    import nolithius.domainwarping.maps.CircleGradientMap;

    import nolithius.domainwarping.maps.DomainWarpMap;
    import nolithius.domainwarping.maps.MultiplyMap;
    import nolithius.domainwarping.maps.NoiseMap;
    import nolithius.domainwarping.ui.Input;
    import nolithius.domainwarping.viewers.ElevationViewer;
    import nolithius.domainwarping.viewers.TerrainViewer;


    public class DomainWarpingDemo3 extends DomainWarpingDemo
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
        public var waterLine:Input;
        public var gradientRadius:Input;

        public var noiseMap:NoiseMap;
        public var noiseCircleGradientMap:CircleGradientMap;
        public var noiseMultiplyMap:MultiplyMap;

        public var warpXMap:NoiseMap;
        public var warpYMap:NoiseMap;

        public var domainWarpMap:DomainWarpMap;
        public var domainWarpCircleGradientMap:CircleGradientMap;
        public var domainWarpMultiplyMap:MultiplyMap;

        public var noiseViewer:TerrainViewer;
        public var domainWarpViewer:TerrainViewer;


        public function DomainWarpingDemo3 ()
        {
            baseSeed = new Input("Base Seed", 88, 0);
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

            warpXSeed = new Input("Warp X Seed", 77, 0);
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

            warpYSeed = new Input("Warp Y Seed", 3, 0);
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

            waterLine = new Input("Water Line %", 65, 0, 100);
            waterLine.x = amplitude.x;
            waterLine.y = amplitude.y + amplitude.height + Input.SPACING_Y;
            addChild(waterLine);

            gradientRadius = new Input("Radius %", 50, 1, 100);
            gradientRadius.x = amplitude.x;
            gradientRadius.y = waterLine.y + waterLine.height + Input.SPACING_Y;
            addChild(gradientRadius);

            var halfSmallestMapDimension:int = Math.min(MAP_WIDTH, MAP_HEIGHT) / 2;

            noiseMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, baseSeed.getValue(), baseOctaves.getValue(), basePeriodX.getValue(), basePeriodY.getValue());
            noiseCircleGradientMap = new CircleGradientMap(MAP_WIDTH, MAP_HEIGHT, halfSmallestMapDimension - 1, (halfSmallestMapDimension - 1) * (gradientRadius.getValue()) / 100.0);
            noiseMultiplyMap = new MultiplyMap(noiseMap, noiseCircleGradientMap);

            noiseViewer = new TerrainViewer(noiseMultiplyMap, MAP_SCALE, waterLine.getValue());
            noiseViewer.x = MAP_SCALE;
            noiseViewer.y = MAP_SCALE;
            addChild(noiseViewer);

            warpXMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, warpXSeed.getValue(), warpXOctaves.getValue(), warpXPeriodX.getValue(), warpXPeriodY.getValue());
            warpYMap = new NoiseMap(MAP_WIDTH, MAP_HEIGHT, warpYSeed.getValue(), warpYOctaves.getValue(), warpYPeriodX.getValue(), warpYPeriodY.getValue());
            domainWarpMap = new DomainWarpMap(noiseMap, warpXMap, warpYMap, amplitude.getValue());
            domainWarpCircleGradientMap = new CircleGradientMap(MAP_WIDTH, MAP_HEIGHT, noiseCircleGradientMap.outerRadius,noiseCircleGradientMap.innerRadius);
            domainWarpMultiplyMap = new MultiplyMap(domainWarpMap, domainWarpCircleGradientMap);

            domainWarpViewer = new TerrainViewer(domainWarpMultiplyMap, MAP_SCALE, waterLine.getValue());
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
            waterLine.addEventListener(Event.CHANGE, handleInput);
            gradientRadius.addEventListener(Event.CHANGE, handleInput);
        }


        public function handleInput (p_event:Event):void
        {
            noiseMap.seed = baseSeed.getValue();
            noiseMap.octaves = baseOctaves.getValue();
            noiseMap.periodX = basePeriodX.getValue();
            noiseMap.periodY = basePeriodY.getValue();

            var halfSmallestMapDimension:int = Math.min(MAP_WIDTH, MAP_HEIGHT) / 2;
            noiseCircleGradientMap.innerRadius = (halfSmallestMapDimension - 1) * (gradientRadius.getValue()) / 100.0;

            noiseMap.update();
            noiseCircleGradientMap.update();
            noiseMultiplyMap.update();

            noiseViewer.waterLine = waterLine.getValue();
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
            domainWarpCircleGradientMap.innerRadius = noiseCircleGradientMap.innerRadius;

            domainWarpMap.update();
            domainWarpCircleGradientMap.update();
            domainWarpMultiplyMap.update();

            domainWarpViewer.waterLine = waterLine.getValue();
            domainWarpViewer.update();
        }
    }
}
