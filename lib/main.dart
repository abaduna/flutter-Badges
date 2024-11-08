import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  bool isLabelVisible = false;
  bool isLongPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mi Primera App'),
      ),
      body: Column(
     
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isLabelVisible = !isLabelVisible;
              });
            },
            child: Text(isLabelVisible ? 'true' : 'false'),
          ),
          Badge(
            label: Text(isLongPressed ? '😊' : '❌'),
            isLabelVisible: isLongPressed,
            child: InkWell(
              onLongPress: () {
                setState(() {
                  isLongPressed = !isLongPressed;
                });
              },
              child: Container(
            
                height: 200,
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: const Text('message', style: TextStyle(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Badge(
                  label: const Text('1'),
                  isLabelVisible: isLabelVisible,
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.home)),
              label: 'Home'),
          const BottomNavigationBarItem(icon: Badge(label: Text("hola"), child: Icon(Icons.settings)), label: 'Settings'),
        ],
      ),
    );
  }
}
