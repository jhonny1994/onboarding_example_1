import 'package:flutter/material.dart';
import 'package:onboarding_example_1/features/onboarding/domain/onboarding_page_model.dart';
import 'package:onboarding_example_1/features/onboarding/presentation/onboarding_page_builder.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPageBuilder(
        pages: dummyPages,
      ),
    );
  }
}
