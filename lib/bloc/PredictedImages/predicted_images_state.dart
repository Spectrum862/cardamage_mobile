import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

enum PredictedImagesStatus { loading, error, success, init }

class PredictedImagesState extends Equatable {
  final PredictedImagesStatus status;
  final List<Uint8List> predictedImage;

  PredictedImagesState(
      {this.status = PredictedImagesStatus.init, this.predictedImage});

  PredictedImagesState copyWith(
      {PredictedImagesStatus status, List<Uint8List> predictedImage}) {
    return PredictedImagesState(
        status: status ?? this.status,
        predictedImage: predictedImage ?? this.predictedImage);
  }

  @override
  List<Object> get props => [status, predictedImage];
}
