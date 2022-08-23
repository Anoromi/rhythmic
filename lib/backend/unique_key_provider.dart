import 'package:shared_preferences/shared_preferences.dart';

class UniqueKeyProvider {
  int _current;
  UniqueKeyProvider(SharedPreferences preferences)
      : _current = preferences.getInt("uniqueKeyProvider") ?? 0;
  EntityKey get next => EntityKey(_current++);
  UniqueEntity<T> create<T>(T value) => UniqueEntity(next, value);
}

class EntityKey {
  final int key;
  EntityKey(this.key);
}

class UniqueEntity<T> {
  final EntityKey key;
  T value;
  UniqueEntity(this.key, this.value);
}
