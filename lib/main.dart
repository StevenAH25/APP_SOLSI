import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pruebaconexion/views/pagina_inicio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESP32 Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaginaInicio(),
    );
  }
}

/*class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Future<void> sendCommand(String command) async {
    const url = 'http://192.168.4.1/control'; // IP del ESP32 en modo AP
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {'command': command},
      );
      if (response.statusCode == 200) {
        print('Command sent successfully: $command');
      } else {
        print('Failed to send command');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ESP32 Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                sendCommand('iniciar');
              },
              child: const Text('Iniciar Servomotor'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendCommand('finalizar');
              },
              child: const Text('Finalizar Servomotor'),
            ),
          ],
        ),
      ),
    );
  }
}*/





