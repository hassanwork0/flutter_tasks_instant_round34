import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/features/intrologin/presentation/widgets/intrologin_page_background_wrapper.dart';
import 'package:r34_16/src/features/intrologin/presentation/widgets/intrologin_page_body_area.dart';
import 'package:flutter/material.dart';

class IntrologinPage extends StatelessWidget {
  const IntrologinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IntroLoginBackgroundWrapper(imageURL: AppIcons.introBackground), 
          const IntroPageBodyArea(), 
        ],
      ),
    );
  }
}