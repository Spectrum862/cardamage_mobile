import 'package:equatable/equatable.dart';

class PredictImage extends Equatable {
  final List<String> result;

  PredictImage({this.result});

  @override
  List<Object> get props => [result];
}

class PredictImageResponseBody {
  final List<String> result;
  PredictImageResponseBody({this.result});

  factory PredictImageResponseBody.fromJson(Map<String, dynamic> json) {
    final listTemp =
        (json['result'] as List)?.map((item) => item as String)?.toList();

    return PredictImageResponseBody(result: listTemp);
  }
}
