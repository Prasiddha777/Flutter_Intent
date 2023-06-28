import 'dart:async';

import 'package:flutter/material.dart' hide Intent;
import 'package:receive_intent/receive_intent.dart';
// import 'package:receive_sharing_intent/receive_sharing_intent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Intent? _intent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _init() async {
    final receivedIntent = await ReceiveIntent.getInitialIntent();

    if (!mounted) return;

    setState(() {
      _intent = receivedIntent;
    });
  }

  // ignore: unused_element
  Widget _buildFromIntent(String label, Intent? intent) {
    return Center(
      child: Column(
        children: [
          Text(label),
          Text(
              "fromPackage: ${intent?.fromPackageName}\nfromSignatures: ${intent?.fromSignatures}"),
          Text(
              'action: ${intent?.action}\ndata: ${intent?.data}\ncategories: ${intent?.categories}'),
          Text("extras: ${intent?.extra}")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildFromIntent("INITIAL", _intent),
            StreamBuilder<Intent?>(
              stream: ReceiveIntent.receivedIntentStream,
              builder: (context, snapshot) =>
                  _buildFromIntent("STREAMED", snapshot.data),
            )
          ],
        ),
      ),
    );
  }
}
