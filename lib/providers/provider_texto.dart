import 'package:flutter/material.dart';

class ProviderTexto extends ChangeNotifier{
  String _texto = 'Hola Mundo... Flutter';

  /* ProviderTexto(){
    print('provider cargado...');
  } */

  get getTexto{
    return _texto;
  }

  void modificarTexto(String info){
    _texto = info;
    notifyListeners();
  }

}