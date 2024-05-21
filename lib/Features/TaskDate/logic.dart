import 'package:flutter/material.dart';
import 'package:to_dolist_app/Features/HomeScreen/Data/model/getTasksData.dart';
import 'package:to_dolist_app/Features/HomeScreen/Presentation/model-view/categorymodel.dart';

CustomCategory? categColors(int index,AsyncSnapshot<List<Task>> snapshot){

  if(snapshot.data![index].category=="Personal"){

    return CustomCategory.customcateglist[0];
  }
  if(snapshot.data![index].category=="Learning"){
    return CustomCategory.customcateglist[1];
  }
  if(snapshot.data![index].category=="Work"){
    return CustomCategory.customcateglist[2];
  }
  if(snapshot.data![index].category=="Shopping"){
    return CustomCategory.customcateglist[3];
  }
}