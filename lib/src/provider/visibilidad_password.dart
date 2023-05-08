import 'package:flutter/foundation.dart';

class VisibilidadPassword with ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  void cambiarVisibilidad() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
