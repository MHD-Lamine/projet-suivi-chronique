import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      // TODO: Appel API Flask plus tard
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Inscription simulée")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nom requis' : null,
              ),
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value == null || !value.contains('@') ? 'Email invalide' : null,
              ),
              TextFormField(
                controller: _passwordCtrl,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) =>
                    value == null || value.length < 6 ? 'Mot de passe trop court' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _register, child: const Text("S'inscrire")),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Déjà inscrit ? Se connecter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
