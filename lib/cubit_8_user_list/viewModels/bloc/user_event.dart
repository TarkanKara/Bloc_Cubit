part of 'user_bloc.dart';

@immutable
class LoadPersonEvent {
  final UserURL url;
  final PersonLoader onLoader;

  const LoadPersonEvent({
    required this.onLoader,
    required this.url,
  });
}
