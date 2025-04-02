import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: déconnexion
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text("Bienvenue, Patient !",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildCard("Tension artérielle", "120 / 80 mmHg", Icons.favorite),
            _buildCard("Glycémie", "1.1 g/L", Icons.bloodtype),
            _buildCard("Fréquence cardiaque", "75 bpm", Icons.monitor_heart),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigation vers graphiques
              },
              child: const Text("Voir les graphiques"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String titre, String valeur, IconData icone) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icone, size: 30, color: Colors.indigo),
        title: Text(titre),
        subtitle: Text(valeur,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
