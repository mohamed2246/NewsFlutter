
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/NewsApp/dioHelper.dart';

import '../BusinnesScreen.dart';
import '../ScienceScreen.dart';
import '../SettingsScreen.dart';
import '../sportsScreen.dart';
import 'NewsStates.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> botttomNavBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [
    BussinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<dynamic> business = [];

  void getBussiness() {
    emit(NewsLoadingBussinesState());
    dioHelper.getData('v2/top-headlines', {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'e5cf6af3e9e640f393de82a8a07da6aa',
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsgetBusinessNewsSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsgetBussinesErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScince() {
    emit(NewsLoadingScienceState());
    dioHelper.getData('v2/top-headlines', {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'e5cf6af3e9e640f393de82a8a07da6aa',
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsgetScienceNewsSucessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsgetScienceErrorState(error.toString()));
    });
  }



  List<dynamic> sports = [];

  void getSports() {
    emit(NewsLoadingSportsState());
    dioHelper.getData('v2/top-headlines', {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'e5cf6af3e9e640f393de82a8a07da6aa',
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsgetSportsNewsSucessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsgetSportsErrorState(error.toString()));
    });
  }




  changeButtomNav(index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }
}
