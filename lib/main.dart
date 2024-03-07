import 'package:flutter/material.dart';
import 'package:puntodeventa/home.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //aqui se busca el directorio donde se va guardar la base de datos
  await Hive.initFlutter();

  //metodo asincrono
  await Hive.openBox('productos');

  Box productos = Hive.box('productos');

  productos.put(
    'p1',
    {
      'nombre': 'Coca cola',
      'precio': 20,
      'codigo': 'xxxxxxxxx',
      'categoria': 'Refrescos'
    },
  );
  productos.put(
    'p2',
    {
      'nombre': 'Pepsi',
      'precio': 18,
      'codigo': 'xxxxxxxxx',
      'categoria': 'Refrescos'
    },
  );
  productos.put(
    'p3',
    {
      'nombre': 'Jugo Jumex',
      'precio': 18,
      'codigo': 'xxxxxxxxx',
      'categoria': 'Bebidas'
    },
  );
  productos.put(
    'p4',
    {
      'nombre': 'Sprite',
      'precio': 18,
      'codigo': 'xxxxxxxxx',
      'categoria': 'Refrescos'
    },
  );

  // print(productos.get('Jugo Jumex'));

  // productos.getAt(index);

  // 0
  // 1
  // 2
  // 3
  // 4
  //
  // 6
  //
  //10

  //p3
  //2023-01-01

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
