import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/map_page.dart';
import 'viewmodel/map_viewmodel.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapViewModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MapPage(),
      ),
    );
  }
}
