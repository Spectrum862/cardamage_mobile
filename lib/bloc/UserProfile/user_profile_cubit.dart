import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cardamage_detect/constants/StorageKey.dart';
import 'package:cardamage_detect/constants/api_path.dart';
import 'package:cardamage_detect/utils/StorageManager.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final http.Client _httpClient = http.Client();

  UserProfileCubit() : super(UserProfileInitial()) {
    StorageManager.readData(StorageKey.accessToken)
        .then((value) => {loadFormSharePref(value)});
  }

  void loadFormSharePref(accessToken) {
    if (accessToken != null) {
      Map<String, dynamic> jwtBody = JwtDecoder.decode(accessToken);
      emit(UserProfileSigned(name: jwtBody['username'], token: accessToken));
    } else {
      emit(UserProfileUnSigned());
    }
  }

  void logout() {
    emit(UserProfileUnSigned());
    StorageManager.deleteData(StorageKey.accessToken);
  }

  Future<void> login({String username, String password}) async {
    emit(UserProfileLoading());
    Map<String, dynamic> resBody = {'username': username, 'password': password};
    try {
      if (username != null && password != null) {
        final res = await _httpClient.post(ApiPath.loginPath, body: resBody);
        if (res.statusCode == 200) {
          final body = jsonDecode(res.body);
          Map<String, dynamic> jwtBody =
              JwtDecoder.decode(body['access_token']);
          emit(UserProfileSigned(
              name: jwtBody['username'], token: body['access_token']));
          StorageManager.saveData(StorageKey.accessToken, body['access_token']);
        } else {
          throw (res.body);
        }
      }
    } catch (e) {
      emit(UserProfileError(errorMassage: 'error'));
      print(e);
    }
  }
}
