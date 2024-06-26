class TelegramUser {
  final int id;
  final bool? isBot;
  final bool? isPremium;
  final String? photoUrl;
  final String firstName;
  final String? lastName;
  final String? username;
  final String? languageCode;
  final bool? allowsWriteToPm;

  TelegramUser({
    required this.id,
    required this.isBot,
    required this.isPremium,
    required this.photoUrl,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.languageCode,
    required this.allowsWriteToPm,
  });

  @override
  String toString() {
    return "TelegramUser{"
        "id:$id, "
        "isBot: $isBot, "
        "isPremium: $isPremium, "
        "photoUrl: $photoUrl, "
        "firstName: $firstName, "
        "lastName: $lastName, "
        "username: $username, "
        "languageCode: $languageCode, "
        "allowsWriteToPm: $allowsWriteToPm"
        "}";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TelegramUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          isBot == other.isBot &&
          isPremium == other.isPremium &&
          photoUrl == other.photoUrl &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          username == other.username &&
          languageCode == other.languageCode &&
          allowsWriteToPm == other.allowsWriteToPm;

  @override
  int get hashCode =>
      id.hashCode ^
      isBot.hashCode ^
      isPremium.hashCode ^
      photoUrl.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      username.hashCode ^
      languageCode.hashCode ^
      allowsWriteToPm.hashCode;
}