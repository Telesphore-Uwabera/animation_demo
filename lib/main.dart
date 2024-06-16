import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Text Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextAnimationScreen(),
    );
  }
}

class TextAnimationScreen extends StatefulWidget {
  @override
  _TextAnimationScreenState createState() => _TextAnimationScreenState();
}

class _TextAnimationScreenState extends State<TextAnimationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<String> _words = ['Hello!', 'Welcome', 'To', 'Flutter', 'App', 'That', 'Allows', 'Animation'];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _words.length;
        });
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Animation'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Text(
            _words[_currentIndex],
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
