import 'package:healthline/data/firebase/response/auth_response.dart';
import 'package:healthline/domain/model/auth_model.dart';

class AuthTranslator {
  static AuthModel toAuthModel({required AuthResponse response}) {
    return AuthModel(
        localId: response.localId,
        email: response.email,
        displayName: response.displayName,
        accessToken: response.accessToken,
        refreshToken: response.refreshToken);
  }
}
