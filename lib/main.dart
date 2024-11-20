import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ResponsiveGridScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsiveGridScreen extends StatelessWidget {
  const ResponsiveGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/image01.jpeg',
      'assets/image02.jpeg',
      'assets/image03.jpeg',
      'assets/image04.jpeg',
      'assets/image05.jpeg',
      'assets/image06.jpeg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Grid Layout'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = (constraints.maxWidth ~/ 150).toInt();
          if (crossAxisCount < 2) crossAxisCount = 2;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.0,
            ),
            padding: const EdgeInsets.all(8.0),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              );
            },
          );
        },
      ),
    );
  }
}
