part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUsers extends UsersEvent {}

class DeleteUser extends UsersEvent {
  final int id;
  const DeleteUser(this.id);

  @override
  List<Object> get props => [id];
}
