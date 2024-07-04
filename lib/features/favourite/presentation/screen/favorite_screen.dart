import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../lib.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: FormBuilder(
              child: Container(
            decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.neutral300)),
            child: FormBuilderTextField(
              name: "search",
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: "Cari Favorite",
                  hintStyle: AppTextStyle.regular
                      .copyWith(color: AppColors.neutral300),
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    IconlyBroken.search,
                    size: 20,
                  )),
            ),
          )),
          actions: [
            IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, RouteName.notifikasi);
              },
              icon: const Icon(
                IconlyLight.notification,
                color: AppColors.primary900,
              ),
            ),
            IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, RouteName.chat);
              },
              icon: const Icon(
                IconlyLight.chat,
                color: AppColors.primary900,
              ),
            ),
          ],
        ),
      ),
      body: const BuildBody(),
    );
  }
}

class BuildBody extends StatefulWidget {
  const BuildBody({super.key});

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  int indexPages = 0;
  int selectedItem = 0;
  bool isChecked = false;
  int? isActive;

  List<List> options = [
    [
      "Ulasan Terbanyak",
      "Harga Tertinggi",
      "Harga Terendah",
      "Pembelian Terbanyak"
    ],
    [
      "Cashback",
      "Diskon",
    ],
    [
      "Pre Order",
      "Inden",
      "Tersedia",
      "Tidak Tersedia",
    ],
    [
      "Dinding",
      "Elektrikal",
      "Lantai",
      "Mekanikal",
      "Pintu dan Jendela",
      "Plafon dan Atap",
      "Plumbing",
      "Sanitari",
    ],
  ];

  List<Widget> kategoriSelected = [
    const BuildUrutkan(),
    const BuildPenawaran(),
    const BuildStok(),
    const BuildKategori(),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int indexing = 0;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildmenuItem(0, "Urutan", size),
                buildmenuItem(1, "Penawaran", size),
                buildmenuItem(2, "Stok", size),
                buildmenuItem(3, "Kategori", size),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "3 Barang",
                style: AppTextStyle.regular.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
              TextButton(
                onPressed: () {
                  if (isActive == null) {
                    setState(() {
                      isActive = indexing;
                    });
                  } else if (isActive != null && isActive == indexing) {
                    setState(() {
                      isActive = null;
                    });
                  }
                },
                child: Text(
                  "Atur",
                  style: AppTextStyle.semiBold.copyWith(
                    color: AppColors.primary900,
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(color: AppColors.neutral200, thickness: 3),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                childAspectRatio: 0.43,
                mainAxisSpacing: 16,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.neutral200),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.025),
                            child: Center(
                              child: Image.asset('assets/images/toilet.png'),
                            ),
                          ),
                          if (isActive != null && isActive == indexing) ...[
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Checkbox(
                                value: isChecked,
                                activeColor: AppColors.primary900,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            )
                          ]
                        ],
                      ),
                      const Divider(thickness: 3, color: AppColors.primary900),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Aerozen Shower Toilet CEAS5312 - 1000422CO",
                          style: AppTextStyle.bold.copyWith(
                            color: AppColors.neutral500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: SizedBox(
                          child: Row(
                            children: [
                              const Icon(
                                IconlyBroken.home,
                                color: AppColors.primary900,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "PT Wahana Duta Jaya",
                                style: AppTextStyle.regular.copyWith(
                                  color: AppColors.neutral300,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Rp. 55.120.000 / unit",
                          style: AppTextStyle.bold.copyWith(
                            color: AppColors.neutral300,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              IconlyBroken.location,
                              color: AppColors.primary900,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "DKI Jakarta",
                              style: AppTextStyle.regular.copyWith(
                                color: AppColors.neutral300,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4),
                        child: Row(
                          children: [
                            const Icon(
                              IconlyBold.star,
                              color: AppColors.accentYellow200,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "4.7 | Terjual 40+",
                              style: AppTextStyle.regular.copyWith(
                                color: AppColors.neutral300,
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, RouteName.keranjang);
                        },
                        child: Center(
                          child: Container(
                            width: size.width,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primary900),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "+ Keranjang",
                                style: AppTextStyle.regular.copyWith(
                                  color: AppColors.primary900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        if (isActive != null && isActive == indexing) ...[
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Hapus",
                style: AppTextStyle.regular.copyWith(
                  color: AppColors.neutral100,
                ),
              ),
            ),
          )
        ]
      ],
    );
  }

  Widget buildmenuItem(int index, String kategori, Size size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = index;
        });
        showBottomSheet(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) => Container(
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
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.dangerous,
                              color: AppColors.neutral300,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            kategori,
                            style: AppTextStyle.bold.copyWith(
                              color: AppColors.neutral300,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                            thickness: 2,
                            color: AppColors.neutral200,
                          ),
                          itemCount: options[selectedItem].length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      indexPages = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          options[selectedItem][index],
                                          style: AppTextStyle.regular.copyWith(
                                            color: AppColors.neutral500,
                                          ),
                                        ),
                                        indexPages == index
                                            ? const Icon(
                                                Icons.done,
                                                color: AppColors.primary900,
                                                size: 30,
                                              )
                                            : const Text(""),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin:
            EdgeInsets.symmetric(horizontal: size.width * 0.01, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(
                color: selectedItem == index
                    ? AppColors.primary900
                    : AppColors.neutral500),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(
              kategori,
              style: AppTextStyle.regular.copyWith(
                color: selectedItem == index
                    ? AppColors.primary900
                    : AppColors.neutral500,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              IconlyLight.arrowDown2,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
