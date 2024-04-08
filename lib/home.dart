import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:puntodeventa/agregarProductos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box productos = Hive.box('productos');
  int indice = 0;

  vistas() {
    if (indice == 0) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imagen.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // para mandar una vista
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AgregarProductosView();
                        },
                      ),
                    ).then((value) {
                      if (value != null) {
                        crear(
                          value['codigo'],
                          value['nombre'],
                          value['precio'],
                          value['categoria'],
                        );
                        setState(() {});
                      }
                    });
                  },
                  child: const Text('Agregar'),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (var p in productos.values)
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.fastfood,
                          size: 40,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p['nombre'].toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              p['categoria'].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '\$${p['precio']}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    } else if (indice == 1) {
      return const Scaffold(
        body: Text('Perfil'),
      );
    } else if (indice == 2) {
      return const Scaffold(
        body: Text('Inicio'),
      );
    }
  }

  crear(String codigo, String nombre, double precio, String categoria) {
    // si el producto ya existe, no lo agregamos y mostramos un mensaje
    if (productos.containsKey(codigo)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El producto ya existe'),
        ),
      );
    }

    productos.put(
      codigo,
      {
        'codigo': codigo,
        'nombre': nombre,
        'precio': precio,
        'categoria': categoria,
      },
    );
  }

  leer(String codigo) {
    if (!productos.containsKey(codigo)) {
      return {};
    }
    return productos.get(codigo);
  }

  actualizar(String codigo, String nombre, double precio, String categoria) {
    productos.put(
      codigo,
      {
        'codigo': codigo,
        'nombre': nombre,
        'precio': precio,
        'categoria': categoria,
      },
    );
  }

  eliminar(String codigo) {
    productos.delete(codigo);
  }

  // CREATE, READ, UPDATE, DELETE
  // CREAR, LEER, ACTUALIZAR, ELIMINAR
  // CRUD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Punto de Venta'),
      ),
      body: vistas(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indice,
        onTap: (value) {
          print(value);
          indice = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
        ],
      ),
    );
  }
}
