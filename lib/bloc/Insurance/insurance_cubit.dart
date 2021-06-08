import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cardamage_detect/constants/api_path.dart';
import 'package:cardamage_detect/models/insurance.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part './insurance_state.dart';

class InsuranceCubit extends Cubit<InsuranceState> {
  final http.Client httpClient = http.Client();
  InsuranceCubit() : super(InsuranceInitial()) {
    loadData();
  }

  Future loadData() async {
    emit(InsuranceLoading());
    try {
      final res = await httpClient.get(ApiPath.insurancePath);
      if (res.statusCode == 200 && res.body != null) {
        Map<String, Insurance> listTemp = {};
        jsonDecode(res.body).forEach(
            (key, value) => {listTemp[key] = Insurance.fromJson(value)});
        print(listTemp);
        emit(InsuranceLoaded(insurance: listTemp));
      }
    } catch (e) {
      emit(InsuranceError(message: e));
    }
  }
}
