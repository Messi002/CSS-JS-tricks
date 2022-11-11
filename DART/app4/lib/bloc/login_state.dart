part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable{
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure()
  });

  final FormzStatus status;
  final UserModel username;
  final Password password;

  LoginState copyWith({
    FormzStatus? status,
    UserModel? username,
    Password? password
  }){

return LoginState(
  status : status ?? this.status,
  username : username ?? this.username,
  password : password ?? this.password,
);


  }

  @override
  List<Object> get props => [status, username, password];
}

// class LoginInitial extends LoginState {}
