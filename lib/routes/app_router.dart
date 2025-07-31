import 'package:auto_route/auto_route.dart';
import '../view/map_page.dart';
import '../view/about_page.dart';
import '../view/main_wrapper.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainWrapperViewRoute.page,
      initial: true,
      children: [
        AutoRoute(page: MapRoute.page),
        AutoRoute(page: AboutRoute.page),
      ],
    ),
  ];
}
