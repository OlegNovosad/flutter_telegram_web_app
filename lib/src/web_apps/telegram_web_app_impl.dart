part of '../../telegram_web_app.dart';

class TelegramWebAppImpl extends TelegramWebApp {
  TelegramWebAppImpl._();

  @override
  bool get isSupported => platform.toLowerCase() != "unknown";

  @override
  TelegramInitData get initData => TelegramInitData.fromRawString(tg.initData);

  @override
  WebAppInitData? get initDataUnsafe => tg.initDataUnsafe;

  @override
  String get version => tg.version;

  @override
  String get platform => tg.platform;

  @override
  TelegramColorScheme get colorScheme => tg.colorScheme == 'dark'
      ? TelegramColorScheme.dark
      : TelegramColorScheme.light;

  @override
  ThemeParams get themeParams => ThemeParams.instance;

  @override
  bool get isExpanded => tg.isExpanded;

  @override
  double? get viewportHeight => tg.viewportHeight;

  @override
  double? get viewportStableHeight => tg.viewportStableHeight;

  @override
  String? get tgWebAppStartParam => tg.tgWebAppStartParam;

  @override
  Color? get headerColor => tg.headerColor.toColor();

  @override
  Color? get backgroundColor => tg.backgroundColor.toColor();

  @override
  bool get isClosingConfirmationEnabled => tg.isClosingConfirmationEnabled;

  @override
  BackButton get backButton => BackButton.instance;

  @override
  MainButton get mainButton => MainButton.instance;

  @override
  SettingsButton get settingButton => SettingsButton.instance;

  @override
  HapticFeedback get hapticFeedback => HapticFeedback.instance;

  @override
  CloudStorage get cloudStorage => CloudStorage.instance;

  @override
  Future<bool> isVersionAtLeast(String version) => tg.isVersionAtLeast(version);

  @override
  Future<void> setHeaderColor(Color color) =>
      tg.setHeaderColor(color.hexString);

  @override
  Future<void> setBackgroundColor(Color color) =>
      tg.setBackgroundColor(color.hexString);

  @override
  Future<void> enableClosingConfirmation() => tg.enableClosingConfirmation();

  @override
  Future<void> disableClosingConfirmation() => tg.disableClosingConfirmation();

  @override
  void onEvent(TelegramEvent event) => tg.onEvent(
      event.eventType.eventName, tg.JsDynamicCallback(event.eventHandler));

  @override
  void offEvent(TelegramEvent event) => tg.offEvent(
      event.eventType.eventName, tg.JsDynamicCallback(event.eventHandler));

  @override
  Future<void> sendData(String data) async {
    assert(data.length <= 4096,
        'Data length must be less than or equal to 4096 bytes');
    await tg.sendData(data);
  }

  @override
  Future<void> switchInlineQuery(String query, [ChatType? chatType]) =>
      tg.switchInlineQuery(query, chatType?.chatType);

  @override
  Future<void> openLink(String url, {bool tryInstantView = true}) =>
      tg.openLink(url, OpenLinkParams(tryInstantView: tryInstantView));

  @override
  Future<void> openTelegramLink(String url) => tg.openTelegramLink(url);

  @override
  Future<void> openInvoice(String url, [Function(dynamic)? onInvoiceStatus]) =>
      onInvoiceStatus != null
          ? tg.openInvoice(url, tg.JsDynamicCallback(onInvoiceStatus))
          : tg.openInvoice(url);

  @override
  Future<void> showPopup({
    String? title,
    required String message,
    List<PopupButton>? buttons,
    required Function(String id) callback,
  }) {
    assert(title == null || title.length < 64,
        'Title must be less than 64 characters');
    assert(message.isNotEmpty && message.length < 256,
        'Message must be 1-256 characters');
    assert(buttons == null || buttons.length <= 3, 'Buttons must be 1-3');

    List<PopupButtonInternal>? newButtons;
    if (buttons != null) {
      newButtons = [];
      for (var button in buttons) {
        assert(button.id == null || button.id!.length < 64,
            'Button id must be less than 64 characters');
        assert(button.text == null || button.text!.length < 64,
            'Button text must be less than 64 characters');
        newButtons.add(button.asInternalPopupButton);
      }
    }
    return tg.showPopup(
      PopupParams(title: title, message: message, buttons: newButtons),
      tg.JsDynamicCallback(callback),
    );
  }

  @override
  Future<void> showAlert(String message, [Function()? callback]) =>
      callback != null
          ? tg.showAlert(message, tg.JsDynamicCallback(callback))
          : tg.showAlert(message);

  @override
  Future<void> showConfirm(String message,
          [void Function(bool isOkPressed)? callback]) =>
      callback != null
          ? tg.showConfirm(message, tg.JsDynamicCallback(callback))
          : tg.showConfirm(message);

  @override
  Future<void> showScanQrPopup(String? infoTitle,
      [bool Function(String result)? callback]) async {
    assert(infoTitle == null || infoTitle.length < 64,
        'Info title must be less than 64 characters');
    callback != null
        ? await tg.showScanQrPopup(
            ScanQrPopupParams(text: infoTitle), tg.JsDynamicCallback(callback))
        : await tg.showScanQrPopup(ScanQrPopupParams(text: infoTitle));
  }

  @override
  Future<void> closeScanQrPopup() => tg.closeScanQrPopup();

  @override
  Future<void> readTextFromClipboard(
          [Function(String clipboardText)? onRead]) =>
      onRead != null
          ? tg.readTextFromClipboard(tg.JsDynamicCallback(onRead))
          : tg.readTextFromClipboard();

  @override
  Future<void> requestWriteAccess({required Function(bool granted) onResult}) =>
      tg.requestWriteAccess(tg.JsDynamicCallback(onResult));

  @override
  Future<void> requestContact([Function(bool granted)? onResult]) =>
      onResult != null
          ? tg.requestContact(tg.JsDynamicCallback(onResult))
          : tg.requestContact();

  @override
  Future<void> ready() => tg.ready();

  @override
  Future<void> expand() => tg.expand();

  @override
  Future<void> close() => tg.close();
}
