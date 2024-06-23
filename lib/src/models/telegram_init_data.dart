import 'dart:convert';

import 'telegram_user.dart';

class TelegramInitData {
  final TelegramUser user;
  final int chatInstance;
  final String chatType;
  final int authDate;
  final String hash;

  final String raw;
  TelegramInitData({
    required this.user,
    required this.chatInstance,
    required this.chatType,
    required this.authDate,
    required this.hash,
    required this.raw,
  });

  factory TelegramInitData.fromRawString(String data) {
    List<int> bytes = data.codeUnits;
    final String rawData = utf8.decode(bytes);

    int userStartIndex = rawData.indexOf('user=') + 'user='.length;
    int userEndIndex = rawData.indexOf('&', userStartIndex);
    String userJson = rawData.substring(userStartIndex, userEndIndex);

    // Parse user JSON string into Dart Map
    Map<String, dynamic> userData = jsonDecode(Uri.decodeFull(userJson));
    TelegramUser user = TelegramUser(
      id: userData['id'],
      firstName: userData['first_name'],
      lastName: userData['last_name'],
      username: userData['username'],
      languageCode: userData['language_code'],
      allowsWriteToPm: userData['allows_write_to_pm'],
      photoUrl: userData['photo_url'],
      isBot: userData['is_bot'],
      isPremium: userData['is_premium'],
      addedToAttachmentMenu: userData['added_to_attachment_menu'],
    );

    List<String> keyValuePairs = rawData.substring(userEndIndex + 1).split('&');
    for (String pair in keyValuePairs) {
      List<String> parts = pair.split('=');
      userData[parts[0]] = parts[1];
    }

    int chatInstance = int.parse(userData['chat_instance']);
    String chatType = userData['chat_type'];
    int authDate = int.parse(userData['auth_date']);
    String hash = userData['hash'];

    return TelegramInitData(
      user: user,
      chatInstance: chatInstance,
      chatType: chatType,
      authDate: authDate,
      hash: hash,
      raw: data,
    );
  }

  factory TelegramInitData.fake() {
    TelegramUser user = TelegramUser(
      id: 23424242,
      firstName: 'Joh',
      lastName: 'Kerry',
      username: 'flutter_telegram',
      languageCode: 'en',
      allowsWriteToPm: true,
      photoUrl:
          'https://fastly.picsum.photos/id/684/200/200.jpg?hmac=Al0pymCRQr_mB6OlD9xW3UsgmSKDgnNPq2JLj3_CfUY',
      isBot: false,
      isPremium: false,
      addedToAttachmentMenu: false,
    );

    return TelegramInitData(
        user: user,
        chatInstance: 23423423424243,
        chatType: 'private',
        authDate: 1711523754,
        hash:
            '990cb639550445f1d6ac16cac04f793a570904fa89104fa9e854d51d6bd489a6',
        raw: 'This is fake row data');
  }

  @override
  String toString() {
    return 'TelegramInitData{'
        'user: $user, '
        'chatInstance: $chatInstance, '
        'chatType: $chatType, '
        'authDate: $authDate, '
        'hash: $hash,'
        'raw: $raw'
        '}';
  }
}
