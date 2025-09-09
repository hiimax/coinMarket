// lib/env/env.dart

import 'package:envied/envied.dart';
import 'package:coin_market/env/env.dart';
import 'package:coin_market/env/env_fields.dart';

part 'production.g.dart';

@Envied(path: 'assets/env/production.env', name: 'Env', obfuscate: true)
final class ProdEnv implements Env, EnvFields {
  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _Env.baseUrl;

  @override
  @EnviedField(varName: 'API_KEY')
  final String apiKey = _Env.apiKey;

  @override
  @EnviedField(varName: 'SECRET_KEY')
  final String secretKey = _Env.secretKey;

  @override
  @EnviedField(varName: 'ENCRYPTION_KEY')
  final String encryptionKey = _Env.encryptionKey;

  @override
  @EnviedField(varName: 'ENCRYPTION_VECTOR')
  final String encryptionVector = _Env.encryptionVector;

  @override
  @EnviedField(varName: 'SOCKET_BASE_URL')
  final String socketUrl = _Env.socketUrl;

  @override
  @EnviedField(varName: 'CMC_API_KEY')
  final String cmcApiKey = _Env.cmcApiKey;

  @override
  @EnviedField(varName: 'CMC_BASE_URL')
  final String cmcBaseUrl = _Env.cmcBaseUrl;
}
