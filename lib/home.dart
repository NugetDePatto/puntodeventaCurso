import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> productos = [
    'Producto 1',
    'Producto 2',
    'Producto 3',
    'Producto 4',
    'Producto 5',
  ];

  List<String> productosGuardados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Punto de Venta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Buscar Producto',
              ),
              onSubmitted: (value) {
                int i = int.parse(value);
                print(productos[i]);

                productosGuardados.add(productos[i]);
                setState(() {});
              },
            ),
            for (String p in productosGuardados) Text(p),
          ],
        ),
      ),
    );
  }
}
