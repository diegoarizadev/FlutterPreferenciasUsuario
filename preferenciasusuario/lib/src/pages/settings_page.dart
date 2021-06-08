import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_prefs/preferences_user.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName =
      'settings'; //Referecia del routeName para obtener la pagina
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Diego A.';

//se crea un controller para pre cargar un valor en el textfiled.
  TextEditingController _textController = new TextEditingController();

  final pre = new PreferencesUser();

  //Ciclo de vida del StatefulWidget
  @override
  void initState() {
    super.initState();
    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color Secundario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Femenino'),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
              controller: _textController, //Se asigna el controlador
              decoration: InputDecoration(
                labelText: 'Nombre:',
                helperText: 'Escribe tu nombre',
              ),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  void _setSelectedRadio(int? value) async {
    SharedPreferences per = await SharedPreferences
        .getInstance(); //Instancia para acceder al bloque de memoria donde se almacenara la información.

    //Persistir(grabar) información
    await per.setInt(
        'genero', //Llave para acceder a la información
        value!); //Valor almacenado

    _genero = value;
    setState(() {});
  }
}
