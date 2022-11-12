// part of 'authentication_bloc.dart';

// class AuthenticationState extends Equatable {
//   const AuthenticationState._({
//     this.status = AuthenticationStatus.unknown,
//     this.user = UserModel.empty,
//   });

//   final UserModel user;
//   final AuthenticationStatus status;

//   const AuthenticationState.unknown() : this._();

//   const AuthenticationState.authenticated(UserModel user)
//       : this._(status: AuthenticationStatus.authenticated, user: user);

//   const AuthenticationState.unauthenticated()
//       : this._(status: AuthenticationStatus.unauthenticated);

//   @override
//   List<Object> get props => [status, user];
// }

// // class AuthenticationInitial extends AuthenticationState {}
