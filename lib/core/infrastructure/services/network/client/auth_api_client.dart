import 'package:dio/dio.dart';
import 'package:example_flutter_app/data/dto/auth/auth.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String? baseUrl}) = _AuthApiClient;

  @POST('/api/login')
  Future<SignInResponse> emailSignIn(
    @Body() SignInRequest request,
  );

  @POST('/api/register')
  Future<SignUpResponse> emailSignUp(
    @Body() SignUpRequest request,
  );
}
