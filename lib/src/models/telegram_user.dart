class TelegramUser {
  final int id;
  final String firstName;
  final String? lastName;
  final String username;
  final String? languageCode;
  final bool? allowsWriteToPm;
  final String? photoUrl;
  final bool? isBot;
  final bool? isPremium;
  final bool? addedToAttachmentMenu;

  TelegramUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.languageCode,
    required this.allowsWriteToPm,
    required this.photoUrl,
    required this.isBot,
    required this.isPremium,
    required this.addedToAttachmentMenu,
  });

  @override
  String toString() {
    return "TelegramUser{"
        "id:$id, "
        "firstname: $firstName, "
        "lastname: $lastName, "
        "username: $username, "
        "languageCode: $languageCode, "
        "allowsWriteToPm: $allowsWriteToPm, "
        "photoUrl: $photoUrl, "
        "isBot: $isBot, "
        "isPremium: $isPremium, "
        "addedToAttachmentMenu: $addedToAttachmentMenu"
        "}";
  }
}
