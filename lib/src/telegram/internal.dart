@JS("Telegram.WebApp")
library internal;

import 'package:js/js.dart';
import 'package:telegram_web_app/src/telegram/data/open_link_params.dart';
import 'package:telegram_web_app/src/telegram/data/scan_qr_popup_params.dart';
import 'package:telegram_web_app/src/telegram/models/settings_button.dart'
    as sb;

import 'data/popup_params.dart';
import 'data/theme_params.dart';
import 'data/web_app_init_data.dart';
import 'models/back_button.dart' as bb;
import 'models/cloud_storage.dart' as cs;
import 'models/haptic_feedback.dart' as hf;
import 'models/main_button.dart' as mb;

/// A string with raw data transferred to the Mini App, convenient for [validating data](https://core.telegram.org/bots/webapps#validating-data-received-via-the-mini-app).
/// __WARNING:__ [Validate data](https://core.telegram.org/bots/webapps#validating-data-received-via-the-mini-app) from this field before using it on the bot's server.
@JS("initData")
external String get initData;

/// An object with input data transferred to the Mini App.
/// __WARNING:__ Data from this field should not be trusted.
/// You should only use data from _initData_ on the bot's server and only after it has been [validated](https://core.telegram.org/bots/webapps#validating-data-received-via-the-mini-app).
@JS("initDataUnsafe")
external WebAppInitData get initDataUnsafe;

/// The version of the Bot API available in the user's Telegram app.
@JS("version")
external String get version;

/// The name of the platform of the user's Telegram app.
@JS("platform")
external String get platform;

/// The color scheme currently used in the Telegram app. Either `light` or `dark`.
@JS("colorScheme")
external String get colorScheme;

/// Current header color in the `#RRGGBB` format.
@JS("headerColor")
external String get headerColor;

/// Current background color in the `#RRGGBB` format.
@JS("backgroundColor")
external String get backgroundColor;

/// __True__, if the confirmation dialog is enabled while the user is trying to close the Mini App.
/// __False__, if the confirmation dialog is disabled.
@JS("isClosingConfirmationEnabled")
external bool get isClosingConfirmationEnabled;

/// _True_, if the Mini App is expanded to the maximum available height.
/// False, if the Mini App occupies part of the screen and can be expanded to the full height using the [expand] method.
@JS("isExpanded")
external bool get isExpanded;

/// The current height of the visible area of the Mini App.
/// The application can display just the top part of the Mini App, with its lower part remaining outside the screen area.
/// From this position, the user can “pull” the Mini App to its maximum height, while the bot can do the same by calling the [expand] method.
/// As the position of the Mini App changes, the current height value of the visible area will be updated in real time.
///
/// Please note that the refresh rate of this value is not sufficient to smoothly follow the lower border of the window.
/// It should not be used to pin interface elements to the bottom of the visible area.
/// It's more appropriate to use the value of the [viewportStableHeight] field for this purpose.
@JS("viewportHeight")
external double? get viewportHeight;

/// The height of the visible area of the Mini App in its last stable state.
/// The application can display just the top part of the Mini App, with its lower part remaining outside the screen area.
/// From this position, the user can “pull” the Mini App to its maximum height, while the bot can do the same by calling the [expand] method.
/// Unlike the value of [viewportHeight], the value of [viewportStableHeight] does not change as the position of the Mini App changes with user gestures or during animations.
/// The value of [viewportStableHeight] will be updated after all gestures and animations are completed and the Mini App reaches its final size.
///
/// Note the event [viewportChanged] with the passed parameter `isStateStable=true`, which will allow you to track when the stable state of the height of the visible area changes.
@JS("viewportStableHeight")
external double? get viewportStableHeight;

@JS("tgWebAppStartParam")
external String? get tgWebAppStartParam;

/// An object containing the current theme settings used in the Telegram app.
@JS("themeParams")
external ThemeParams get themeParams;

/// An object for controlling the back button which can be displayed in the header of the Mini App in the Telegram interface.
@JS("BackButton")
external bb.BackButton get backButton;

/// An object for controlling the main button, which is displayed at the bottom of the Mini App in the Telegram interface.
@JS("MainButton")
external mb.MainButton get mainButton;

/// An object for controlling the Settings item in the context menu of the Mini App in the Telegram interface.
@JS("SettingsButton")
external sb.SettingsButton get settingsButton;

/// An object for controlling haptic feedback.
@JS("HapticFeedback")
external hf.HapticFeedback get hapticFeedback;

/// An object for controlling cloud storage.
@JS("CloudStorage")
external cs.CloudStorage get cloudStorage;

/// A method that informs the Telegram app that the Mini App is ready to be displayed.
/// It is recommended to call this method as early as possible, as soon as all essential interface elements are loaded.
/// Once this method is called, the loading placeholder is hidden and the Mini App is shown.
/// If the method is not called, the placeholder will be hidden only when the page is fully loaded.
external Future<void> ready();

/// A method that expands the Mini App to the maximum available height.
/// To find out if the Mini App is expanded to the maximum height, refer to the value of the [isExpanded] parameter
external Future<void> expand();

