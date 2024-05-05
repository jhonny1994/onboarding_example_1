class OnboardingPageModel {
  final String title;
  final String description;
  final String image;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

final dummyPages = [
  OnboardingPageModel(
    title: 'Fast, Fluid and Secure',
    description: 'Enjoy the best of the world in the palm of your hands.',
    image: 'assets/onboarding/1.jpg',
  ),
  OnboardingPageModel(
    title: 'Connect with your friends.',
    description: 'Connect with your friends anytime anywhere.',
    image: 'assets/onboarding/2.jpg',
  ),
  OnboardingPageModel(
    title: 'Bookmark your favourites',
    description: 'Bookmark your favourite quotes to read at a leisure time.',
    image: 'assets/onboarding/3.jpg',
  ),
  OnboardingPageModel(
    title: 'Follow creators',
    description: 'Follow your favourite creators to stay in the loop.',
    image: 'assets/onboarding/4.jpg',
  ),
];
