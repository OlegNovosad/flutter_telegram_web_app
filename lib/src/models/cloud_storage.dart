import 'package:telegram_web_app/src/telegram/internal.dart' as tg;

/// This object controls the cloud storage. Each bot can store up to 1024 items per user in the cloud storage.
/// More details at [Telegram API](https://core.telegram.org/bots/webapps#cloudstorage)
class CloudStorage {
  static CloudStorage? _instance;
  static CloudStorage get instance => _instance ??= CloudStorage();

  /// A method that stores a value in the cloud storage using the specified key.
  /// You can store up to 1024 keys in the cloud storage
  /// [key] should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed
  /// [value] should contain 0-4096 characters.
  /// If an optional [callback] parameter was passed, the callback function will be called.
  /// In case of an [error], the first argument will contain the error.
  /// In case of [success], the first argument will be null and the second argument will
  /// be a boolean indicating whether the value was stored.
  Future<void> setItem(String key, String value,
          [void Function(String? error, [bool? isStored])? callback]) =>
      tg.cloudStorage.setItem(
          key, value, callback != null ? tg.JsDynamicCallback(callback) : null);

  /// A method that receives a value from the cloud storage using the specified key.
  /// [key] should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed
  /// In case of an [error], the callback function will be called and the first argument
  /// will contain the error. In case of [success], the first argument will be null and
  /// the value will be passed as the second argument.
  Future<void> getItem(String key,
          void Function(String? error, [String? result]) callback) =>
      tg.cloudStorage.getItem(key, tg.JsDynamicCallback(callback));

  /// A method that receives values from the cloud storage using the specified keys.
  /// [keys] should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed.
  /// In case of an [error], the [callback] function will be called and the first argument
  /// will contain the error. In case of [success], the first argument will be null
  /// and the values will be passed as the second argument.
  Future<void> getItems(List<String> keys,
      void Function(String? error, [List<String>? values]) callback) {
    return tg.cloudStorage.getItems(keys, tg.JsDynamicCallback(callback));
  }

  /// A method that removes a value from the cloud storage using the specified [key].
  /// [key] should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed.
  /// If an optional [eventHandler] parameter was passed, the callback function will be called.
  /// In case of an [error], the first argument will contain the error. In case of [success],
  /// the first argument will be null and the second argument will be a boolean indicating
  /// whether the value was removed.
  Future<void> removeItem(String key,
          [void Function(String? error, [bool? removed])? callback]) =>
      tg.cloudStorage.removeItem(
          key, callback != null ? tg.JsDynamicCallback(callback) : null);

  /// A method that removes values from the cloud storage using the specified keys.
  /// [keys] should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed.
  /// If an optional [eventHandler] parameter was passed, the [callback] function will be called.
  /// In case of an [error], the first argument will contain the error. In case of [success],
  /// the first argument will be null and the second argument will be a boolean indicating
  /// whether the values were removed.
  Future<void> removeItems(List<String> keys,
          [void Function(String? error, [bool? removed])? callback]) =>
      tg.cloudStorage.removeItems(
          keys, callback != null ? tg.JsDynamicCallback(callback) : null);

  /// A method that receives the list of all keys stored in the cloud storage.
  /// In case of an [error], the [callback] function will be called and the first argument will contain
  /// the error. In case of [success], the first argument will be null and the list of keys will be
  /// passed as the second argument.
  Future<void> getKeys(
          void Function(String? error, [List<String>? keys]) callback) =>
      tg.cloudStorage
          .getKeys(tg.JsDynamicCallback(tg.JsDynamicCallback(callback)));
}
