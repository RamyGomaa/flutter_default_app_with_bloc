import 'package:bloc/bloc.dart';
import 'package:counter_app_bloc/features/show%20users/data/repositories/users_main_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  List<UserModel>? users = [];
  UsersBloc() : super(UsersInitial()) {
    on<UsersEvent>(
      (event, emit) async {
        emit(UsersLoading());
        if (event is GetUsers) {
          await getUsers(emit);
        }
        if (event is DeleteUser) {
          await deleteUser(emit, event.id);
        }
      },
    );
  }

  Future<void> getUsers(Emitter<UsersState> emit) async {
    if (users != null && users!.isNotEmpty) {
      emit(UsersLoadedWithData(users!));
      return;
    }
    users = await UserMainRepository().fetchUsers();
    if (users == null) {
      emit(const UsersError("Error, Are you connected to the Internet?"));
    } else if (users!.isEmpty) {
      emit(UsersLoadedWithNoData());
    } else if (users!.isNotEmpty) {
      emit(UsersLoadedWithData(users!));
    }
  }

  deleteUser(Emitter<UsersState> emit, int id) {
    users!.removeWhere((element) => element.id == id);
    emit(UsersLoadedWithData(users!));
  }
}
