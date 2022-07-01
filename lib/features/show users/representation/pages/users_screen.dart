import 'package:counter_app_bloc/features/show%20users/representation/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void didChangeDependencies() {
    var userBloc = BlocProvider.of<UsersBloc>(context);
    userBloc.add(GetUsers());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<UsersBloc, UsersState>(
          listener: (context, state) {
            if (state is UsersError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is UsersLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UsersLoadedWithData) {
                var users = state.users;
                return ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text("${users[index].name}"),
                    onTap: () {
                      deleteUser(users[index].id!);
                    },
                  ),
                  itemCount: users.length,
                );
              }

              return const Center(
                child: Icon(Icons.hourglass_empty),
              );
            },
          ),
        ),
      ),
    );
  }

  void deleteUser(int id) {
    var userBloc = BlocProvider.of<UsersBloc>(context);
    userBloc.add(DeleteUser(id));
  }
}
