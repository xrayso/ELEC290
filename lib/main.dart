import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'options_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line to initialize bindings.
  await Firebase.initializeApp(); // Initialize Firebase.
  runApp(ArcWayApp());
}

class ArcWayApp extends StatelessWidget {
  const ArcWayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArcWay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _netidController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isFormValid = false;

  void _validateForm() {
    setState(() {
      // Enable login button only if both fields are filled
      _isFormValid = _netidController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the tree
    _netidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular logo
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/logo.png'), // Using the logo from the assets folder
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20),

              // App title
              const Text(
                'ArcWay',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),

              // NetID input field
              TextField(
                controller: _netidController,
                decoration: const InputDecoration(
                  labelText: 'NetID',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (_) => _validateForm(),
              ),
              const SizedBox(height: 20),

              // Password input field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                onChanged: (_) => _validateForm(),
              ),
              const SizedBox(height: 30),

              // Login button
              ElevatedButton(
                onPressed: _isFormValid
                    ? () {
                  // Navigate to OptionsPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OptionsPage()),
                  );
                }
                    : null, // Disable button if form is not valid
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
