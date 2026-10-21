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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPro = false;
  int deletesUsed = 27;

  @override
  Widget build(BuildContext context) {
    int limit = isPro ? AppConfig.proLimit : AppConfig.freeLimit;
    double progress = deletesUsed / limit;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Owner Badge
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.verified, color: Colors.blue),
                  SizedBox(width: 8),
                  Text("Owned by ${AppConfig.githubHandle} - ${AppConfig.owner}"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              isPro ? "PRO PLAN: ${AppConfig.proLimit} deletes / month" : "FREE PLAN: ${AppConfig.freeLimit} deletes / month",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(value: progress, minHeight: 10),
            SizedBox(height: 8),
            Text("$deletesUsed / $limit used this month"),
            SizedBox(height: 30),

            // Features
            ListTile(
              leading: Icon(Icons.delete_forever),
              title: Text("Bulk Delete by Date"),
              subtitle: Text("Delete posts, reposts, likes"),
            ),
            ListTile(
              leading: Icon(Icons.backup),
              title: Text("Backup First"),
              subtitle: Text("Save to JSON before deleting"),
            ),

            Spacer(),

            // Paywall Button
            if (!isPro)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    // Paystack checkout -> paulmaduvincent@gmail.com
                    setState(() => isPro = true);
                  },
                  child: Text(
                    "Upgrade to ${AppConfig.proLimit} deletes - \$${AppConfig.monthlyPrice}/mo",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("PRO Active - $limit deletes"),
                ),
              ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Paystack: ${AppConfig.paystackEmail}",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
