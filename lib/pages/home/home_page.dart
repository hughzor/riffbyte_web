import 'package:flutter/material.dart';

import '../../layout/site_layout.dart';
import 'sections/hero_section.dart';
import 'sections/why_riffbyte_section.dart';
import 'sections/products_section.dart';
import 'sections/process_section.dart';
import '/widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            WhyRiffbyteSection(),
            ProductsSection(),
            ProcessSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}