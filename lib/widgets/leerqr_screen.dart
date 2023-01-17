import 'package:contador_provider/providers/provider_texto.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class LeerqrScreen extends StatelessWidget {

  const LeerqrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProviderTexto providerTexto = Provider.of<ProviderTexto>(context);
    TextStyle miEstilo = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

    Future _scanearqr() async {
      await Permission.camera.request();
      String? barcode = await scanner.scan();
      if (barcode == null) {
        providerTexto.modificarTexto('No hay código Qr');
      } else {
        providerTexto.modificarTexto(barcode);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leer Qr StatelessWidget'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
             child: Text('${providerTexto.getTexto}', style: miEstilo,),
          ),
          ElevatedButton.icon(
            onPressed: (){
              _scanearqr();
            },
            icon: const Icon(Icons.qr_code),
            label: const Text('Leer Qr')
          ),
          ElevatedButton.icon(
            onPressed: (){
              Navigator.popAndPushNamed(context, 'home');
            },
            icon: const Icon(Icons.home),
            label: const Text('Ir a inicio')
          )
        ],
      ),
    );
  }
}