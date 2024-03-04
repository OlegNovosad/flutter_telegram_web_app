import 'package:flutter/material.dart';

/// initData
/// initDataUnsafe
/// version
/// platform
/// colorScheme
/// themeParams
/// isExpanded
/// viewportHeight
/// viewportStableHeight
/// headerColor
/// backgroundColor
/// isClosingConfirmationEnabled
/// BackButton
/// MainButton
/// SettingsButton
/// HapticFeedback
/// CloudStorage
/// isVersionAtLeast(version)
/// setHeaderColor(color)
/// setBackgroundColor(color)
/// enableClosingConfirmation()
/// disableClosingConfirmation()
/// onEvent(eventType, eventHandler)
/// offEvent(eventType, eventHandler)
/// sendData(data)
/// switchInlineQuery(query[, choose_chat_types])
/// openLink(url[, options])
/// openTelegramLink(url)
/// openInvoice(url[, callback])
/// showPopup(params[, callback])
/// showAlert(message[, callback])
/// showConfirm(message[, callback])
/// showScanQrPopup(params[, callback])
/// closeScanQrPopup()
/// readTextFromClipboard([callback])
/// requestWriteAccess([callback])
/// requestContact([callback])
/// ready()
/// expand()
/// close()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}