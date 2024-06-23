import 'package:js/js.dart';

///https://core.telegram.org/bots/webapps#themeparams
@JS("ThemeParams")
class ThemeParams {
  @JS("bg_color")
  external String get bgColor;

  /// Main text color
  @JS("text_color")
  external String get textColor;

  @JS("hint_color")
  external String get hintColor;

  @JS("link_color")
  external String get linkColor;

  @JS("button_color")
  external String get buttonColor;

  @JS("button_text_color")
  external String get buttonTextColor;

  @JS("primary_bg_color")
  external String get secondaryBgColor;

  @JS("header_bg_color")
  external String get headerBgColor;

  @JS("header_text_color")
  external String get accentTextColor;

  @JS("section_bg_color")
  external String get sectionBgColor;

  @JS("section_header_text_color")
  external String get sectionHeaderTextColor;

  @JS("section_text_color")
  external String get subtitleTextColor;

  /// Text color for destructive actions
  @JS("destructive_text_color")
  external String get destructiveTextColor;
}
