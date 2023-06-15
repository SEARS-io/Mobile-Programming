import 'package:deygo/components/inputs/inputs.dart';
import 'package:flutter/material.dart';
import 'Theme/theme.dart';
import 'components/buttons/primary.button.dart';

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
      theme: AppTheme.theme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: [
            SizedBox.fromSize(size: const Size.fromHeight(20)),
            SizedBox(
              width: 350,
              child: primaryButton(
                  content: 'Dey Go',
                  onPressed: () {},
                  context: context,
                  disabled: false,
                  hasShadow: true),
            ),
            SizedBox.fromSize(size: const Size.fromHeight(20)),
            phoneInput(context: context),
            SizedBox.fromSize(size: const Size.fromHeight(20)),
            passwordInput(context: context),
            SizedBox.fromSize(size: const Size.fromHeight(20)),
            textInput(context: context, hintText: 'Email')
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        foregroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.cabin),
      ),
    );
  }
}
