class LoadingScreen {
  //creating a singleton
  const LoadingScreen._sharedInstance();
  static late final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen.instance() => _shared;
}
