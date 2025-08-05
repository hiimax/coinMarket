/// DevEnv, QAEnv and ProdEnv must implement all these values
abstract interface class EnvFields {
  abstract final String baseUrl;
  abstract final String apiKey;
  abstract final String secretKey;
  abstract final String encryptionKey;
  abstract final String encryptionVector;
  abstract final String socketUrl;
}
