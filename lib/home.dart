import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box productos = Hive.box('productos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Punto de Venta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            for (var p in productos.values)
              Text(
                p.toString(),
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
