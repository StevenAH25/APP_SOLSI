import 'package:flutter/material.dart';
import 'package:solsi/views/start_page.dart';
import 'package:solsi/views/first_phase.dart';
import 'package:http/http.dart' as http;

class SecondPhase extends StatelessWidget {
  const SecondPhase({super.key});

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sPhase/fondo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.35,
                ),
                InkWell(
                  onTap: () {
                    sendCommand("sorpresa");
                  },
                  child: Image.asset(
                    "assets/images/sPhase/botonSorpresa.png",
                    height: size.height * 0.25,
                    width: size.width * 0.75,
                  ),
                ),
                InkWell(
                  onTap: () {
                    sendCommand("despedida");
                  },
                  child: Image.asset(
                    "assets/images/sPhase/botonDespedida.png",
                    height: size.height * 0.25,
                    width: size.width * 0.75,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
            right: size.width * 0.05,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StartPage()));
              },
              child: SizedBox(
                height: size.height * 0.12,
                width: size.width * 0.25,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
            left: size.width * 0.05,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPhase()));
              },
              child: SizedBox(
                width: size.width * 0.25,
                height: size.height * 0.12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
