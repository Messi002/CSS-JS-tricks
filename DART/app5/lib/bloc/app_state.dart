// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
abstract class AppState {
  final bool isLoading;
  final AuthError? authError;
  
  const AppState({
    required this.isLoading,
    this.authError,
  });
}

class AppInitial extends AppState {}
