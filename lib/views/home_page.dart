import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pruebaconexion/views/primera_fase.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        title: const Text("Selección de equipos"),
      ),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: (){
                sendCommand("equipo1");
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrimeraFase()));
              }, 
              child: const Text("1")
            ),
            ElevatedButton(
              onPressed: (){
                sendCommand("equipo2");
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrimeraFase()));
              }, 
              child: const Text("2")
            ),
            ElevatedButton(
              onPressed: (){
                sendCommand("equipo3");
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrimeraFase()));
              }, 
              child: const Text("3")
            ),
          ],
        ),
      ),
    );
  }
}