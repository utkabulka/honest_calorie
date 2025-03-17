import 'package:flutter/material.dart';

class DevToolsPage extends StatelessWidget {
  const DevToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dev tools"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text("Export saved food"),
            subtitle: const Text("Exports non-preset food as JSON"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
