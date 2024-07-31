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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sPhase/fondo.png")
              )
            )
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 275
                ),
                InkWell(
                  onTap: (){
                    sendCommand("sorpresa");
                  },
                  child: Image.asset(
                    "assets/images/sPhase/botonSorpresa.png",
                    height:200,
                    width: 300
                  ),
                ),
                InkWell(
                  onTap: (){
                    sendCommand("despedida");
                  },
                  child: Image.asset(
                    "assets/images/sPhase/botonDespedida.png",
                    height:200,
                    width: 300
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            right: 25,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StartPage()));
              },
              child:const SizedBox(
                height:100,
                width: 100,
              )
            ),
          ),
          Positioned(
            bottom: 15,
            left: 25,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPhase()));
              },
              child:const SizedBox(
                width: 100,
                height:100
              )
            ),
          ),
        ]
      )
    );
  }
}