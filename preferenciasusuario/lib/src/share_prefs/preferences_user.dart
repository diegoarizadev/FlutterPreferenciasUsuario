import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class PreferencesUser {
  //Begin PATRON SINGLETON
  static final PreferencesUser _instance = new PreferencesUser._internal();
  //Constructor
  factory PreferencesUser() {
    return _instance;
  }

  PreferencesUser._internal();
  //End PATRON SINGLETON

  late SharedPreferences
      _per; //Late es una palabra clave en Dart 2.12 con el objectivo de permitir campos nulos que no tienen que inicializarse inmediatamente.

  //ninguna de estas propiedad se usa.
  // bool _colorSecundario = false;
  // int _genero = 0;
  // String _nombre = '';

  iniPrefs() async {
    WidgetsFlutterBinding.ensureInitialized();
    this._per = await SharedPreferences
        .getInstance(); //Instancia para acceder al bloque de memoria donde se almacenara la información.
  }

  int get getGenero {
    return _per.getInt('genero') ?? 1; //Si es null, retorne 1
  }

  set setGenero(int value) {
    _per.setInt('genero', value);
  }

  // get getColorSecundario(String value){
  //   return  ;
  // }
}
