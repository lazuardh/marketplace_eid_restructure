import 'package:flutter/material.dart';

import '../../../../lib.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarPrimaryWithSeach(
            controller: controller,
            hint: "Search Article",
            onPressed: () {},
            onSubmitted: (value) {},
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  // onTap: () => Navigator.pushNamed(context, RouteName.detailArtikel),
                  child: ColumnPadding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: size.width * 0.05),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: Text(
                              '7 Merk Semen Pilihan Terbaik di Indonesia untuk bangun rumah Impian',
                              style: AppTextStyle.regular.copyWith(
                                color: AppColors.neutral500,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const CustomImageWrapper(
                            image: 'https://picsum.photos/200',
                            width: 130,
                            height: 75,
                            borderRadius: AppBorderRadius.normal,
                            isNetworkImage: true,
                          ),
                        ],
                      ),
                      const Gap(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dinding',
                            style: AppTextStyle.regular.copyWith(
                              color: AppColors.primary900,
                            ),
                          ),
                          const Icon(
                            Icons.share,
                            color: AppColors.neutral300,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.neutral200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
