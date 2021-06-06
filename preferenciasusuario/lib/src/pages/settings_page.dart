import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static final String routeName =
      'settings'; //Referecia del routeName para obtener la pagina
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
        ),
        body: Center(
          child: Text('Ajustes page'),
        ));
  }
}
