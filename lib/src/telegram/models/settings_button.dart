import 'package:js/js.dart';

/// This object controls the __Settings__ item in the context menu of the Mini App in the Telegram interface.
/// More details at [Telegram API](https://core.telegram.org/bots/webapps#settingsbutton)
@JS("SettingsButton")
class SettingsButton {
  /// Shows whether the context menu item is visible. Set to false by default.
  @JS("isVisible")
  external bool isVisible;

  /// A method that sets the press event handler for the Settings item in the context menu.
  external void onClick(callback);

  /// A method that removes the press event handler from the Settings item in the context menu.
  external void offClick(callback);

  /// A method to make the Settings item in the context menu visible.
  external Future<void> show();

  /// A method to hide the Settings item in the context menu.
  external Future<void> hide();
}
