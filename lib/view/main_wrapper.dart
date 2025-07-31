import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../routes/app_router.dart';

// 📁 main_wrapper.dart
@RoutePage()
class MainWrapperView extends StatelessWidget {
  const MainWrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        MapRoute(),
        AboutRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Harita',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Hakkında',
            ),
          ],
        );
      },
    );
  }
}
