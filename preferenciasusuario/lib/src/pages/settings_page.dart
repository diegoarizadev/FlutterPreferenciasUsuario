import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_prefs/preferences_user.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName =
      'settings'; //Referecia del routeName para obtener la pagina

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _colorSecundario;
  late int _genero;

//se crea un controller para pre cargar un valor en el textfiled.
  TextEditingController _textController = new TextEditingController();

  final pre = new PreferencesUser(); //Instancia del objeto.

  //Ciclo de vida del StatefulWidget
  @override
  void initState() {
    super.initState();
    pre.setLastPage = SettingsPage.routeName; //Alamacena la pagina visitada
    _genero = pre.getGenero;
    _colorSecundario = pre.getColorSecundario;
    _textController = new TextEditingController(text: pre.getNombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (_colorSecundario) ? Colors.orange : Colors.blue,
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
                pre.setColorSecundario = value;
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
              onChanged: (value) {
                setState(() {
                  pre.setNombre = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _setSelectedRadio(int? value) {
    pre.setGenero = value!;
    _genero = value;
    setState(() {});
  }
}
