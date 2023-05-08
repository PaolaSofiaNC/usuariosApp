import 'package:flutter/material.dart';

import '../witgets/widget-usuario.dart';

class InformacionUsuario extends StatelessWidget {
  final Map<String, dynamic> usuario; 
  final int index;

  const InformacionUsuario({Key? key, required this.usuario, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Informacion',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xffc437ff),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Fondo-lluvia.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
      opacity: 0.8,
      child: Container(
        color: Colors.black,
            height: 511,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.topCenter,

                child: const Icon(Icons.person,
                color: Colors.white, 
                size: 40),
              ),
              const SizedBox(height: 20),
                Text(
                  'Nombre: ${usuario['nombre']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                 Text(
                  'Correo: ${usuario['correo']} ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Edad: ${usuario['edad']} ',
                  style:const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                 Text(
                  'Telefono: ${usuario['telefono']} ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                 Text(
                  'Genero: ${usuario['genero']} ',
                  style:const  TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
      ),
          ),
        ],
      ),
    );
  }
}
