import 'package:flutter/material.dart';
import 'package:onboarding_example_1/features/onboarding/domain/onboarding_page_model.dart';

class OnboardingPageBuilder extends StatefulWidget {
  const OnboardingPageBuilder({
    super.key,
    required this.pages,
    this.onFinish,
  });

  final VoidCallback? onFinish;
  final List<OnboardingPageModel> pages;

  @override
  State<OnboardingPageBuilder> createState() => _OnboardingPageBuilderState();
}

class _OnboardingPageBuilderState extends State<OnboardingPageBuilder> {
  int currentPageIndex = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pages.length,
                onPageChanged: (value) => setState(() {
                  currentPageIndex = value;
                }),
                itemBuilder: (context, index) {
                  final currentPage = widget.pages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.575,
                        child: Image.asset(
                          currentPage.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    currentPage.title,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    currentPage.description,
                                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.pages
                            .map(
                              (item) => AnimatedContainer(
                                curve: Curves.easeInOutCubic,
                                duration: const Duration(milliseconds: 500),
                                width: currentPageIndex == widget.pages.indexOf(item) ? 32 : 8,
                                height: 8,
                                margin: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (currentPageIndex != 0)
                    IconButton.filledTonal(
                      iconSize: 32,
                      padding: const EdgeInsets.all(16),
                      onPressed: () => _pageController.animateToPage(
                        currentPageIndex - 1,
                        curve: Curves.easeInOutCubic,
                        duration: const Duration(milliseconds: 250),
                      ),
                      icon: const Icon(Icons.navigate_before),
                    ),
                  const Spacer(),
                  IconButton.filledTonal(
                    iconSize: 32,
                    padding: const EdgeInsets.all(16),
                    onPressed: () {
                      if (currentPageIndex == widget.pages.length - 1) {
                        widget.onFinish?.call();
                      } else {
                        _pageController.animateToPage(
                          currentPageIndex + 1,
                          curve: Curves.easeInOutCubic,
                          duration: const Duration(milliseconds: 250),
                        );
                      }
                    },
                    icon: Icon(
                      currentPageIndex == widget.pages.length - 1 ? Icons.done : Icons.navigate_next,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
