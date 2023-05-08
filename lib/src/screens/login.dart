import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usuarios/src/provider/visibilidad_password.dart';
import '../witgets/widgets-principal.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final passwordVisibilityProvider =
        Provider.of<VisibilidadPassword>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Consumer<VisibilidadPassword>(
            builder: (context, provider, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/flower-logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xffc437ff),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.email, color: Color(0xffc437ff)),
                      hintText: 'Ingrese su correo electrónico',
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
                        return '* Ingrese el correo';
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: passwordVisibilityProvider.isVisible,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock, color: Color(0xffc437ff)),
                      hintText: 'Contraseña',
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisibilityProvider.isVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          passwordVisibilityProvider.cambiarVisibilidad();
                          _passwordController.value =
                              _passwordController.value.copyWith(
                            text: _passwordController.text,
                            selection: TextSelection.fromPosition(
                              TextPosition(
                                  offset: _passwordController.text.length),
                            ),
                          );
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '* Ingrese la contraseña';
                      }
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffc437ff),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListaUsuarios(
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(
                          color: Colors.black,
                          height: 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
