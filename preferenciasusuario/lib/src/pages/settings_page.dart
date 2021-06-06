import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

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

  //Ciclo de vida del StatefulWidget
  @override
  void initState() {
    // TODO: implement initState
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
            value: true,
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
            onChanged: (value) {
              setState(() {
                _genero = value
                    as int; //Se castea la vvariable value a int ya que es un object
              });
            },
            title: Text('Masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: (value) {
              setState(() {
                _genero = value
                    as int; //Se castea la vvariable value a int ya que es un object
              });
            },
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
}
