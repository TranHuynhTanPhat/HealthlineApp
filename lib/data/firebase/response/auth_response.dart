class AuthResponse {
  String? localId;
  String? email;
  String? displayName;
  String? accessToken;
  bool? registered;
  String? refreshToken;
  AuthResponse({
    this.localId,
    this.email,
    this.displayName,
    this.accessToken,
    this.refreshToken,
  });
}
