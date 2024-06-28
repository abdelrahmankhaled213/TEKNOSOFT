abstract class NetworkingState {}
 class NetworkingInitial extends NetworkingState {}
class OfflineState extends NetworkingState{
 final String msg;
 OfflineState({
  required this.msg
 });
}
class OnlineState extends NetworkingState{
final String msg;
OnlineState({
 required this.msg
});
}