import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/database/cachehelper.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/features/Settings/UserModel/usermodel.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SettingsCubit extends Cubit<SettingsState>{
  SettingsCubit():super(InitState());
var switchstate=false;

  changeLang(){
   emit(ChangeLangState());
  }
  changeState(bool value)async{
    switchstate=value;
   await getitinstance<CacheHelper>().setData(key: "mode", value: switchstate);
    emit(ChangeSwitchState());
  }

  final collection= FirebaseFirestore.instance.collection('Users');
  bool changeiconstate=true;
  bool editandsave=false;
  Future<List<UserModel>>getUser()async{
    var userlist=<UserModel>[];
    UserModel userModel;
    try {
      emit(UserLoading());
      await collection.where("email",
          isEqualTo: FirebaseAuth.instance.currentUser!.email).get().then((value) {
        value.docs.forEach((element) {
          userModel = UserModel.fromJson(element.data());
          userModel.id = element.id;
          userlist.add(userModel);
        });
      }
      );
      emit(UserLoaded());
      return Future.value(userlist);
    }
    catch(e){
      emit(UserError(e.toString()));
      return [];
    }
  }
  bool changeIcon(){
    changeiconstate=!changeiconstate;
    emit(ChangeIcon());
    return changeiconstate;
  }
  editEmailAndPassword({
    required String email,required String password,required String id})async {
    {
      try {
        emit(EditEmailAndPasswordLoading());
        await collection.doc(id).update({
          "email":email,
          "password":password,
        });

        emit(EditEmailAndPasswordLoaded());
      } catch (e) {
        emit(EditEmailAndPasswordError(e.toString()));
      }
    }
  }
  editOrSave(){
    editandsave=!editandsave;
    emit(EditOrSave());
    return editandsave;
  }
}