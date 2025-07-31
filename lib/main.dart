import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Bunu ekle
import 'routes/app_router.dart';
import 'viewmodel/map_viewmodel.dart'; 

final _appRouter = AppRouter();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MapViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
