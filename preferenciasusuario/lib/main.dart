import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:preferenciasusuario/src/pages/settings_page.dart';
import 'package:preferenciasusuario/src/share_prefs/preferences_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Al ser un singleton, tenemos la posibilidad de invocar los metodos en cualquier parte y se implementan en el main, para cargarlos lo mas optimo posible.
  final per = new PreferencesUser();
  per.iniPrefs(); //Se tiene las preferencias cargas en este momento.

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late var per = new PreferencesUser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias de usuario',
      initialRoute: per.getLastPage, //HomePage.routeName, //Nombre de la ruta
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
