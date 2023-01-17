import 'package:contador_provider/providers/provider_contador.dart';
import 'package:contador_provider/providers/provider_texto.dart';
import 'package:provider/provider.dart';
import 'package:contador_provider/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(const EstadoApp());


class EstadoApp extends StatelessWidget {
  const EstadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProviderContador(), lazy: false),
        ChangeNotifierProvider(create: (_) => ProviderTexto(), lazy: false)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'texto',
      routes: {
        'home' : (_) => const HomeScreen(),
        'texto': (_) => const TextoScreen(),
        'leerqr': (_) => const LeerqrScreen(),
      },
    );
  }
}