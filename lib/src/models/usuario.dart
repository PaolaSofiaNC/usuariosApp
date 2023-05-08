class Usuario {
  final int id;
  final String nombre;
  final String correo;
  final String password;
  final String edad;
  final String telefono;
  final String seleccionGenero;

  Usuario({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.password,
    required this.edad,
    required this.telefono,
    required this.seleccionGenero,
  });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'correo': correo,
      'password':password,
      'edad':edad,
      'telefono':telefono,
      'genero':seleccionGenero
    };
  }
}

