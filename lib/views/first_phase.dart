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
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/fPhase/fondo_2.png"),
                fit: BoxFit.cover
              )
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: screen.height*0.2
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen
                  ),
                  onPressed: () {
                    sendCommand("Dcerca");
                  },
                  child: const Text(
                    "Demasiado Cerca",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                  height : screen.height*0.015
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen
                  ),
                  onPressed: () {
                    sendCommand("Mcerca");
                  },
                  child: const Text(
                    "Muy Cerca",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                  height : screen.height*0.015
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen
                  ),
                  onPressed: () {
                    sendCommand("cerca");
                  },
                  child: const Text(
                    "Cerca",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                  height : screen.height*0.015
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[700]
                  ),
                  onPressed: () {
                    sendCommand("lejos");
                  },
                  child: const Text(
                    "Lejos",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                  height : screen.height*0.015
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[700]
                  ),
                  onPressed: () {
                    sendCommand("Mlejos");
                  },
                  child: const Text(
                    "Muy Lejos",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                  height : screen.height*0.015
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[700]
                  ),
                  onPressed: () {
                    sendCommand("Dlejos");
                  },
                  child: const Text(
                    "Demasiado Lejos",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            )
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height:screen.height*0.6,
                ),
                Row(
                  children: [
                    SizedBox(
                      width:screen.width*0.14,
                    ),  
                    InkWell(
                      onTap: (){
                        sendCommand("huevo");
                      },
                      child: Image.asset(
                        "assets/images/fPhase/botonHuevo.png",
                        height: screen.height*0.18,
                        width: screen.width*0.35,
                        )
                    ),
                    InkWell(
                      onTap: (){
                        sendCommand("nido");
                      },
                      child: Image.asset(
                        "assets/images/fPhase/botonNido.png",
                        height: screen.height*0.18,
                        width: screen.width*0.35,
                        ),
                    )
                  ],
                ),
                /*SizedBox(
                  height: screen.height*0.1
                ),*/
                InkWell(
                  onTap: () {
                    sendCommand("cueva");
                  },
                  child: Image.asset(
                    "assets/images/fPhase/botonCueva.png",
                      height: screen.height*0.18,
                      width: screen.width*0.35,
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


