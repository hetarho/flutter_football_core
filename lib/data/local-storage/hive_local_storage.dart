import 'package:flutter_football_core/data/data-sources/interfaces/local_storage.interface.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveLocalStorage implements LocalStorage {
  Box _getBox(String key) {
    return Hive.box(key);
  }

  Box<int> _getLastIdBox(String key) {
    return Hive.box<int>('${key}_last_id');
  }

  int _getLastId(String key) {
    final lastIdBox = _getLastIdBox(key);
    final lastId = lastIdBox.get('last_id', defaultValue: 0);
    return lastId ?? 0;
  }

  @override
  Future<int> create<T>({required String key, required T value}) async {
    final lastId = _getLastId(key);
    final id = lastId + 1;
    _getBox(key).put(id, value);
    _getLastIdBox(key).put('last_id', id);
    return id;
  }

  @override
  Future<void> delete({required String key, required int id}) async {
    _getBox(key).delete(id);
  }

  @override
  Future<T> read<T>({required String key, required int id}) async {
    return _getBox(key).get(id);
  }

  @override
  Future<void> update<T>({required String key, required int id, required T value}) async {
    _getBox(key).put(id, value);
  }

  @override
  Future<List<T>> readAll<T>({required String key}) async {
    return _getBox(key).values.cast<T>().toList();
  }
}
