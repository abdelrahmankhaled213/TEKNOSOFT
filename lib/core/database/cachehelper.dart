import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedPref;
  intializeSharedPref()async{
    sharedPref=await SharedPreferences.getInstance();
  }
 setData({required String key,required dynamic value})async{
    if(value is int)
      return await sharedPref.setInt(key, value);
    if(value is bool)
      return await sharedPref.setBool(key, value);
    if(value is double)
      return await sharedPref.setDouble(key, value);
    if(value is String){
      return await sharedPref.setString(key, value);
    }
  }
  dynamic getData({required String key}){
   return  sharedPref.get(key);
  }
  // Future<void> setBoolean(bool state)async{
  //   await sharedPref.setBool("state", state);
  // }
  // Future<bool?> getBoolean() async{
  //   return Future.value( sharedPref.getBool("state"));
  // }
  // Future<bool>clearData()async{
  //   return await sharedPref.clear();
  // }
}