@HtmlImport('random_color.html')
library polymer_dart_example.lib.random_color;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
import 'dart:math';

@PolymerRegister('random-color')
class RandomColor extends PolymerElement {
    @Property(notify: true, observer: 'changeColorStyle')
    String myColor = 'grey';
    @Property(notify: true)
    String colorStyle;

    RandomColor.created() : super.created();

    @reflectable
    void changeColorStyle(String newColor, String oldColor) {
        set('colorStyle', 'background-color: ' + newColor);
    }

//    Could do this instead for less code, but maybe a little more magic.  Reference it in a binding like [[changeColorStyle(myColor)]]
//    @reflectable
//    String changeColorStyle(String color) => 'background-color: ' + color;

    @reflectable
    void setRandomColor(Event event, Map detail) {
        int max = 16777315;
        String hexColor = '#' + (new Random().nextDouble() * max).floor().toRadixString(16);
        set('myColor', hexColor);
    }

    @reflectable
    void makeRed(Event event, Map detail) {
        set('myColor', 'red');
    }
}


