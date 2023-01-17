import 'package:flutter/material.dart';

class ProviderContador extends ChangeNotifier{
  int _contador = 0;

  /* ProviderContador(){
    print('Cargando provedor');
  } */

  get getcontador{
    return _contador;
  }

  void incremetarEnUno(){
    _contador = _contador + 1;
    notifyListeners();
  }

}