import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void makeLandOrPort(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}
void firebaseOptions()async{
  Platform.isAndroid?await Firebase.initializeApp(
      options:
      const FirebaseOptions(apiKey: "AIzaSyCjeTXWGeA04teWPYD-5JoKJZ2tf6SInz8",
          appId: "1:212221207991:android:84728c8099285acd7d3432",
          messagingSenderId: "212221207991",
          projectId: "stylish-5cd17")
  ):await Firebase.initializeApp();
}