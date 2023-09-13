
import 'package:adoptable_paws/Business/base/base-route.dart';
import 'package:adoptable_paws/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../Business/details_page/ui/details_page.dart';
import '../Business/homepage/homepage.dart';
import '../Business/splashScreen/ui/SplashScreen.dart';



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
            routes:  <RouteBase>[
              GoRoute(
                path: 'homePage',
                builder: (BuildContext context, GoRouterState state) {
                  return HomePage();
                },
              ),
              GoRoute(
                path: 'details_page',
                builder: (BuildContext context, GoRouterState state) {

                  ProductModel petData = state.extra as ProductModel;
                  return DetailsPage(

                    petData: petData,
                  );
                },
              ),

            ]),
      ],
    ),
  ],
);
