import 'package:flutter/material.dart';
import '../../../../lib.dart';

class BuildKategori extends StatelessWidget {
  const BuildKategori({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.neutral300,
              blurRadius: 24,
              offset: Offset(4, 8),
            ),
          ],
          color: AppColors.neutral100,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.cancel_sharp,
                color: AppColors.neutral200,
                size: 25,
              ),
              const SizedBox(width: 10),
              Text(
                "Kategori",
                style: AppTextStyle.bold.copyWith(
                  color: AppColors.neutral400,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dinding",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const Icon(
                  Icons.done,
                  color: AppColors.primary900,
                  size: 30,
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Elektrikal",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const Icon(
                  Icons.done,
                  color: AppColors.primary900,
                  size: 30,
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lantai",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const Icon(
                  Icons.done,
                  color: AppColors.primary900,
                  size: 30,
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mekanikal",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const Icon(
                  Icons.done,
                  color: AppColors.primary900,
                  size: 30,
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pintu & Jendela",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const Icon(
                  Icons.done,
                  color: AppColors.primary900,
                  size: 30,
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Plafon & Atap",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const Icon(
                  Icons.done,
                  color: AppColors.primary900,
                  size: 30,
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Plumbing",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const Icon(
                  Icons.done,
                  color: AppColors.primary900,
                  size: 30,
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sanitari",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const Icon(
                  Icons.done,
                  color: AppColors.primary900,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
