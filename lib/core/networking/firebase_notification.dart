import 'package:firebase_messaging/firebase_messaging.dart';
class FireBaseNotification{
final instance=FirebaseMessaging.instance;
Future<void>initNotifications()async{
  await instance.requestPermission();
  var token=await instance.getToken();
  print(token);
}
}