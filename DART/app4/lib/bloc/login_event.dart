part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{
const LoginEvent();

@override
List<Object> get props => [];

}

class LoginUsernameChanged extends LoginEvent{
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

cla