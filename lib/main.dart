import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/NewsApp/NewsScreen.dart';
import 'package:untitled/NewsApp/dioHelper.dart';

import 'NewsApp/Cubit/CubicObserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  dioHelper.intia();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:NewsScreen() ,
    );
  }
}

