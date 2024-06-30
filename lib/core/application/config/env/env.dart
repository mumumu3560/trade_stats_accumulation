import "package:envied/envied.dart";

part "env.g.dart";

@Envied(path: 'lib/env/.env')
abstract class Env {



  @EnviedField(varName: 'LIST_BANNER', obfuscate: true)
  static String b1 = _Env.b1;

  @EnviedField(varName: 'ADD_BANNER', obfuscate: true)
  static String b2 = _Env.b2;

  @EnviedField(varName: 'EDIT_BANNER', obfuscate: true)
  static String b3 = _Env.b3;


  @EnviedField(varName: 'TAG_BANNER', obfuscate: true)
  static String b4 = _Env.b4;


  @EnviedField(varName: 'IMPORT_BANNER', obfuscate: true)
  static String b5 = _Env.b5;

  @EnviedField(varName: 'SETTING_BANNER', obfuscate: true)
  static String b6 = _Env.b6;

  @EnviedField(varName: 'NATIVE_ADS', obfuscate: true)
  static String n1 = _Env.n1;







  @EnviedField(varName: 'CHANGE_INTERSTITIAL', obfuscate: true)
  static String i1 = _Env.i1;



}