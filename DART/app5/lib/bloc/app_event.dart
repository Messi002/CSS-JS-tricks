// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

//we are implementing not extending because there's actually
//nothing to extend
@immutable
class AppEventUploadImage implements AppEvent {
  final String filePathToUpload;
  
  const AppEventUploadImage({
    required this.filePathToUpload,
  });
  
}
