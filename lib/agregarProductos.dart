import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AgregarProductosView extends StatelessWidget {
  const AgregarProductosView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController codigo = TextEditingController();
    TextEditingController nombre = TextEditingController();
    TextEditingController precio = TextEditingController();
    TextEditingController categoria = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Productos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Codigo',
              border: OutlineInputBorder(),
            ),
            controller: codigo,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(),
            ),
            controller: nombre,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Precio',
              border: OutlineInputBorder(),
            ),
            controller: precio,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Categoria',
              border: OutlineInputBorder(),
            ),
            controller: categoria,
          ),
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) print(codigo.text);
              Navigator.pop(
                context,
                {
                  'codigo': codigo.text,
                  'nombre': nombre.text,
                  'precio': double.parse(precio.text),
                  'categoria': categoria.text,
                },
              );
            },
            child: const Text('Agregar Producto'),
          ),
        ],
      ),
    );
  }
}
