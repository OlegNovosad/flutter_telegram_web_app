import 'dart:ui';

import 'package:telegram_web_app/src/telegram/internal.dart' as tg;

import '../../telegram_web_app.dart';

/// This object controls the __main__ button, which is displayed at the bottom of the Mini App in the Telegram interface.
/// More details at [Telegram API](https://core.telegram.org/bots/webapps#mainbutton)
class MainButton {
  MainButton._();
  static MainButton? _instance;
  static MainButton get instance => _instance ??= MainButton._();

  /// Current button text. Set to CONTINUE by default.
  String get text => tg.mainButton.text;

  /// Current button color. Set to themeParams.button_color by default.
  Color? get color => tg.mainButton.color.toColor();

  /// Current button text color. Set to themeParams.button_text_color by default.
  Color? get textColor => tg.mainButton.textColor.toColor();

  /// Shows whether the button is visible. Set to false by default.
  bool get isVisible => tg.mainButton.isVisible;

  /// Shows whether the button is active. Set to true by default.
  bool get isActive => tg.mainButton.isActive;

  /// Readonly. Shows whether the button is displaying a loading indicator.
  bool get isProgressVisible => tg.mainButton.isProgressVisible;

  /// A method to set the button text.
  void setText(String text) => tg.mainButton.setText(text);

  /// A method that sets the button press event handler.
  void onClick(void Function() callback) =>
      tg.mainButton.onClick(tg.JsDynamicCallback(callback));

  /// A method that removes the button press event handler.
  void offClick(void Function() callback) =>
      tg.mainButton.offClick(tg.JsDynamicCallback(callback));

  /// A method to make the button visible.
  /// Note that opening the Mini App from the attachment menu hides the main
  /// button until the user interacts with the Mini App interface.
  Future<void> show() => tg.mainButton.show();

  /// A method to hide the button.
  Future<void> hide() => tg.mainButton.hide();

  /// A method to enable the button.
  void enable() => tg.mainButton..enable();

  /// A method to disable the button.
  void disable() => tg.mainButton.disable();

  /// A method to show a loading indicator on the button.
  /// It is recommended to display loading progress if the action tied to the button may
  /// take a long time. By default, the button is disabled while the action is in progress.
  /// If the parameter leaveActive=true is passed, the button remains enabled.
  void showProgress(bool leaveActive) =>
      tg.mainButton.showProgress(leaveActive);

  /// A method to hide the loading indicator
  void hideProgress() => tg.mainButton.hideProgress();

  /// A method to set the button parameters.
  /// The [mainButtonParams] is an object containing one or several fields that need to be changed.
  void setParams(MainButtonParams mainButtonParams) =>
      tg.mainButton.setParams(mainButtonParams);
}
