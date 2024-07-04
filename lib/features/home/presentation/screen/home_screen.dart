import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../.././../../lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final PageController bannerController = PageController();
  final List<HeaderIconEntity> _headerIconList =
      HeaderIconEntity.headerIconList;
  final List<MenuItemEntity> _menuItemList = MenuItemEntity.menuItemList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _backgroundWrapper(
      child: Column(
        children: [
          RowPadding(
            padding: const EdgeInsets.all(12),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: ResponsiveUtils(context).getMediaQueryWidth() * 0.5,
                height: 40,
                child: CustomTextFormFieldSearch(
                  hint: "Cari Artikel",
                  controller: searchController,
                  onSubmitted: (value) {},
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _headerIconList
                    .map(
                      (icon) => IconButton(
                        onPressed: () {},
                        icon: Icon(
                          icon.icon,
                          color: AppColors.primary900,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ColumnPadding(
                padding: const EdgeInsets.all(12),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:
                        ResponsiveUtils(context).getMediaQueryHeight() * 0.2,
                    child: PageView(
                      controller: bannerController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset("assets/images/Banner1.png"),
                        Image.asset("assets/images/Banner1.png"),
                        Image.asset("assets/images/Banner1.png"),
                        Image.asset("assets/images/Banner1.png"),
                        Image.asset("assets/images/Banner1.png"),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: ResponsiveUtils(context).getMediaQueryHeight() *
                          0.005,
                      child: SmoothPageIndicator(
                        controller: bannerController,
                        count: 5,
                        effect: const ScrollingDotsEffect(
                          dotColor: AppColors.neutral200,
                          activeDotColor: AppColors.primary,
                          dotWidth: 4,
                          dotHeight: 4,
                        ),
                      ),
                    ),
                  ),
                  const Gap(height: 15),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 18.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: _menuItemList.length,
                    itemBuilder: (context, index) {
                      final data = _menuItemList[index];
                      return CustomMenuItem(
                        data.label,
                        icon: data.icon,
                        maxLine: 1,
                      );
                    },
                  ),
                  const Gap(height: 15),
                  Text(
                    "Diskon Spesial",
                    style: AppTextStyle.bold.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Berakhir dalam",
                            style: AppTextStyle.regular.copyWith(
                              color: AppColors.neutral500,
                              fontSize: AppFontSize.small,
                            ),
                          ),
                          const Gap(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color.fromARGB(255, 228, 27, 13),
                            ),
                            child: Text(
                              " 01 : 12 : 59",
                              style: AppTextStyle.semiBold.copyWith(
                                color: AppColors.neutral100,
                                fontSize: AppFontSize.extraSmall,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Lihat Semua",
                        style: AppTextStyle.semiBold.copyWith(
                          color: AppColors.primary,
                          fontSize: AppFontSize.extraSmall,
                        ),
                      ),
                    ],
                  ),
                  const Gap(height: 10),
                  Container(
                    height: size.height * 0.46,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                width: size.width * 0.35,
                                height: size.height * 0.07,
                                decoration: const BoxDecoration(
                                    color: AppColors.accentYellow400,
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(100))),
                                child: Text(
                                  "SALE",
                                  style: AppTextStyle.bold.copyWith(
                                    color:
                                        const Color.fromARGB(255, 228, 27, 13),
                                    fontSize: AppFontSize.big,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Gap(height: size.height * 0.05),
                              Text(
                                "DISKON MULAI",
                                style: AppTextStyle.bold.copyWith(
                                  color: AppColors.accentYellow300,
                                ),
                              ),
                              Text(
                                "40 %",
                                style: AppTextStyle.bold.copyWith(
                                  color: AppColors.accentYellow300,
                                  fontSize: AppFontSize.big,
                                ),
                              ),
                              Gap(height: size.height * 0.02),
                              Image.asset(
                                "assets/images/toilet.png",
                              )
                            ],
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                                horizontal: size.width * 0.015),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, RouteName.detailProduk);
                              },
                              child: CustomCardProduk(
                                imageProduct: "assets/images/toilet.png",
                                colorCategory1:
                                    const Color.fromARGB(255, 4, 143, 29),
                                colorCategory2:
                                    const Color.fromARGB(255, 115, 200, 127),
                                category: "Sedang Diskon",
                                title: "Aerozen Shower Toilet CEAS5312 - HOE",
                                distributor: "PT Wahana Duta Nusantara",
                                height: ResponsiveUtils(context)
                                        .getMediaQueryHeight() *
                                    0.4,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const Gap(height: 15),
                  _headerCategory("Brand", "Lihat Semua"),
                  SizedBox(
                    height: size.height * 0.18,
                    width: size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                          vertical: size.height * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/images/image 7.png"),
                              Image.asset("assets/images/image 9.png"),
                              Image.asset("assets/images/image 8.png"),
                              Image.asset("assets/images/image10.png"),
                            ],
                          ),
                          Gap(height: size.height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/images/image 11.png"),
                              Image.asset("assets/images/image 12.png"),
                              Image.asset("assets/images/image 13.png"),
                              Image.asset("assets/images/image 14.png"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  _headerCategory("Baru Rilis", "Lihat Semua"),
                  const Gap(height: 15),
                  Container(
                    height: size.height * 0.48,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Row(
                            children: const [],
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, RouteName.detailProduk);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01,
                                  horizontal: size.width * 0.015),
                              child: const CustomCardProduk(
                                imageProduct: "assets/images/toilet.png",
                                colorCategory1: Color.fromARGB(255, 2, 62, 110),
                                colorCategory2:
                                    Color.fromARGB(255, 124, 186, 236),
                                category: " Baru Rilis",
                                title: "Aerozen Shower Toilet CEAS5312 - HOE",
                                distributor: "PT Wahana Duta Nusantara",
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const Gap(height: 15),
                  _headerCategory("Paling Populer", "Lihat Semua"),
                  const Gap(height: 10),
                  Container(
                    height: size.height * 0.45,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const Row(
                            children: const [],
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                                horizontal: size.width * 0.015),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, RouteName.detailProduk);
                              },
                              child: const CustomCardProduk(
                                imageProduct: "assets/images/toilet.png",
                                colorCategory1:
                                    Color.fromARGB(255, 140, 10, 10),
                                colorCategory2:
                                    Color.fromARGB(255, 209, 99, 99),
                                category: " Produk Populer",
                                title: "Aerozen Shower Toilet CEAS5312 - HOE",
                                distributor: "PT Wahana Duta Nusantara",
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const Gap(height: 15),
                  _headerCategory("Hanya Untukmu", "Lihat Semua"),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                        horizontal: size.width * 0.05),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.43,
                      mainAxisSpacing: size.height * 0.03,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const CustomCardProduk(
                        imageProduct: "assets/images/toilet.png",
                        category: '',
                        title: "Aerozen Shower Toilet CEAS5312 - HOE",
                        colorCategory1: AppColors.neutral100,
                        colorCategory2: AppColors.neutral100,
                        border: AppColors.neutral200,
                        distributor: "PT Wahana Duta Nusantara",
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _headerCategory(String category, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
          style: AppTextStyle.bold.copyWith(
            color: AppColors.neutral500,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            detail,
            style: AppTextStyle.semiBold.copyWith(
              color: AppColors.primary,
              fontSize: AppFontSize.small,
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class _backgroundWrapper extends StatelessWidget {
  final Widget _child;
  const _backgroundWrapper({
    Key? key,
    required Widget child,
  })  : _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.3,
          color: AppColors.primary,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: ClipPath(
            clipper: CustomHeaderClipper(),
            child: Container(
              height: size.height * 0.3,
              width: size.width * 0.55,
              color: AppColors.primary800,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: ResponsiveUtils(context).getResponsivePaddingTop(),
          ),
          decoration: const BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: _child,
        ),
      ],
    );
  }
}
