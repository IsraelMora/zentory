import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'APPWRITE_PROJECT_ID')
  static final String appwriteProjectId = _Env.appwriteProjectId;

  @EnviedField(varName: 'APPWRITE_ENDPOINT')
  static final String appwriteEndpoint = _Env.appwriteEndpoint;
}
