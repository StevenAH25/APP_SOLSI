import 'package:flutter/material.dart';
import 'package:solsi/views/first_phase.dart';
import 'package:http/http.dart' as http;

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
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children:[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/homePage/fondo.png"),
                fit: BoxFit.cover
              )
            )
          ),
          Center(
            child: Row(
              children:[
                SizedBox(
                  width: screen.width*0.12,
                ),
                InkWell(
                  onTap:(){
                    sendCommand("equipo1");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPhase()));
                  },
                  child: Image.asset(
                    "assets/images/homePage/boton1.png",
                    width: screen.width*0.25,
                    height: screen.height*0.1,
                  ),
                ),
                InkWell(
                  onTap:(){
                    sendCommand("equipo2");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPhase()));
                  },
                  child: Image.asset(
                    "assets/images/homePage/boton2.png",
                    width: screen.width*0.25,
                    height: screen.height*0.1,
                  ),
                ),
                InkWell(
                  onTap:(){
                    sendCommand("equipo3");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPhase()));        
                  },
                  child: Image.asset(
                    "assets/images/homePage/boton3.png",
                    width: screen.width*0.25,
                    height: screen.height*0.1,
                  ),
                ),
              ]
            )
          )
        ]
      )
    );
  }
}