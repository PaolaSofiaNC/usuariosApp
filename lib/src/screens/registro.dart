import 'package:flutter/material.dart';
import 'package:usuarios/src/services/notification_services.dart';

import '../models/usuario.dart';
import '../witgets/widget-bd.dart';
import '../witgets/widgets-principal.dart';

class Registro extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  final edadController = TextEditingController();
  final telefonoController = TextEditingController();

  List<String> listaGenero = ['Hombre', 'Mujer'];
  String generoSeleccionado = 'Hombre';

  List<Usuario> listaUsuarios = [];
  final RegExp validarNumeros = RegExp(r'^[0-9]+$');
  final RegExp validarLetras = RegExp(r'^[a-zA-Z]+$');
  final RegExp validarCorreo =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');

  void _guardarDatos() {
    if (_formKey.currentState!.validate()) {
      // final usuario = Usuario(
      //   id: DateTime.now().millisecondsSinceEpoch,
      //   nombre: nombreController.text,
      //   correo: correoController.text,
      //   password: passwordController.text,
      //   edad: edadController.text,
      //   telefono: telefonoController.text,
      //   seleccionGenero: generoSeleccionado,

      // );
      // listaUsuarios.add(usuario);
      InsertarUsuario().agregarCliente(Usuario(
          id: DateTime.now().millisecondsSinceEpoch,
          nombre: nombreController.text,
          correo: correoController.text,
          password: passwordController.text,
          edad: edadController.text,
          telefono: telefonoController.text,
          seleccionGenero: generoSeleccionado));
      nombreController.text = '';
      correoController.text = '';
      passwordController.text = '';
      edadController.text = '';
      telefonoController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Registrate',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xffc437ff),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Nombre: ',
                  style: TextStyle(
                    color: Color(0xffc437ff),
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: nombreController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.person, color: Color(0xffc437ff)),
                    hintText: 'Nombre',
                    fillColor: const Color(0xffc437ff),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Ingrese el nombre';
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Correo: ',
                  style: TextStyle(
                    color: Color(0xffc437ff),
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: correoController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.email, color: Color(0xffc437ff)),
                    hintText: 'Email',
                    fillColor: const Color(0xffc437ff),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  validator: (value)  {
                    if (value!.isEmpty) {
                      return '* Ingrese el correo';
                    }
                    if (!validarCorreo.hasMatch(value)) {
                      return '* Correo inválido';
                    }
                    
                    bool? a;
                    verificarCorreoExistente(value).then((res) {
                      print("Esperando salida");
                      print(res);
                      if (res != null){
                         if(res==true){
                          a=true;
                         }
                      }else{
                        if(res==false){
                          a=false;
                        }
                      }
                    });
                    Future.delayed(Duration(milliseconds: 300 ));

                    if (a==true) {
                      return '* El correo ya ha sido registrado';
                       }

                    //print(await verificarCorreoExistente(value));

                    // if (verificarCorreoExistente(value) != null &&
                    //     verificarCorreoExistente(value) == value) {
                    //   return '* El correo ya ha sido registrado';
                    // }

                    return null; // Retorno nulo si no hay error de validación
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contraseña: ',
                  style: TextStyle(
                    color: Color(0xffc437ff),
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.lock, color: Color(0xffc437ff)),
                    hintText: 'Contaseña',
                    fillColor: const Color(0xffc437ff),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Ingrese la contraseña';
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Edad: ',
                  style: TextStyle(
                    color: Color(0xffc437ff),
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: edadController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.person, color: Color(0xffc437ff)),
                    hintText: 'Edad',
                    fillColor: const Color(0xffc437ff),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Ingrese la edad';
                    }
                    if (!validarNumeros.hasMatch(value)) {
                      return '* No es numero';
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Telefono: ',
                  style: TextStyle(
                    color: Color(0xffc437ff),
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: telefonoController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.phone, color: Color(0xffc437ff)),
                    hintText: 'Telefono',
                    fillColor: const Color(0xffc437ff),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Ingrese el telefono';
                    }
                    if (!validarNumeros.hasMatch(value)) {
                      return '* El teléfono debe contener solo números';
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Género: ',
                  style: TextStyle(
                    color: Color(0xffc437ff),
                    fontSize: 20,
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: generoSeleccionado,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.category, color: Color(0xffc437ff)),
                    hintText: 'Seleccionar género',
                    fillColor: const Color(0xffc437ff),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xffc437ff)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  onChanged: (value) {
                    generoSeleccionado = value!;
                  },
                  items: listaGenero.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return '* Seleccione un género';
                    }
                  },
                ),
                const SizedBox(height: 50),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffc437ff),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        mostrarNotificacion();
                        _guardarDatos();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListaUsuarios()));
                      }
                    },
                    child: const Text(
                      'Guardar',
                      style: TextStyle(
                          color: Colors.black,
                          height: 2.5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
