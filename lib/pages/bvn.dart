import 'package:appliflutter1/pages/HomePage.dart';
import 'package:flutter/material.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5842A9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Ajoutez ici la fonctionnalité de rafraîchissement
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'BIENVENUE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                'MAREME_KANE_METEO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              const Stack(
                children: [
                  Text(
                    '..°C',
                    style: TextStyle(
                      fontSize: 150,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Padding(
                      padding: EdgeInsets.only(left: 65.0, top: 100),
                      child: Image(
                        height: 150,
                        image: AssetImage('assets/images/nuageux.png'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Dimanche 16 Mars | 23.26 PM',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff331C71),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                      Icons.cloud,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                      Icons.ac_unit,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                      Icons.beach_access,
                      color: Colors.white,
                      size: 40,
                    ),
                    // Ajoutez d'autres icônes météorologiques selon vos besoins
                  ],
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Meteo()), // Remplacez NextPage() par le nom de votre classe de page suivante
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Afficher plus',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xff5842A9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
