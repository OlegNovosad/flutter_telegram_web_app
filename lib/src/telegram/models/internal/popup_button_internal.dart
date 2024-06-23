import 'package:js/js.dart';

@JS()
@anonymous
class PopupButtonInternal {
  external factory PopupButtonInternal(
      {String? id, String? type, String? text});

  external String get id;

  external String get type;

  external String? get text;
}
