import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router_test/config/routes/router.dart';
import 'package:go_router_test/config/routes/router.gr.dart';

@RoutePage()
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          router.push(const AboutRoute());
        },
        child: const Text('About Page'),
      ),
    );
  }
}
