import 'package:coin_market/core/api/api_helper.dart';
import 'package:coin_market/features/auth/repository/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._apiHandler);

  final ApiHandler _apiHandler;
}
