# animation_demo
```markdown
# Flutter Animation Demo

This project demonstrates a simple animation implemented in Flutter. The animation shows a ball bouncing up and down, showcasing the use of `AnimationController`, `CurvedAnimation`, and `AnimatedBuilder`.

## Getting Started

These instructions will help you set up the project on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- A code editor like Visual Studio Code or Android Studio
- Git for version control

### Installing

1. Clone the repository:

   
   git clone [https://github.com/telesphore-uwabera/animation_demo.git](https://github.com/Telesphore-Uwabera/animation_demo)
   cd animation_demo

   

2. Get the dependencies:

   
   flutter pub get
  

3. Run the app:

  
   flutter run
  

## Project Structure

```plain text
animation_demo/
├── lib/
│   ├── main.dart         # Main entry point of the application
└── pubspec.yaml          # Pubspec file for managing dependencies
```

## Animation Details

The animation in this project is a simple bouncing ball animation. The key components used include:

- **`AnimationController`**: Manages the animation.
- **`CurvedAnimation`**: Adds a curve to the animation.
- **`AnimatedBuilder`**: Rebuilds the widget tree when the animation value changes.

### Example Code

Here's a snippet of the core animation code:

```dart
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
  final List<String> _words = ['Hello', 'Welcome', 'To', 'Flutter'];
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
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
```

## Demo Video

Check out the demo video to see the animation in action: [Demo Video Link](https://example.com/demo-video)

## Contributing

If you would like to contribute to this project, please fork the repository and submit a pull request. We welcome any improvements or additional animations you would like to add.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Flutter team for their comprehensive documentation and resources.
- Inspired by various online tutorials and articles on Flutter animations.
