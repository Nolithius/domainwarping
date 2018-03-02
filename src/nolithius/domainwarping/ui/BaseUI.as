package nolithius.domainwarping.ui
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldType;
    import flash.text.TextFormat;


    public class BaseUI extends Sprite
    {
        public var seed:TextField;


        public function BaseUI ()
        {
            var textFormat:TextFormat = new TextFormat("Arial", 14);

            var seedLabel:TextField = new TextField();
            seedLabel.defaultTextFormat = textFormat;
            seedLabel.width = 50;
            seedLabel.text = "Seed:";
            addChild(seedLabel);

            seed = new TextField();
            seed.defaultTextFormat = textFormat;
            seed.x = seedLabel.x + seedLabel.width;
            seed.width = 90;
            seed.height = 20;
            seed.background = true;
            seed.backgroundColor = 0xffffff;
            seed.border = true;
            seed.borderColor = 0x111111;
            seed.type = TextFieldType.INPUT;

            seed.text = (int(Math.random() * (int.MAX_VALUE - 1)) + 1).toString();

            addChild(seed);
        }
    }
}
