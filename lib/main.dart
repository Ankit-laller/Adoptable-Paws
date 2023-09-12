import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Theme/controller/theme_provider.dart';
import 'Theme/theme.dart';
import 'navigation/navigation_route.dart';

void main() {
  runApp(const PetAdoptionBase());
}

class PetAdoptionBase extends StatefulWidget {
  const PetAdoptionBase({super.key});

  @override
  State<PetAdoptionBase> createState() => _PetAdoptionBaseState();
}

class _PetAdoptionBaseState extends State<PetAdoptionBase> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UIControllers>(
            create: (context) => UIControllers(),
          ),

        ],
        child: const MaterialApp(
          home:  PetAdoption(),

        )
    );
  }

}

class PetAdoption extends StatelessWidget {
  const PetAdoption({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.getThemeFromThemeMode(
        context.watch<UIControllers>().value,
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}

