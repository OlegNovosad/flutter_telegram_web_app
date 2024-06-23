import 'package:js/js.dart';

/// This object controls the __back__ button, which can be displayed in the header of the Mini App in the Telegram interface.
/// More details at [Telegram API](https://core.telegram.org/bots/webapps#backbutton)
@JS("BackButton")
class BackButton {
  /// Shows whether the button is visible. Set to false by default.
  @JS("isVisible")
  external bool isVisible;

  /// A method that sets the button press event handler.
  external void onClick(callback);

  /// A method that removes the button press event handler.
  external void offClick(callback);

  /// A method to make the button active and visible.
  external Future show();

  /// A method to hide the button.
  external Future hide();
}
