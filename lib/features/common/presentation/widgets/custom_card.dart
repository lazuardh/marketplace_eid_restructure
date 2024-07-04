import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:marketplace_eid_restructure/features/common/common.dart';
import '../../../../lib.dart';

class CustomCardProduk extends StatelessWidget {
  final String _category;
  final Color _colorCategory1;
  final Color _colorCategory2;
  final Color _border;
  final String _title;
  final String _imageProduct;
  final String _distributor;
  final String _price;
  final String _discount;
  final String _location;
  final String _rating;
  final String _terjual;
  final double? _height;
  const CustomCardProduk({
    Key? key,
    required String imageProduct,
    required String category,
    required Color colorCategory1,
    required Color colorCategory2,
    Color border = Colors.transparent,
    String title = '',
    String price = '55.120.000',
    String discount = '55.240.000',
    String location = "jakarta",
    String rating = '4.7',
    String terjual = '40+',
    double? height,
    required String distributor,
  })  : _colorCategory1 = colorCategory1,
        _colorCategory2 = colorCategory2,
        _title = title,
        _category = category,
        _border = border,
        _imageProduct = imageProduct,
        _distributor = distributor,
        _price = price,
        _discount = discount,
        _location = location,
        _rating = rating,
        _terjual = terjual,
        _height = height,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: _height,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _border),
        color: AppColors.neutral100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(height: size.height * 0.02),
          CustomImageWrapper(
            image: _imageProduct,
            width: double.infinity,
            height: size.height * 0.13,
            fit: BoxFit.contain,
            isNetworkImage: false,
          ),
          Container(
            height: size.height * 0.025,
            width: size.width,
            padding: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  _colorCategory1,
                  _colorCategory2,
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Text(
              _category,
              style: AppTextStyle.semiBold.copyWith(
                color: AppColors.neutral100,
                fontSize: AppFontSize.small,
              ),
            ),
          ),
          ColumnPadding(
            crossAxisAlignment: CrossAxisAlignment.start,
            padding: const EdgeInsets.all(4),
            children: [
              const Gap(height: 5),
              Text(
                _title,
                style: AppTextStyle.semiBold.copyWith(
                  color: AppColors.neutral500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(height: 5.0),
              Row(
                children: [
                  const Icon(
                    Icons.storefront,
                    color: AppColors.primary900,
                    size: 18,
                  ),
                  Gap(width: size.width * 0.01),
                  SizedBox(
                    width: size.width * 0.3,
                    child: Text(
                      _distributor,
                      style: AppTextStyle.semiBold.copyWith(
                        fontSize: AppFontSize.small,
                        color: AppColors.neutral200,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(height: 10),
              Text(
                "Rp. $_discount",
                style: AppTextStyle.regular.copyWith(
                  fontSize: AppFontSize.extraSmall,
                  color: AppColors.neutral200,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const Gap(height: 2),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Rp. $_price",
                      style: AppTextStyle.semiBold.copyWith(
                        color: AppColors.neutral500,
                        fontSize: AppFontSize.small,
                      ),
                    ),
                    TextSpan(
                      text: " / unit",
                      style: AppTextStyle.semiBold.copyWith(
                        color: AppColors.neutral500,
                        fontSize: AppFontSize.small,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(height: 5),
              Row(
                children: [
                  const Icon(
                    IconlyBold.location,
                    color: AppColors.primary900,
                    size: 14,
                  ),
                  const Gap(width: 5),
                  SizedBox(
                    width: size.width * 0.3,
                    child: Text(
                      _location,
                      style: AppTextStyle.semiBold.copyWith(
                        color: AppColors.neutral200,
                        fontSize: AppFontSize.small,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(height: 5),
              Row(
                children: [
                  const Icon(
                    IconlyBold.star,
                    color: AppColors.accentYellow400,
                    size: 14,
                  ),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.semiBold.copyWith(
                        color: AppColors.neutral200,
                        fontSize: AppFontSize.small,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: " $_rating | ",
                          style: AppTextStyle.semiBold.copyWith(
                            color: AppColors.neutral200,
                            fontSize: AppFontSize.small,
                          ),
                        ),
                        TextSpan(
                          text: " Terjual $_terjual",
                          style: AppTextStyle.semiBold.copyWith(
                            color: AppColors.neutral200,
                            fontSize: AppFontSize.small,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
