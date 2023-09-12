
import 'package:adoptable_paws/Business/base/base-route.dart';
import 'package:adoptable_paws/Business/ui/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';



final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'baseRoute',
            builder: (BuildContext context, GoRouterState state) {
              return BaseRoute();
            },
            routes: const <RouteBase>[


            ]),
      ],
    ),
  ],
);
