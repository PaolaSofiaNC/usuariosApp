import 'package:flutter/material.dart';
import 'package:usuarios/src/provider/visibilidad_password.dart';
import 'package:usuarios/src/screens/principal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VisibilidadPassword>(
      create: (_) => VisibilidadPassword(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Principal(),
        ),
      ),
    );
  }
}
