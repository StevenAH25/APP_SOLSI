import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrimeraFase extends StatelessWidget {
  const PrimeraFase({super.key});

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
        title: const Text("Primera Fase")
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                sendCommand("huevo");
              }, 
              child: const Text("Huevo Encontrado")
            ),
            ElevatedButton(
              onPressed: (){
                sendCommand("nido");
              }, 
              child: const Text("Nido Encontrado")
            ),
            ElevatedButton(
              onPressed: (){
                sendCommand("cueva");
              }, 
              child: const Text("Cueva Encontrado")
            ),
          ],
        )
      )
    );
  }
}