abstract class AuthState{

}
class InitialState extends AuthState{

}

class LoadingState extends AuthState{

}
class LoadedState extends AuthState{

}
class FaliureState extends AuthState{
String faliureMsg;
  FaliureState({
  required this.faliureMsg
});
}
class ChangeIconState extends AuthState{
}
class ChangeIconConfirmPasswordState extends AuthState{

}
class GoogleSignUpSuccess extends AuthState{

}
class GoogleSigUpFailed extends AuthState{

}