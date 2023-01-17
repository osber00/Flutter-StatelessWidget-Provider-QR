import 'package:contador_provider/providers/provider_contador.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle miEstilo = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
    ProviderContador providerContador = Provider.of<ProviderContador>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador con StatelessWidget'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Center(child: Text('Contador con StlessWidget (Provider)', style: miEstilo)),
          Center(child: Text('${providerContador.getcontador}', style: miEstilo,)),
          ElevatedButton.icon(
            onPressed: (){
              providerContador.incremetarEnUno();
            },
            icon: const Icon(Icons.add),
            label: const Text('Incrementar')
          ),
          ElevatedButton.icon(
            onPressed: (){
              Navigator.popAndPushNamed(context, 'texto');
            },
            icon: const Icon(Icons.home),
            label: const Text('Ir a text-input')
          )
         ],
      ),
    );
  }
}