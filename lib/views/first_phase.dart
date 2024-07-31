import 'package:flutter/material.dart';
import 'package:solsi/views/home_page.dart';
import 'package:solsi/views/second_phase.dart';
import 'package:http/http.dart' as http;

class FirstPhase extends StatelessWidget {
  const FirstPhase({super.key});

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
                image: AssetImage("assets/images/fPhase/fondo.png"),
                fit: BoxFit.cover
              )
            )
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 520,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        sendCommand("huevo");
                      },
                      child: Image.asset(
                        "assets/images/fPhase/botonHuevo.png",
                        height: 100,
                        width: 200,
                        )
                    ),
                    InkWell(
                      onTap: (){
                        sendCommand("nido");
                      },
                      child: Image.asset(
                        "assets/images/fPhase/botonNido.png",
                        height: 100,
                        width: 200,
                        ),
                    )
                  ],
                ),
                const SizedBox(
                  height:25
                ),
                InkWell(
                  onTap: () {
                    sendCommand("cueva");
                  },
                  child: Image.asset(
                    "assets/images/fPhase/botonCueva.png",
                    height: 100,
                    width: 200,
                    ),
                ),
              ]
            )
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPhase()));
              },
              child: Image.asset(
                "assets/images/fPhase/botonAdelante.png",
                width: 80,
                height: 80,
                ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child:Image.asset(
              "assets/images/fPhase/botonAtras.png",
              width: 80,
              height: 80,
              ),
            ),
          ),   
        ],
      ),
    );
  }
}

