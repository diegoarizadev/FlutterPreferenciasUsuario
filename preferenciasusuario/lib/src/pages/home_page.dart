import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String routeName =
      'Home'; //Referecia del routeName para obtener la pagina
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),
      drawer: _createMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario:'),
          Divider(),
          Text('Genero:'),
          Divider(),
          Text('Nombre de usuario:'),
          Divider(),
        ],
      ),
    );
  }

  Drawer _createMenu() {
    return Drawer();
  }
}
