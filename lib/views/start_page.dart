import 'package:flutter/material.dart';
import 'package:solsi/views/home_page.dart';
import 'package:http/http.dart' as http;

class StartPage extends StatelessWidget {
  const StartPage({super.key});

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
                image: AssetImage("assets/images/inicio/fondo.png"),
                fit: BoxFit.cover
              )
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Image.asset(
              "assets/images/inicio/interrogacion.png",
              width: 50,
              height: 50,
            )
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  "assets/images/inicio/letrasSolsi.png",
                  width: 230,
                  height: 155,
                ),
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  "assets/images/inicio/solsi.png",
                  height: 230,
                  width: 230,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (){
                    sendCommand('iniciar');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  child: Text(
                    "Iniciar",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[300]
                    ),
                  ),
                ),
                const SizedBox(height: 92,),
                Image.asset(
                  "assets/images/inicio/piePagina.png",
                  height: 200,
                  width: 500,
                ),
              ],
            ),
          ),   
        ]
      )
    );
  }
}