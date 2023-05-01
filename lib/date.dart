// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  late DateTime _selectedDate;
  int? _age;

  @override
  void initState() {
    super.initState();
    // Inicializa el valor de _selectedDate a la fecha actual
    _selectedDate = DateTime.now();
  }

  // Función que se ejecuta cuando el usuario selecciona una fecha
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _age = _calculateAge(pickedDate);
      });
    }
  }

  // Función para calcular la edad a partir de una fecha de nacimiento
  int _calculateAge(DateTime birthdate) {
    final now = DateTime.now();
    int age = now.year - birthdate.year;
    if (now.month < birthdate.month ||
        (now.month == birthdate.month && now.day < birthdate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Selecciona una fecha'),
            ),
            if (_age != null)
              Column(
                children: [
                  const SizedBox(height: 20),
                  Text('Tu edad es $_age años'),
                  const SizedBox(height: 20),
                  const Text('Resumen de tu vida:'),
                  const SizedBox(height: 10),
                  Text(
                      'Naciste en ${DateFormat.yMMMMd().format(_selectedDate)}'),
                  const SizedBox(height: 10),
                  Text('Has vivido $_age años'),
                  const SizedBox(height: 10),
                  Text('Y eso es aproximadamente ${_age! * 365} días'),
                  const SizedBox(height: 10),
                  Text('O ${_age! * 12} meses'),
                  const SizedBox(height: 10),
                  Text('O ${_age! * 52} semanas'),
                  const SizedBox(height: 10),
                  Text('O ${_age! * 365 * 24} horas'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
