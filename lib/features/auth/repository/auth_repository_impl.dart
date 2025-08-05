import 'package:prodev/core/api/api_helper.dart';
import 'package:prodev/features/auth/repository/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._apiHandler);

  final ApiHandler _apiHandler;
}
