abstract class Usecase<T, P> {
  Future<T> execute(P params);
}

abstract class UsecaseNoParams<T> {
  Future<T> execute();
}
