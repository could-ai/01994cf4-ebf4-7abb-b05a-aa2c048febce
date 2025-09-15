import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notion Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _blocks = [
    const Text('Welcome to your Notion Clone!', style: TextStyle(fontSize: 24)),
    const TextField(
      decoration: InputDecoration(
        hintText: 'Start typing...',
        border: InputBorder.none,
      ),
    ),
  ];

  void _addBlock() {
    setState(() {
      _blocks.add(
        const TextField(
          decoration: InputDecoration(
            hintText: 'Type something...',
            border: InputBorder.none,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Workspace'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add a new page'),
              onTap: () {
                // TODO: Implement page creation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.note),
              title: const Text('Page 1'),
              onTap: () {
                 Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.note_outlined),
              title: const Text('Page 2'),
              onTap: () {
                 Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _blocks.length,
          itemBuilder: (context, index) {
            return _blocks[index];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBlock,
        tooltip: 'Add Block',
        child: const Icon(Icons.add),
      ),
    );
  }
}
