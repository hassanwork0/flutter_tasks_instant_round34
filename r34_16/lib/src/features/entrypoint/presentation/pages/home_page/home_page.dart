import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/features/entrypoint/presentation/widgets/ad_space.dart';
import 'package:r34_16/src/features/entrypoint/presentation/widgets/our_new_item.dart';
import 'package:r34_16/src/features/entrypoint/presentation/widgets/popular_packs.dart';
import 'package:flutter/material.dart'; 
  
  class HomePage extends StatelessWidget {
    const HomePage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, RoutesName.drawerPage);
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 28,
                        color: Color(0xFF2F4F36),
                      ), 
                    ),
                  ),
                ),

                

                floating: true,
                title: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, RoutesName.search);
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Color(0xFF2F4F36),
                      ),
                    ),
                  ),
                ],
              ),
              const SliverToBoxAdapter(child: AdSpace()), //for the pic i think
              const SliverToBoxAdapter(
                child: PopularPacks(),
              ), //for populauPacks part
              const SliverPadding(
                padding: EdgeInsets.symmetric(vertical: AppDefaults.padding),
                sliver: SliverToBoxAdapter(
                  child: OurNewItem(),
                ), //for ournewitem part
              ),
            ],
          ),
        ),
      );
    }
  }
