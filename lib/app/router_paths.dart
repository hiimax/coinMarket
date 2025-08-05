import 'package:go_router_paths/go_router_paths.dart';

class AppPath {
  static final splash = SplashPath();
  static final auth = AuthPath();
  static final home = HomePath();
  static final music = MusicPath();
  static final heart = HeartPath();
  static final map = MapPath();
}

class SplashPath extends Path<SplashPath> {
  SplashPath() : super('/');

  Path get welcomeScreen => Path('welcome-screen', parent: this);
}

class AuthPath extends Path<AuthPath> {
  AuthPath() : super('/auth');

 
}

class HomePath extends Path<HomePath> {
  HomePath() : super('/home');
  
}

class MusicPath extends Path<MusicPath> {
  MusicPath() : super('/music');


  
}

class HeartPath extends Path<HeartPath> {
  HeartPath() : super('/heart');
 
}

class MapPath extends Path<MapPath> {
  MapPath() : super('/map');
 
}

