import 'dart:io';

import 'package:cardamage_detect/bloc/PredictedImages/predicted_images_cubit.dart';
import 'package:cardamage_detect/theme/DesignToken.dart';
import 'package:cardamage_detect/view/home/home.dart';
import 'package:cardamage_detect/widgets/GradientButton.dart';
import 'package:cardamage_detect/widgets/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
import 'package:provider/provider.dart';

class HomePageState extends State<HomePage> {
  final picker = ImagePicker();
  List<Media> _image;

  Future getImage() async {
    final res = await ImagesPicker.pick(
      count: 5,
      pickType: PickType.image,
    );
    setState(() {
      if (res != null) {
        _image = res;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final predictProvider = Provider.of<PredictedImagesCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 16, left: 24, right: 24),
          child: Column(
            children: [
              Navbar(),
              SizedBox(
                height: 16,
              ),
              GradientButton(label: 'getImage', onPress: () => getImage()),
              SizedBox(
                height: 16,
              ),
              Container(
                child: _image != null
                    ? Column(
                        children: [
                          Container(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (var media in _image)
                                  Container(
                                      padding: EdgeInsets.only(
                                          right: media == _image.last ? 0 : 8),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(baseRadius),
                                        child: Image.file(File(media.path)),
                                      ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GradientButton(
                            label: 'Predict',
                            onPress: () => predictProvider.predictImage(_image),
                          )
                        ],
                      )
                    : null,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: predictProvider.state.predictedImage != null
                    ? Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var image
                                in predictProvider.state.predictedImage)
                              Container(
                                padding: EdgeInsets.only(
                                    right: image ==
                                            predictProvider
                                                .state.predictedImage.last
                                        ? 0
                                        : 8),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(baseRadius),
                                  child: Image.memory(
                                    image,
                                  ),
                                ),
                              )
                          ],
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
