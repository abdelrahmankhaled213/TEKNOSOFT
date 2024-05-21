abstract class LoginState{

}
class ForgotPasswordLoadingState extends LoginState{

}
class ForgotPasswordLoadedState extends LoginState{

}
class ForgotPasswordFaliureState extends LoginState{
String faliuremsg;
ForgotPasswordFaliureState({
  required this.faliuremsg
});
}
class InitialStateLoginState extends LoginState{

}

class LoadingLogin extends LoginState{

}
class LoadedLogin extends LoginState{

}
class FaliureLogin extends LoginState{
String faliuremsg;
FaliureLogin({
  required this.faliuremsg
});
}
class ChangeLoginIconState extends LoginState{

}
