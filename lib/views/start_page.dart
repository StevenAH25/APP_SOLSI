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
    final screen = MediaQuery.of(context).size;

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
            top: screen.height * 0.02,
            right: screen.width * 0.05,
            child: Image.asset(
              "assets/images/inicio/interrogacion.png",
              width: screen.width * 0.1,
              height: screen.height * 0.05,
            )
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screen.height * 0.1,
                ),
                Image.asset(
                  "assets/images/inicio/letrasSolsi.png",
                  width: screen.width * 0.6,
                  height: screen.height * 0.2,
                ),
                SizedBox(
                  height: screen.height * 0.05,
                ),
                Image.asset(
                  "assets/images/inicio/solsi.png",
                  height: screen.height * 0.3,
                  width: screen.width * 0.6,
                ),
                SizedBox(
                  height: screen.height * 0.025,
                ),
                ElevatedButton(
                  onPressed: (){
                    sendCommand('iniciar');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  child: Text(
                    "Iniciar",
                    style: TextStyle(
                      fontSize: screen.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[300]
                    ),
                  ),
                ),
                SizedBox(height: screen.height * 0.085,),
                Image.asset(
                  "assets/images/inicio/piePagina.png",
                  height: screen.height * 0.25,
                  width: screen.width,
                ),
              ],
            ),
          ),   
        ]
      )
    );
  }
}
