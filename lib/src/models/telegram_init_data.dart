import 'dart:convert';

import 'package:telegram_web_app/src/models/telegram_user.dart';
import 'package:telegram_web_app/src/util/data_parser.dart';

class TelegramInitData {
  final TelegramUser user;
  final int? chatInstance;
  final String? chatType;
  final String? queryId;
  final int authDate;
  final String hash;
  final String raw;

  TelegramInitData({
    required this.user,
    required this.chatInstance,
    required this.chatType,
    required this.queryId,
    required this.authDate,
    required this.hash,
    required this.raw,
  });

  factory TelegramInitData.fromRawString(String data) {
    Map<String, String?> validationData = DataParser.parseAmpersandSeparatedData(data);

    // Parse user URI json string into Dart Map
    Map<String, dynamic> userData = jsonDecode(Uri.decodeFull(validationData['user']!));

    TelegramUser user = TelegramUser(
      id: userData['id'],
      isBot: userData['is_bot'],
      isPremium: userData['is_premium'],
      photoUrl: userData['photo_url'],
      firstName: userData['first_name'],
      lastName:
          ((userData['last_name'] as String?)?.isNotEmpty ?? false) ? userData['last_name'] : null,
      username: userData['username'],
      languageCode: userData['language_code'],
      allowsWriteToPm: userData['allows_write_to_pm'],
    );

    int? chatInstance = validationData['chat_instance']?.isNotEmpty ?? false
        ? int.parse(validationData['chat_instance']!)
        : null;
    String? chatType = validationData['chat_type'];
    String? queryId = validationData['query_id'];

    int authDate = int.parse(validationData['auth_date']!);
    String hash = validationData['hash']!;

    return TelegramInitData(
      user: user,
      chatInstance: chatInstance,
      queryId: queryId,
      chatType: chatType,
      authDate: authDate,
      hash: hash,
      raw: data,
    );
  }

  factory TelegramInitData.fake() {
    TelegramUser user = TelegramUser(
      id: 23424242,
      isBot: false,
      isPremium: false,
      photoUrl: 'https://fastly.picsum.photos/id/1067/200/200.jpg?hmac=ngB6HBZNUvsDrt27Y2-MuiSoudFqdwH6bSd8CP8zsy8',
      firstName: 'Joh',
      lastName: 'Kerry',
      username: 'flutter_telegram',
      languageCode: 'en',
      allowsWriteToPm: true,
    );

    return TelegramInitData(
      user: user,
      chatInstance: 23423423424243,
      queryId: null,
      chatType: 'private',
      authDate: 1711523754,
      hash: '990cb639550445f1d6ac16cac04f793a570904fa89104fa9e854d51d6bd489a6',
      raw: 'This is fake row data',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TelegramInitData &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          chatInstance == other.chatInstance &&
          chatType == other.chatType &&
          queryId == other.queryId &&
          authDate == other.authDate &&
          hash == other.hash &&
          raw == other.raw;

  @override
  int get hashCode =>
      user.hashCode ^
      chatInstance.hashCode ^
      chatType.hashCode ^
      queryId.hashCode ^
      authDate.hashCode ^
      hash.hashCode ^
      raw.hashCode;

  @override
  String toString() {
    return 'TelegramInitData{'
        'user: $user, '
        'chatInstance: $chatInstance, '
        'chatType: $chatType, '
        'queryId: $queryId, '
        'authDate: $authDate, '
        'hash: $hash, '
        'raw: $raw}';
  }
}
