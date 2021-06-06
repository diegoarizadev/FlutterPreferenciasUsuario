import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/pages/settings_page.dart';

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
      drawer: _createMenu(context),
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

  Drawer _createMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.pages,
              color: Colors.blue,
            ),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(
                context,
                HomePage
                    .routeName), //pushReplacementNamed Para cambiar la raiz y el stack se reinicia
          ),
          ListTile(
            leading: Icon(
              Icons.party_mode,
              color: Colors.blue,
            ),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(
                    context); //Cierra el menu, para ir a la pagina de Settings.
                Navigator.pushReplacementNamed(
                    context,
                    SettingsPage
                        .routeName); //pushReplacementNamed Para cambiar la raiz y el stack se reinicia
              }),
        ],
      ),
    );
  }
}
