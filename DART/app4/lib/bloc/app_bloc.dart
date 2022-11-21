// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app4/apis/login_api.dart';
import 'package:app4/apis/notes_api.dart';
import 'package:app4/bloc/actions.dart';
import 'package:app4/bloc/app_state.dart';
import 'package:app4/models.dart';
import 'package:bloc/bloc.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocol loginApi;
  final NotesProtocolApi noteApi;

  AppBloc({
    required this.loginApi,
    required this.noteApi,
  }) : super(const AppState.empty()) {
    on<LoginAction>(
      (event, emit) async {
        //start loading
        emit(const AppState(isLoading: true));

        //login user in
        final loginHandle =
            await loginApi.login(email: event.email, password: event.password);

        emit(
          AppState(
            isLoading: false,
            loginError: loginHandle == null ? LoginErrors.invalidHandle : null,
            loginHandle: loginHandle,
            fetchNotes: null,
          ),
        );
      },
    );
    //next action here....
    on<LoadNotesAction>((event, emit) async {
      emit(AppState(isLoading: true, loginHandle: state.loginHandle));
      //get the login handle....
      final loginHandle = state.loginHandle;
      if (loginHandle != const LoginHandle.fooBar()) {
        emit(
          AppState(
            isLoading: false,
            loginError: LoginErrors.invalidHandle,
            loginHandle: state.loginHandle,
          ),
        );
        return;
      }
      //we have a valid login handle and want to fetch notes...
      final notes = await noteApi.getNotes(loginHandle: loginHandle!);
    });
  }
}
