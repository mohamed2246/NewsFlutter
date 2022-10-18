
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/NewsCubit.dart';
import 'Cubit/NewsStates.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBussiness()..getScince()..getSports(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            NewsCubit cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'News App',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(icon: Icon(Icons.search), onPressed: () {})
                ],
              ),

              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                items: cubit.botttomNavBarItems,
                onTap: (index) {
                  cubit.changeButtomNav(index);
                },
              ),
            );
          }),
    );
  }
}
