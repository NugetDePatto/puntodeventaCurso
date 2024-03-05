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

  productos.clear();

  List<String> p = [
    'Producto 1',
    'Producto 2',
    'Producto 3',
    'Producto 4',
    'Producto 5',
  ];

  productos.add('');

  productos.put(6, 'producto 1');
  productos.put('p3', 'producto 1');
  productos.put(
    'Jugo Jumex 1L',
    {
      'precio': 10,
      'cantidad': 10,
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

  productos.addAll(p);

  // print(productos.values);

  for (var i = 0; i < productos.length; i++) {
    print(productos.getAt(i));
  }

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
