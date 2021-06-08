import 'package:cardamage_detect/bloc/Insurance/insurance_cubit.dart';
import 'package:cardamage_detect/models/insurance.dart';
import 'package:cardamage_detect/view/Predict/predict.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredictPage extends StatefulWidget {
  final Insurance insurance;
  PredictPage({this.insurance});

  @override
  PredictPageState createState() => PredictPageState();
}
