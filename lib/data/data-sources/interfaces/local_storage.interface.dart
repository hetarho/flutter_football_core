abstract class LocalStorage {
  Future<int> getNextId(String key);
  Future<int> create<T>({required String key, required int id, required T value});
  Future<T> read<T>({required String key, required int id});
  Future<void> update<T>({required String key, required int id, required T value});
  Future<void> delete({required String key, required int id});
  Future<List<T>> readAll<T>({required String key});
}
