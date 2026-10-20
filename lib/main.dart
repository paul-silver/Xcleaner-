import 'package:flutter/material.dart';
import 'config.dart';

void main() {
  runApp(const XcleanerApp());
}

class XcleanerApp extends StatelessWidget {
  const XcleanerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cleaning_services, size: 80, color: Colors.white),
              const SizedBox(height: 20),
              Text("Take control of your X history", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              Text("Owned by @${AppConfig.owner}", style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                child: const Text("Login with X"),
              ),
              const SizedBox(height: 12),
              Text("Free: ${AppConfig.freeLimit} deletes • Then \$${AppConfig.monthlyPrice}/month", style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
