import 'package:adoptable_paws/data/cubit/product-cubit/product-cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          BlocProvider(create:(context)=> ProductCubit())

        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
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
      debugShowCheckedModeBanner: false,
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

