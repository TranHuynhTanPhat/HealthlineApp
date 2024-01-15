
import 'package:healthline/domain/model/auth_model.dart';

import '../../data/api/response/auth_response.dart';

class AuthTranslator {
  static AuthModel toAuthModel({required AuthResponse response}) {
    return AuthModel(
      id: response.id, jwtToken: response.jwtToken);
  }
}
