part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable{
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure()
  });
}

// class LoginInitial extends LoginState {}
