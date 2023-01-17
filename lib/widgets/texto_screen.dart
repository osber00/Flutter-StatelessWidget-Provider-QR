import 'package:contador_provider/providers/provider_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextoScreen extends StatelessWidget {

  const TextoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProviderTexto providerTexto = Provider.of<ProviderTexto>(context);
    TextEditingController myController = TextEditingController();
    TextStyle miEstilo = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modificar Texto'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
             child: Text('TextoScreen', style: miEstilo,),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(hintText: 'Escribe aquí'),
              ),
            ),
          ),
          Center(
            child: Text('${providerTexto.getTexto}'),
          ),
          ElevatedButton.icon(
            onPressed: (){
              providerTexto.modificarTexto(myController.text);
            },
            icon: const Icon(Icons.refresh_sharp),
            label: const Text('Cambiar texto')
          ),
          ElevatedButton.icon(
            onPressed: (){
              Navigator.popAndPushNamed(context, 'home');
            },
            icon: const Icon(Icons.home),
            label: const Text('Ir a inicio')
          ),
          ElevatedButton.icon(
            onPressed: (){
              Navigator.popAndPushNamed(context, 'leerqr');
            },
            icon: const Icon(Icons.qr_code),
            label: const Text('Ir a leer Qr')
          )
        ],
      ),
    );
  }
}