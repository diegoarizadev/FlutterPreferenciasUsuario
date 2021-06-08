import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_prefs/preferences_user.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName =
      'Home'; //Referecia del routeName para obtener la pagina

  final pre = new PreferencesUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (pre.getColorSecundario) ? Colors.orange : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${pre.getColorSecundario}'),
          Divider(),
          Text('Genero: ${pre.getGenero}'),
          Divider(),
          Text('Nombre de usuario: ${pre.getNombre}'),
          Divider(),
        ],
      ),
    );
  }
}
