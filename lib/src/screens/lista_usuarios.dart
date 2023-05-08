import 'package:flutter/material.dart';
import 'package:usuarios/src/screens/informacion_usuario.dart';

import '../db/obtener_datos.dart';

class ListaUsuarios extends StatefulWidget {
  const ListaUsuarios({super.key});

  
  @override
  State<ListaUsuarios> createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  List<Map<String, dynamic>> _datos = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDatosCliente();
  }
    _getDatosCliente() async {
    List<Map<String, dynamic>> datos = await getDataFromTable('usuarios');
    setState(() {
      _datos = datos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Usuarios',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xffc437ff),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _datos.length,
              itemBuilder: (context, index) {
                final usuario = _datos[index];
                return Card(
                  color: Color(0xffc437ff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              InformacionUsuario(usuario: _datos[index], index:index,),
                        ),
                      );
                     },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (_datos[index]['genero'] == 'Hombre')
                            const Icon(Icons.male,
                                color: Colors.blue, size: 50),
                          if (_datos[index]['genero'] == 'Mujer')
                            const Icon(Icons.female,
                                color: Colors.pink, size: 50),
                          const SizedBox(height: 8.0),
                          Text(
                            _datos[index]['nombre'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
