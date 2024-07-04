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
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: size.width * 0.05,
              ),
              itemBuilder: (context, index) {
                return _BuildCardArticle(
                  title:
                      '7 Merk Semen Pilihan Terbaik di Indonesia untuk bangun rumah Impian',
                  images: 'https://picsum.photos/200',
                  category: 'Dinding',
                  onTap: () {},
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

class _BuildCardArticle extends StatelessWidget {
  final Function() _onTap;
  final String _title;
  final String _images;
  final String _category;
  // ignore: use_super_parameters
  const _BuildCardArticle({
    Key? key,
    required String title,
    required String images,
    required String category,
    required Function() onTap,
  })  : _title = title,
        _images = images,
        _category = category,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      // onTap: () => Navigator.pushNamed(context, RouteName.detailArtikel),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: ResponsiveUtils(context).getMediaQueryWidth() * 0.5,
                child: Text(
                  _title,
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              CustomImageWrapper(
                image: _images,
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
                _category,
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
  }
}
