@HtmlImport('random_color.html')
library polymer_dart_example.lib.random_color;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
import 'dart:math';
import 'dart:html';

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
  void setRandomColorByEvent(Event event, Map detail) {
    setRandomColor();
  }

  @reflectable
  void setRandomColor() {
    int max = 16777315;
    int hexColor = (new Random().nextDouble() * max).floor();
    String hexColorWithPaddingHack = (hexColor + 0x1000000).toRadixString(16).substring(1, 7);
    set('myColor', '#' + hexColorWithPaddingHack);
  }

  @reflectable
  void makeRed(Event event, Map detail) {
    set('myColor', 'red');
  }
}
