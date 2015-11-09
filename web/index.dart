library polymer_dart_example.web.index;

import 'package:polymer_dart_example/random_color.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:react/react_client.dart' as reactClient;
import 'package:react/react.dart' as react;

final NodeValidatorBuilder _polymerValidator = new NodeValidatorBuilder.common()
  ..allowElement('random-color', attributes: ['my-color'])
  ..allowElement('div', attributes: ['style']);

var PolymerComponent = react.registerComponent(() => new _PolymerComponent());
class _PolymerComponent extends react.Component {
  render() => react.div({});
  componentDidMount(root) {
    Element element = react.findDOMNode(this);
    element.setInnerHtml('<random-color my-color="blue"></random-color>', validator: _polymerValidator);
  }
}

main() async {
  reactClient.setClientConfiguration();
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

  // API via React-Dart
  react.render(
    PolymerComponent({}),
    querySelector('#random-color-container-react')
  );


}
