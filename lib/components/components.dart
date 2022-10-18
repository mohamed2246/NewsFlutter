
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/NewsApp/Cubit/NewsStates.dart';

import '../NewsApp/Cubit/NewsCubit.dart';






Widget BuildArtical (artical){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(

                image: NetworkImage('${artical['urlToImage']}' ),fit: BoxFit.cover ,),

          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            height: 120,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text('${artical['title']}' , style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text('${artical['publishedAt']}' , style: TextStyle(
                    color: Colors.grey,

                    fontWeight: FontWeight.bold,
                  ),

                  ),
                ),
              ],
            ),
          ),
        ),


      ],
    ),
  );
}

Widget articalBuilder( int index)=>BlocConsumer<NewsCubit, NewsStates>(
  listener: (BuildContext context, state) {},
  builder: (BuildContext context, state) {
    var list=[];
    if(index == 0 ){
       list = NewsCubit.get(context).business;
    }else if(index == 1){
       list = NewsCubit.get(context).sports;
    }else if(index == 2){
       list = NewsCubit.get(context).science;
    }

    if (list.length>0) {
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return BuildArtical(list[index]);
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemCount: 10);
    } else {
      return Center(child: CircularProgressIndicator());
    }
  },
);