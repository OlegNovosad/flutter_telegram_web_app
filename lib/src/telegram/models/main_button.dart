import 'package:js/js.dart';

import '../data/main_button_params.dart';

/// This object controls the main button, which is displayed at the bottom of the Mini App in the Telegram interface.
/// More details at [Telegram API](https://core.telegram.org/bots/webapps#mainbutton)
@JS("MainButton")
class MainButton {
  /// Current button text.
  /// Set to CONTINUE by default.
  @JS("text")
  external String text;

  /// Current button color.
  /// Set to themeParams.button_color by default.
  @JS("color")
  external String color;

  /// Current button text color.
  /// Set to themeParams.button_text_color by default.
  @JS("textColor")
  external String textColor;

  /// Shows whether the button is visible.
  /// Set to false by default.
  @JS("isVisible")
  external bool isVisible;

  /// Shows whether the button is active.
  /// Set to true by default.
  @JS("isActive")
  external bool isActive;

  /// Shows whether the button is displaying a loading indicator.
  @JS("isProgressVisible")
  external bool get isProgressVisible;

  /// A method to set the button text.
  external void setText(String text);

  /// A method that sets the button press event handler.
  external void onClick(callback);

  /// A method that removes the button press event handler.
  external void offClick(callback);

  /// A method to make the button visible.
  /// Note that opening the Mini App from the attachment menu hides the main button until the user interacts with the Mini App interface.
  external Future<void> show();

  /// A method to hide the button.
  external Future<void> hide();

  /// A method to enable the button.
  external void enable();

  /// A method to disable the button.
  external void disable();

  /// A method to show a loading indicator on the button.
  /// It is recommended to display loading progress if the action tied to the button may take a long time.
  /// By default, the button is disabled while the action is in progress.
  /// If the parameter [leaveActive] is true, the button remains enabled.
  external void showProgress(bool leaveActive);

  /// A method to hide the loading indicator.
  external void hideProgress();

  /// A method to set the button parameters.
  /// The [mainButtonParams] is an object containing one or several fields that need to be changed.
  external void setParams(MainButtonParams mainButtonParams);
}
