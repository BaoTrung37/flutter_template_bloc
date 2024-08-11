import 'package:example_flutter_app/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser();
}
