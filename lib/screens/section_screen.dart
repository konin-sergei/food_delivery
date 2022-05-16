import 'package:flutter/material.dart';

import '../widgets/app_bottom_navigation_bar.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Section(),
      bottomNavigationBar: AppBottomNavigationBar(currentPage: 0),
    );
  }
}

class Section extends StatelessWidget {
  const Section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("aas"),
    );
  }
}
