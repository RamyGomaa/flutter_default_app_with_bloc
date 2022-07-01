part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoadedWithData extends UsersState {
  final List<UserModel> users;
  const UsersLoadedWithData(this.users);

  @override
  List<Object> get props => [users];
}

class UsersLoadedWithNoData extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersError extends UsersState {
  final String error;
  const UsersError(this.error);
  @override
  List<Object> get props => [error];
}
