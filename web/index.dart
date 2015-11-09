library polymer_dart_example.web.index;

import 'package:polymer_dart_example/random_color.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

main() async {
  await initPolymer();
  RandomColor colorElement = querySelector('random-color');
  Element colorSpan = querySelector('#color-span');
  colorElement.addEventListener('my-color-changed', (CustomEvent e) {
    String color = e.detail['value'];
    colorSpan.innerHtml = color;
    colorSpan.style.color = color;
  });

  // API via method
  Element apiRandomColor = querySelector('#api-random-color');
  apiRandomColor.onClick.listen((MouseEvent e) {
    colorElement.setRandomColor();
  });

  // API via property
  Element apiPurple = querySelector('#api-purple');
  apiPurple.onClick.listen((MouseEvent e) {
    colorElement.set('myColor', 'purple');
  });

}
