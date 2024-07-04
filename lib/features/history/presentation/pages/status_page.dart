import 'package:flutter/material.dart';
import '../../../../lib.dart';

class BuildStatus extends StatefulWidget {
  const BuildStatus({super.key, required this.isActived});
  final int isActived;

  @override
  State<BuildStatus> createState() => _BuildStatusState();
}

class _BuildStatusState extends State<BuildStatus> {
  int? isSelected;
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
                "Mau lihat status apa ?",
                style: AppTextStyle.bold.copyWith(
                  color: AppColors.neutral400,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Menunggu Konfirmasi",
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.neutral400,
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
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Diproses",
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.neutral400,
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
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dikirim",
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.neutral400,
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
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected == null) {}
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tiba Ditujuan",
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.neutral400,
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
          ),
          const Divider(thickness: 1, color: AppColors.neutral200),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dikomplain",
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.neutral400,
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
          ),
        ],
      ),
    );
  }
}
