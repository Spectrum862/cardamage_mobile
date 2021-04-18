class ApiPath {
  static final ApiPath _singleton = ApiPath._internal();
  static final String endpoint = 'https://localhost:3050/';
  static final String loginPath = endpoint + 'auth/login';

  factory ApiPath() {
    return _singleton;
  }

  ApiPath._internal();
}
