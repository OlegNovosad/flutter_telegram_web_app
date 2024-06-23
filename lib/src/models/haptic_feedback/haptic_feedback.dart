import 'package:telegram_web_app/src/models/haptic_feedback/haptic_feedback_impact.dart';
import 'package:telegram_web_app/src/models/haptic_feedback/haptic_feedback_notification_type.dart';
import 'package:telegram_web_app/src/telegram/internal.dart' as tg;

class HapticFeedback {
  HapticFeedback._();
  static HapticFeedback? _instance;
  static HapticFeedback get instance => _instance ??= HapticFeedback._();

  /// A method tells that an [impact] occurred. The Telegram app may play
  /// the appropriate haptics based on style value passed
  void impactOccurred(HapticFeedbackImpact impact) =>
      tg.hapticFeedback.impactOccurred(impact.name);

  /// A method tells that a task or action has succeeded, failed, or produced a warning.
  /// The Telegram app may play the appropriate haptics based on [type] value passed.
  void notificationOccurred(HapticFeedbackNotificationType type) =>
      tg.hapticFeedback.notificationOccurred(type.name);

  /// A method tells that the user has changed a selection. The Telegram app may play
  /// the appropriate haptics.
  /// __Do not use this feedback when the user makes or confirms a selection; use it only when the selection changes.__
  void selectionChanged() => tg.hapticFeedback.selectionChanged();
}
