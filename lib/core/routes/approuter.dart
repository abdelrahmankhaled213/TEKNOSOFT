import 'package:bmiapp/features/DetailsScreen/views/DetailsScreenView.dart';
import 'package:bmiapp/features/HomeScreen/views/HomeScreenView.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  HomeScreenView(),
    ),
    GoRoute(
      path: '/bmiresult/:result/:Category/:gender/:age/:weight/:height',
      builder: (context, state) =>  DetailsScreenView(
        height: double.parse(state.pathParameters['height']!),
        age: double.parse(state.pathParameters['age']!),
        weight: double.parse(state.pathParameters['weight']!),
        state:  bool.parse(state.pathParameters['gender']!),
      result: double.parse(state.pathParameters['result']!),
        Category: state.pathParameters['Category']!,


      ),
    ),
  ],
);



