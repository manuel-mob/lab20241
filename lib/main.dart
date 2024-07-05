import 'package:ejemplo_lab/pages/detail.dart';
import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  //WidgetsFlutterBinding.ensureInitialized();
   
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'AngelineVintage',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejemplo de Laboratorio'),
      routes: {
      '/detail': (context) => const Detail(),
      //'/list': (context) => ListDetail(),
    },
    );
  }
}

