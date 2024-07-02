import 'package:flutter/cupertino.dart';
import '../../../../lib.dart';

class BottomNavigationEntity {
  final Widget icon;
  final Widget activeIcon;
  final String label;

  BottomNavigationEntity({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  static List<BottomNavigationEntity> bottomNavList = [
    BottomNavigationEntity(
      icon: const Icon(CupertinoIcons.house_alt),
      activeIcon: const Icon(
        CupertinoIcons.house_alt,
        color: AppColors.primary,
      ),
      label: "Home",
    ),
    BottomNavigationEntity(
      icon: const Icon(CupertinoIcons.doc_append),
      activeIcon: const Icon(
        CupertinoIcons.doc_append,
        color: AppColors.primary,
      ),
      label: "Article",
    ),
    BottomNavigationEntity(
      icon: const Icon(CupertinoIcons.heart),
      activeIcon: const Icon(
        CupertinoIcons.heart,
        color: AppColors.primary,
      ),
      label: "Favorite",
    ),
    BottomNavigationEntity(
      icon: const Icon(CupertinoIcons.time),
      activeIcon: const Icon(
        CupertinoIcons.time,
        color: AppColors.primary,
      ),
      label: "History",
    ),
    BottomNavigationEntity(
      icon: const Icon(CupertinoIcons.person_2_alt),
      activeIcon: const Icon(
        CupertinoIcons.person_2_alt,
        color: AppColors.primary,
      ),
      label: "Profile",
    )
  ];
}
