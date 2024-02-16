import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router_test/config/routes/router.dart';
import 'package:go_router_test/config/routes/router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  bool _canPop(BuildContext context) {
    final path = router.currentPath;
    print('path: $path');
    return path == '/';
  }

  @override
  Widget build(BuildContext context) {
    print('canPop: ${_canPop(context)}');
    return AutoTabsScaffold(
      transitionBuilder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: PopScope(
            canPop: _canPop(context),
            onPopInvoked: (didPop) {
              print('onPopInvoked: $didPop');
              if (didPop) return;
              router.navigate(const HomeRoute());
            },
            child: child,
          ),
        );
      },
      routes: const [
        HomeViewRoute(),
        DetailsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => NavigationBar(
        selectedIndex: tabsRouter.activeIndex,
        onDestinationSelected: tabsRouter.setActiveIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.info),
            label: 'Details',
          ),
        ],
      ),
    );
  }
}

@RoutePage()
class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}
