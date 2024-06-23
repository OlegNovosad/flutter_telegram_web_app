import 'package:telegram_web_app/src/telegram/internal.dart' as tg;

/// This object controls the __back__ button, which can be displayed in the header of the Mini App in the Telegram interface.
/// More details at [Telegram API](https://core.telegram.org/bots/webapps#backbutton)
class BackButton {
  BackButton._();
  static BackButton? _instance;
  static BackButton get instance => _instance ??= BackButton._();

  /// Shows whether the button is visible. Set to false by default.
  bool get isVisible => tg.backButton.isVisible;

  /// A method that sets the button press event handler.
  void onClick(void Function() callback) =>
      tg.backButton.onClick(tg.JsDynamicCallback(callback));

  /// A method that removes the button press event handler.
  void offClick(void Function() callback) =>
      tg.backButton.offClick(tg.JsDynamicCallback(callback));

  /// A method to make the button active and visible.
  Future show() => tg.backButton.show();

  /// A method to hide the button.
  Future hide() => tg.backButton.hide();
}
