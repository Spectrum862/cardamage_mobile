import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cardamage_detect/bloc/PredictedImages/predicted_images_state.dart';
import 'package:cardamage_detect/constants/api_path.dart';
import 'package:cardamage_detect/models/predict_image.dart';
import 'package:images_picker/images_picker.dart';
import 'package:http/http.dart' as http;

class PredictedImagesCubit extends Cubit<PredictedImagesState> {
  final http.Client httpClient = http.Client();

  PredictedImagesCubit() : super(PredictedImagesState());

  void predictImage(List<Media> media) async {
    emit(state.copyWith(status: PredictedImagesStatus.loading));
    List<String> base64Images = [];
    List<Uint8List> predictedImages = [];
    Uri url = Uri.parse('${ApiPath.endpoint}model/predict');
    try {
      for (var item in media) base64Images.add(fileToBase64(item.path));
      var res = await httpClient.post(url,
          body: jsonEncode(<String, List<String>>{
            'images': base64Images,
          }));

      if (res.statusCode == 200) {
        PredictImageResponseBody responseBody =
            PredictImageResponseBody.fromJson(jsonDecode(res.body));
        for (var base64image in responseBody.result) {
          Uint8List image = base64Decode(base64image);
          predictedImages.add(image);
        }
        emit(state.copyWith(
            status: PredictedImagesStatus.success,
            predictedImage: predictedImages));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PredictedImagesStatus.error));
    }
  }

  void clearState() async {
    emit(PredictedImagesState());
  }

  fileToBase64(String path) {
    final bytes = File(path).readAsBytesSync();
    return base64Encode(bytes);
  }
}
