import 'package:adoptable_paws/data/cubit/product-cubit/product-cubit.dart';
import 'package:adoptable_paws/data/cubit/product-cubit/product-state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../Utils/constant.dart';
import '../../Utils/widgets/background_canvas.dart';
import 'components/container.dart';
import 'components/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> animationShift;

  int focusedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  void _onItemFocus(int index) {
    print(index);
    setState(() {
      focusedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        CustomPaint(
          child: Container(
            height: 300.0,
          ),
          painter: CurvePainter(),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("location",
                            style: themeData.textTheme.titleSmall
                                ?.copyWith(color: Colors.white)),
                        const SizedBox(
                          width: 4,
                        ),
                        Icon(
                          CupertinoIcons.chevron_down,
                          color: Colors.white.withAlpha(150),
                          size: 14,
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          context.go('/baseRoute/searchui');
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
                Text("Bengaluru, India",
                    style: themeData.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(
                  height: 8,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const AnimatedHeaderCard(),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: 20,
                      left: 20,
                      child: Text(
                        "Join Our",
                        style: themeData.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: 20,
                      bottom: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Animal Lover Community",
                          style: themeData.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: 20,
                      top: 20,
                      child: SizedBox(
                        // width: 90,
                        height: 40,
                        child: Center(
                          child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.pets),
                              label: const Text("Join")),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Adopt Me",
                      style: themeData.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                BlocBuilder<ProductCubit,ProductState>(
                  builder: (context,state) {
                    if(state is ProductLoadingState && state.products.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if(state is ProductErrorState && state.products.isEmpty) {
                      return Center(
                        child: Text(state.message.toString()),
                      );
                    }

                    return SizedBox(
                      height: 350,
                      child: ScrollSnapList(
                        // focusOnItemTap: true,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return GestureDetector(
                            onTap: () => context.go(
                                '/baseRoute/details_page',
                                extra: product),
                            child: Hero(
                              tag: "dash$index",
                              transitionOnUserGestures: true,
                              child: PetCardHome(
                                product:product
                              ),
                            ),
                          );
                        },
                        itemCount: state.products.length,
                        itemSize: 250,
                        onItemFocus: _onItemFocus,
                        dynamicItemSize: true,
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
