class ApiPath {
  static final String endpoint = 'http://10.0.2.2:8000';
  static final Uri insurancePath = Uri.parse('$endpoint/insurance');
  static final Uri loginPath = Uri.parse(endpoint + '/auth/login');
}
