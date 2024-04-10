import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditarProductosView extends StatelessWidget {
  Map<dynamic, dynamic> producto;

  EditarProductosView({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    TextEditingController codigo =
        TextEditingController(text: producto['codigo']);
    TextEditingController nombre =
        TextEditingController(text: producto['nombre']);
    TextEditingController precio =
        TextEditingController(text: producto['precio'].toString());
    TextEditingController categoria =
        TextEditingController(text: producto['categoria']);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Productos'),
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
