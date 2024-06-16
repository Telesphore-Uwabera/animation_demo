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

```
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
  runApp(BouncingBallApp());
}

class BouncingBallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Bouncing Ball Animation')),
        body: BouncingBall(),
      ),
    );
  }
}

class BouncingBall extends StatefulWidget {
  @override
  _BouncingBallState createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 300).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            margin: EdgeInsets.only(top: _animation.value),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          );
        },
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
