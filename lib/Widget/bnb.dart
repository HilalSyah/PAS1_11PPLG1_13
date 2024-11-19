import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';

class AppBBN extends StatelessWidget {
  const AppBBN({
    super.key,
    this.atBottom = false, // Memberikan nilai default false
    required this.pageController,
  });

  final bool atBottom;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return NavigationView(
      onChangePage: (index) {
        pageController.jumpToPage(index);
      },
      curve: Curves.fastEaseInToSlowEaseOut,
      durationAnimation: const Duration(milliseconds: 400),
      backgroundColor: Colors.white,
      borderTopColor: Theme.of(context).brightness == Brightness.light
          ? atBottom
              ? theme.primaryColor
              : null
          : null,
      color: Colors.white,
      items: [
        ItemNavigationView(
          childAfter: const Icon(
            IconlyBold.profile,
            color: Colors.black,
            size: 35,
          ),
          childBefore: const Icon(
            IconlyBroken.profile,
            color: Colors.black,
            size: 30,
          ),
        ),
        ItemNavigationView(
          childAfter: const Icon(
            IconlyBold.heart,
            color: Colors.black,
            size: 35,
          ),
          childBefore: const Icon(
            IconlyBroken.heart,
            color: Colors.black,
            size: 30,
          ),
        ),
        ItemNavigationView(
          childAfter: const Icon(
            IconlyBold.buy,
            color: Colors.black,
            size: 35,
          ),
          childBefore: const Icon(
            IconlyBroken.buy,
            color: Colors.black,
            size: 30,
          ),
        ),
        ItemNavigationView(
          childAfter: const Icon(
            IconlyBold.category,
            color: Colors.black,
            size: 35,
          ),
          childBefore: const Icon(
            IconlyBroken.category,
            color: Colors.black,
            size: 30,
          ),
        ),
      ],
    );
  }
}
