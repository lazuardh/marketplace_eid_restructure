import 'package:flutter/material.dart';
import '../../../../lib.dart';

class BuildTanggal extends StatelessWidget {
  const BuildTanggal({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.47,
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
                "Pilih Tanggal",
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
                  "Semua Tanggal Transaksi",
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
                  "7 Hari Trakhir",
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
                  "30 Hari Trakhir",
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
                  "60 Hari Trakhir",
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
                  "90 Hari Trakhir",
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
