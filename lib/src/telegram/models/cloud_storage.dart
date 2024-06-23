import 'package:js/js.dart';

/// This object controls the cloud storage. Each bot can store up to 1024 items per user in the cloud storage.
/// More details at [Telegram API](https://core.telegram.org/bots/webapps#cloudstorage)
@JS("CloudStorage")
class CloudStorage {
  /// A method that stores a [value] in the cloud storage using the specified [key].
  /// The [key] should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed.
  /// The [value] should contain 0-4096 characters. You can store up to 1024 keys in the cloud storage.
  /// If an optional [callback] parameter was passed, the [callback] function will be called.
  /// In case of an error, the first argument will contain the error.
  /// In case of success, the first argument will be null and the second argument will be a boolean indicating whether the [value] was stored.
  external Future<void> setItem(String key, String value, [callback]);

  /// A method that receives a value from the cloud storage using the specified [key].
  /// The [key] should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed.
  /// In case of an error, the [callback] function will be called and the first argument will contain the error.
  /// In case of success, the first argument will be null and the value will be passed as the second argument.
  external Future<void> getItem(String key, callback);

  /// A method that receives values from the cloud storage using the specified [keys].
  /// The [keys] should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed.
  /// In case of an error, the [callback] function will be called and the first argument will contain the error.
  /// In case of success, the first argument will be null and the values will be passed as the second argument.
  external Future<void> getItems(List<String> keys, callback);

  /// A method that removes a value from the cloud storage using the specified [key].
  /// The [key] should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed.
  /// If an optional [callback] parameter was passed, the [callback] function will be called.
  /// In case of an error, the first argument will contain the error.
  /// In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was removed.
  external Future<void> removeItem(String key, [callback]);

  /// A method that removes values from the cloud storage using the specified [keys].
  /// The keys should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed.
  /// If an optional [callback] parameter was passed, the [callback] function will be called.
  /// In case of an error, the first argument will contain the error.
  /// In case of success, the first argument will be null and the second argument will be a boolean indicating whether the values were removed.
  external Future<void> removeItems(List<String> keys, [callback]);

  /// A method that receives the list of all keys stored in the cloud storage.
  /// In case of an error, the [callback] function will be called and the first argument will contain the error.
  /// In case of success, the first argument will be null and the list of keys will be passed as the second argument.
  external Future<void> getKeys([callback]);
}
