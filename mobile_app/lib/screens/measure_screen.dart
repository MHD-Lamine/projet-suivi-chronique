import 'package:flutter/material.dart';

class MeasureScreen extends StatefulWidget {
  const MeasureScreen({super.key});

  @override
  State<MeasureScreen> createState() => _MeasureScreenState();
}

class _MeasureScreenState extends State<MeasureScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tensionCtrl = TextEditingController();
  final _glycemieCtrl = TextEditingController();
  final _frequenceCtrl = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO : envoyer les données à l'API
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Mesures enregistrées'),
      ));

      _tensionCtrl.clear();
      _glycemieCtrl.clear();
      _frequenceCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter des mesures')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _tensionCtrl,
                decoration: const InputDecoration(
                    labelText: 'Tension artérielle (ex : 120/80 mmHg)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _glycemieCtrl,
                decoration:
                    const InputDecoration(labelText: 'Glycémie (ex : 1.1 g/L)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _frequenceCtrl,
                decoration:
                    const InputDecoration(labelText: 'Fréquence cardiaque (bpm)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Enregistrer'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
