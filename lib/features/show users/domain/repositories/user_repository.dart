import '../../data/models/user.dart';

abstract class UserRepository {
  Future<List<UserModel>?> fetchUsers();
}
