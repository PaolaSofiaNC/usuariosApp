import 'package:flutter/material.dart';
import 'package:usuarios/src/witgets/widgets-principal.dart';

class Principal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Container(
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/lluvia.gif'),
              fit: BoxFit.cover,
              ),
           ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:40.0),
                 child: Column(
                   children: [
                     const Center(
                       child: Text('Bienvenidos',
                          style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                             ),
                             ),
                     ),
                     Container(
                      height: 300,
                      width: 300,
                      decoration:const BoxDecoration(
                      image:DecorationImage(
                        image: AssetImage('assets/flower-logo.png'),
                        ),
                    ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                            ),
                   onPressed: () {
                    Login();
                   },
                   child: const Text('Iniciar Sesion', 
                      style:TextStyle(
                        color: Colors.black,
                        height: 2,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                 ),       
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                            ),
                   onPressed: () {
                    Registro();
                   },
                   child: const Text('Registrarse', 
                      style: TextStyle(
                        color: Colors.black,
                        height: 2,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                 ),
                   ],
                 ),
               ),
        ],
      ),
    );
  }

}
 
