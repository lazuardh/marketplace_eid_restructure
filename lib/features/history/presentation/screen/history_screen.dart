import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../lib.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: FormBuilder(
              child: Container(
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.neutral300),
            ),
            child: FormBuilderTextField(
              name: "search",
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: "Cari Transaksi",
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
                // Navigator.pushNamed(context, RouteName.keranjang);
              },
              icon: const Icon(
                IconlyLight.buy,
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
      body: const BuildBodyHistory(),
    );
  }
}

class BuildBodyHistory extends StatefulWidget {
  const BuildBodyHistory({super.key});

  @override
  State<BuildBodyHistory> createState() => _BuildBodyHistoryState();
}

class _BuildBodyHistoryState extends State<BuildBodyHistory> {
  int indexPages = 0;
  int indexOptions = 0;

  List<List> options = [
    [
      "Selesai",
      "Dibatalkan",
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
    [
      "Semua Tanggal Transaksi",
      "7 Hari Terakhir",
      "30 Hari Terakhir",
      "60 Hari Terakhir",
      "90 Hari Terakhir",
    ],
  ];

  List<Widget> pages = [
    const BuildListviewSelesai(),
    const BuildListviewDibatalkan(),
    const BuildListviewSelesai(),
    const BuildListviewDibatalkan(),
    const BuildListviewSelesai(),
    const BuildListviewDibatalkan(),
    const BuildListviewSelesai(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              children: [
                buildmenuItem(
                    "Mau lihat Status Apa ?", 0, "Semua Status", size),
                buildmenuItem(
                    "Mau lihat produk apa ?", 1, "Semua Product", size),
                buildmenuItem("Pilih Tanggal", 2, "Semua Tanggal", size),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Expanded(
          child: pages[indexPages],
        )
      ],
    );
  }

  Widget buildmenuItem(String kategori, int index, String title, Size size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          indexOptions = index;
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
                          itemCount: options[indexOptions].length,
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
                                          options[indexOptions][index],
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
              color: indexOptions == index
                  ? AppColors.primary900
                  : AppColors.neutral500,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyle.regular.copyWith(
                color: indexOptions == index
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

class BuildListviewDibatalkan extends StatelessWidget {
  const BuildListviewDibatalkan({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.01),
                      child: const Center(
                        child: Icon(
                          IconlyLight.work,
                          color: AppColors.primary900,
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Belanja",
                          style: AppTextStyle.regular.copyWith(
                            color: AppColors.neutral500,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          "17/09/2022",
                          style: AppTextStyle.regular.copyWith(
                            color: AppColors.neutral200,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  "Dibatalkan",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.primary900,
                  ),
                )
              ],
            ),
            const Divider(thickness: 2, color: AppColors.neutral200),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.01),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.neutral200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Image(
                      image: const AssetImage('assets/images/toilet.png'),
                      width: size.width * 0.1,
                    )),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aerozone Shower Toilet CEA55321-",
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                    Text(
                      "1x",
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.neutral500,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Total Pembayaran",
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.neutral400,
                    ),
                  ),
                ),
                Text(
                  "Rp. 3.100.000",
                  style: AppTextStyle.bold.copyWith(
                    color: AppColors.neutral500,
                  ),
                )
              ],
            ),
            const Divider(thickness: 2, color: AppColors.neutral200),
            Text(
              "Pesanan Telah Dibatalkan",
              style: AppTextStyle.regular.copyWith(
                color: AppColors.primary900,
              ),
            )
          ]),
        );
      },
    );
  }
}

class BuildListviewSelesai extends StatefulWidget {
  const BuildListviewSelesai({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildListviewSelesai> createState() => _BuildListviewSelesaiState();
}

class _BuildListviewSelesaiState extends State<BuildListviewSelesai> {
  int? selectedItem;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedItem = index;
            });
            // Navigator.pushNamed(context, RouteName.detailHistory);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width * 0.01),
                        child: const Center(
                          child: Icon(
                            IconlyLight.work,
                            color: AppColors.primary900,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Belanja",
                            style: AppTextStyle.regular.copyWith(
                              color: AppColors.neutral500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "17/09/2022",
                            style: AppTextStyle.regular.copyWith(
                              color: AppColors.neutral200,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        maxRadius: 10,
                        backgroundColor: AppColors.primary900,
                        child: Icon(
                          Icons.done_outlined,
                          color: AppColors.neutral100,
                          size: 10,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Selesai",
                        style: AppTextStyle.regular.copyWith(
                          color: AppColors.primary900,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Divider(thickness: 2, color: AppColors.neutral200),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                        horizontal: size.width * 0.01),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.neutral200),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Image(
                        image: const AssetImage('assets/images/toilet.png'),
                        width: size.width * 0.1,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Aerozone Shower Toilet CEA55321-",
                        style: AppTextStyle.regular.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                      Text(
                        "1x",
                        style: AppTextStyle.regular.copyWith(
                          color: AppColors.neutral500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "Total Pembayaran",
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.neutral400,
                      ),
                    ),
                  ),
                  Text(
                    "Rp. 3.100.000",
                    style: AppTextStyle.bold.copyWith(
                      color: AppColors.neutral500,
                    ),
                  )
                ],
              ),
              const Divider(thickness: 2, color: AppColors.neutral200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pesanan Telah Diterima",
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.primary900,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.04,
                            vertical: size.height * 0.01),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary900),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Beli Lagi",
                            style: AppTextStyle.regular.copyWith(
                              color: AppColors.primary900,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.04,
                            vertical: size.height * 0.01),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary900),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Beri Nilai",
                            style: AppTextStyle.regular.copyWith(
                              color: AppColors.primary900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ]),
          ),
        );
      },
    );
  }
}
