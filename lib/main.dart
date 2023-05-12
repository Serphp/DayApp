// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:appdate/date.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AppDay',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculadoraWidget()),
                );
              },
              child: const Text('Calculadora'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Date()),
                );
              },
              child: const Text('Date'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'City',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {},
        currentIndex: 0,
        //type: buttonNavigationBarType.fixed,
      ),
    );
  }
}

// ignore: must_be_immutable
class CalculadoraWidget extends StatefulWidget {
  CalculadoraWidget({Key? key}) : super(key: key);
  // ignore: library_private_types_in_public_api
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<CalculadoraWidget> {
  double _valor1 = 0.0;
  double _valor2 = 0.0;
  double _resultado = 0.0;
  String _operacion = "";

  void _calcular() {
    setState(() {
      if (_operacion == "+") {
        _resultado = _valor1 + _valor2;
      } else if (_operacion == "-") {
        _resultado = _valor1 - _valor2;
      } else if (_operacion == "*") {
        _resultado = _valor1 * _valor2;
      } else if (_operacion == "/") {
        _resultado = _valor1 / _valor2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese el primer número',
              ),
              onChanged: (String value) {
                setState(() {
                  _valor1 = double.parse(value);
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese el segundo número',
              ),
              onChanged: (String value) {
                setState(() {
                  _valor2 = double.parse(value);
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _operacion = "+";
                    });
                  },
                  child: const Text('+'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _operacion = "-";
                    });
                  },
                  child: const Text('-'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _operacion = "*";
                    });
                  },
                  child: const Text('*'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _operacion = "/";
                    });
                  },
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: $_resultado',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
