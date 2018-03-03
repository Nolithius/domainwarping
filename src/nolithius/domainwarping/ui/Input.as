package nolithius.domainwarping.ui
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFieldType;
    import flash.text.TextFormat;


    public class Input extends Sprite
    {
        public static const SPACING_X:int = 20;
        public static const SPACING_Y:int = 5;
        public static const TEXT_FORMAT:TextFormat = new TextFormat("Arial", 13);


        public var min:int;
        public var max:int;


        public function Input (p_label:String, p_value:int = 0, p_min:int = 0, p_max:int = int.MAX_VALUE)
        {
            min = p_min;
            max = p_max;

            var label:TextField = new TextField();
            label.defaultTextFormat = TEXT_FORMAT;
            label.width = 143;
            label.height = 20;
            label.text = p_label + " (" + p_min.toString() + "-" + (p_max == int.MAX_VALUE ? "MAX" : p_max.toString()) + "):";
            addChild(label);

            _input = new TextField();
            _input.defaultTextFormat = TEXT_FORMAT;
            _input.x = label.x + label.width;
            _input.width = 80;
            _input.height = 20;
            _input.background = true;
            _input.backgroundColor = 0xffffff;
            _input.border = true;
            _input.borderColor = 0x111111;
            _input.type = TextFieldType.INPUT;

            _input.text = p_value.toString();

            _input.addEventListener(Event.CHANGE, handleInput);

            addChild(_input);
        }


        protected function handleInput (p_event:Event):void
        {
            var previousValue:int = getValue();

            sanitize();

            if (getValue() != previousValue)
            {
                dispatchEvent(new Event(Event.CHANGE));
            }
        }


        protected function sanitize ():void
        {
            var value:int = Math.max(Math.min(parseInt(_input.text), max), min);
            _input.text = value.toString();
        }


        public function getValue ():int
        {
            return parseInt(_input.text);
        }


        protected var _input:TextField;
    }
}
