class ApiPath {
  static final String endpoint = 'http://10.0.2.2:8000';
  static final String loginPath = endpoint + '/auth/login';
  static final Uri insurancePath = Uri.parse('$endpoint/insurance');
}