/// A method that closes the Mini App.
external Future<void> close();

/// A method that enables a confirmation dialog while the user is trying to close the Mini App.
external Future<void> enableClosingConfirmation();

/// A method that disables the confirmation dialog while the user is trying to close the Mini App.
external Future<void> disableClosingConfirmation();

/// A method used to send data to the bot.
/// When this method is called, a service message is sent to the bot containing the data data of the length up to 4096 bytes, and the Mini App is closed.
///
/// _This method is only available for Mini Apps launched via a [Keyboard button](https://core.telegram.org/bots/webapps#keyboard-button-mini-apps)._
external Future<void> sendData(String data);

/// Returns true if the user's app supports a version of the Bot API that is equal to or higher than the version passed as the [version].
external Future<bool> isVersionAtLeast(version);

/// A method that sets the app header color in the `#RRGGBB` format.
external Future<void> setHeaderColor(String color);

/// A method that sets the app background color in the `#RRGGBB` format.
external Future<void> setBackgroundColor(String color);

/// A method that inserts the bot's username and the specified inline [query] in the current chat's input field.
/// Query may be empty, in which case only the bot's username will be inserted.
/// If an optional [chooseChatTypes] parameter was passed, the client prompts the user to choose a specific chat, then opens that chat and inserts the bot's username and the specified inline [query] in the input field.
/// You can specify which types of chats the user will be able to choose from. It can be one or more of the following types: _users, bots, groups, channels_.
external Future<void> switchInlineQuery(query, [chooseChatTypes]);

/// A method that opens a [url] in an external browser. The Mini App will not be closed.
/// If the optional [options] parameter is passed with the field [OpenLinkParams.tryInstantView] set to `true`, the link will be opened in [Instant View](https://instantview.telegram.org/) mode if possible.
///
/// _Note that this method can be called only in response to user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button)_
external Future<void> openLink(url, [OpenLinkParams options]);

/// A method that opens a telegram [url] inside the Telegram app. The Mini App will not be closed after this method is called.
external Future<void> openTelegramLink(String url);

/// A method that opens an invoice using the link [url].
/// The Mini App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps) _invoiceClosed_ when the invoice is closed.
/// If an optional [callback] parameter was passed, the callback function will be called and the invoice status will be passed as the first argument.
external Future<void> openInvoice(String url, [callback]);

/// A method that requests text from the clipboard. The Mini App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps) _clipboardTextReceived_.
/// If an optional [callback] parameter was passed, the [callback] function will be called and the text from the clipboard will be passed as the first argument.
///
/// _Note: this method can be called only for Mini Apps launched from the attachment menu and only in response to a user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button)._
external Future<void> readTextFromClipboard([callback]);

/// A method that shows a native popup requesting permission for the bot to send messages to the user.
/// If an optional [callback] parameter was passed, the [callback] function will be called when the popup is closed and the first argument will be a boolean indicating whether the user granted this access.
external Future<void> requestWriteAccess([callback]);

/// A method that shows a native popup prompting the user for their phone number.
/// If an optional [callback] parameter was passed, the [callback] function will be called when the popup is closed and the first argument will be a boolean indicating whether the user shared its phone number.
external Future<void> requestContact([callback]);

/// A method that shows a native popup described by the [params] argument of the type [PopupParams].
/// The Mini App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps) _popupClosed_ when the popup is closed.
/// If an optional [callback] parameter was passed, the [callback] function will be called and the field id of the pressed button will be passed as the first argument.
external Future<void> showPopup(PopupParams params, [callback]);

/// A method that shows [message] in a simple alert with a `Close` button.
/// If an optional [callback] parameter was passed, the [callback] function will be called when the popup is closed.
external Future<void> showAlert(String message, [callback]);

/// A method that shows [message] in a simple confirmation window with `OK` and `Cancel` buttons.
/// If an optional [callback] parameter was passed, the [callback] function will be called when the popup is closed and the first argument will be a boolean indicating whether the user pressed the `OK` button.
external Future<void> showConfirm(String message, [callback]);

/// A method that shows a native popup for scanning a QR code described by the [params] argument of the type [ScanQrPopupParams].
/// The Mini App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps) _qrTextReceived_ every time the scanner catches a code with text data.
/// If an optional [callback] parameter was passed, the [callback] function will be called and the text from the QR code will be passed as the first argument.
/// Returning _true_ inside this callback function causes the popup to be closed.
external Future<void> showScanQrPopup(ScanQrPopupParams params, [callback]);

/// A method that closes the native popup for scanning a QR code opened with the [showScanQrPopup] method.
/// Run it if you received valid data in the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps) _qrTextReceived_.
external Future<void> closeScanQrPopup();

/// A method that sets the app event handler. Check the [list of available events](https://core.telegram.org/bots/webapps#events-available-for-mini-apps).
external void onEvent(String eventType, callback);

/// A method that deletes a previously set event handler.
external void offEvent(String eventType, callback);

// ignore: non_constant_identifier_names
JsDynamicCallback(Function callback) => allowInterop(callback);
