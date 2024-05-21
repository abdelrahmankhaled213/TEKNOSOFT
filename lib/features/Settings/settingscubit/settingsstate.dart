abstract class SettingsState {

}
class InitState extends SettingsState{

}
class ChangeLangState extends SettingsState {

}
class ChangeSwitchState extends SettingsState{

}

class UserLoading extends SettingsState{}
class UserLoaded extends SettingsState{}
class UserError extends SettingsState{
  final String error;
  UserError(this.error);
}
class EditEmailAndPasswordLoading extends SettingsState{}
class EditEmailAndPasswordLoaded extends SettingsState{}
class EditEmailAndPasswordError extends SettingsState{
  final String error;
  EditEmailAndPasswordError(this.error);
}
class EditOrSave extends SettingsState{

}
class ChangeIcon extends SettingsState{
}
