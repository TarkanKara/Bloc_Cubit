part of 'user_bloc.dart';

@immutable
class FetchResultState {
  final Iterable<User> users;
  final bool isCache;

  const FetchResultState({
    this.isCache = false,
    this.users = const [],
  });

  @override
  bool operator ==(covariant FetchResultState other) {
    return users.isEqualOrIgnoring(other.users) && isCache == other.isCache;
  }

  @override
  int get hashCode => Object.hash(users, isCache);
}
