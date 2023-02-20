// ignore_for_file:must_be_immutable

part of 'user_list_cubit.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {
  final bool isLoadaing;

  const UserListLoading(this.isLoadaing);
}

class UserListCompleted extends UserListState {
  UserListModel? userListModel;
  UserListCompleted({this.userListModel});
}

class UserListError extends UserListState {}
