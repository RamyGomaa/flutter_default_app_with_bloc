import 'package:counter_app_bloc/features/show%20users/data/models/user.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_api_services.dart';

class UserMainRepository extends UserRepository {
  @override
  Future<List<UserModel>?> fetchUsers() async {
    return await UserApiService.getUsers();
  }
}
