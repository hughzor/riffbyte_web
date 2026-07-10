import 'package:flutter/material.dart';

import '../../widgets/navbar.dart';
import 'sections/hero_section.dart';
import 'sections/products_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: const [
          SliverToBoxAdapter(
            child: Navbar(),
          ),
          SliverToBoxAdapter(
            child: HeroSection(),
          ),
          SliverToBoxAdapter(
            child: ProductsSection(),
          ),
        ],
      ),
    );
  }
}