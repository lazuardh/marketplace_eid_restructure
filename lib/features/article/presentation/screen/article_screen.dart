import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../lib.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: FormBuilder(
              child: Container(
            decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(10)),
            child: FormBuilderTextField(
              name: "search",
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: "Cari Artikel",
                  hintStyle: AppTextStyle.regular.copyWith(
                    color: AppColors.neutral300,
                  ),
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    IconlyBroken.search,
                    size: 20,
                  )),
            ),
          )),
          flexibleSpace: BuildAppbar(size: size),
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            // onTap: () => Navigator.pushNamed(context, RouteName.detailArtikel),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: size.width * 0.05),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        child: Text(
                          "7 Merk Semen Pilihan Terbaik di Indonesia untuk bangun rumah Impian",
                          style: AppTextStyle.regular.copyWith(
                            color: AppColors.neutral500,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage('https://picsum.photos/200'),
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dinding",
                        style: AppTextStyle.regular.copyWith(
                          color: AppColors.primary900,
                        ),
                      ),
                      const Icon(
                        Icons.share,
                        color: AppColors.neutral300,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.neutral200,
        ),
      ),
    );
  }
}

class BuildAppbar extends StatelessWidget {
  const BuildAppbar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.2,
          color: AppColors.primary,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: ClipPath(
            clipper: CustomHeaderClipper(),
            child: Container(
              height: size.height * 0.2,
              width: size.width * 0.45,
              color: AppColors.primary800,
            ),
          ),
        ),
      ],
    );
  }
}
