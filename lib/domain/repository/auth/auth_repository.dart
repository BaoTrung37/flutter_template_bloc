abstract class AuthRepository {
  Future<void> login(String email, String password);
}
