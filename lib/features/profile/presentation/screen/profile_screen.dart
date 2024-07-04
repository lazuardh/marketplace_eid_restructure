import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lottie/lottie.dart';
import '../../../../lib.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: const Icon(

        //   Icons.arrow_back_ios_new_outlined,
        //   color: AppColors.neutral100,
        // ),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map> listMenu = [
    {
      "icon": const Icon(IconlyLight.profile,
          color: AppColors.neutral500, size: 30),
      "title": "Profile Pengguna"
    },
    {
      "icon":
          const Icon(IconlyLight.chat, color: AppColors.neutral500, size: 30),
      "title": "Umpan Balik"
    },
    {
      "icon": const Icon(IconlyLight.infoSquare,
          color: AppColors.neutral500, size: 30),
      "title": "FAQ"
    },
    {
      "icon":
          const Icon(IconlyLight.logout, color: AppColors.neutral500, size: 30),
      "title": "Log Out"
    }
  ];

  List<Map> listpesan = [
    {
      "icon":
          const Icon(IconlyLight.wallet, color: AppColors.neutral500, size: 30),
      "title": "Belum dibayar",
    },
    {
      "icon":
          const Icon(IconlyLight.bag, color: AppColors.neutral500, size: 30),
      "title": "Dikemas"
    },
    {
      "icon":
          const Icon(IconlyLight.send, color: AppColors.neutral500, size: 30),
      "title": "Dikirim"
    },
    {
      "icon":
          const Icon(IconlyLight.star, color: AppColors.neutral500, size: 30),
      "title": "Beri nilai"
    }
  ];
  @override
  Widget build(BuildContext context) {
    // final authViewModel = Provider.of<AuthViewModel>(context);
    // final penggunaViewModel = Provider.of<PenggunaViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          child: SizedBox(
            height: size.height * 0.2,
            width: size.width,
            child: Center(
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 1)),
                  ],
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: const DecorationImage(
                      scale: 0.5,
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/people.png")),
                ),
              ),
            ),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.7,
          maxChildSize: 1,
          builder: (context, controller) => ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.neutral100,
              ),
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 16,
                        left: size.width * 0.05,
                        right: size.width * 0.05,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.neutral200.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dani Kurniawati",
                                            // penggunaViewModel.dataPengguna !=
                                            //         null
                                            //     ? penggunaViewModel
                                            //         .dataPengguna!.namaPengguna
                                            //     : "-",
                                            style: AppTextStyle.bold.copyWith(
                                              color: AppColors.primary900,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "Sleman, Yogyakarta",
                                            // "${penggunaViewModel.wilayahData != null ? penggunaViewModel.wilayahData!.wilayah : ""}, ${penggunaViewModel.prov != null ? penggunaViewModel.prov! : ""}",
                                            style:
                                                AppTextStyle.regular.copyWith(
                                              color: AppColors.neutral500,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.pushNamed(
                                          //         context, RouteName.editProfil)
                                          //     .then((value) =>
                                          //         penggunaViewModel.getUser());
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(
                                                Icons.mode_edit_outline_rounded,
                                                color: AppColors.primary,
                                                size: 12),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "Edit Profil",
                                              style: AppTextStyle.bold.copyWith(
                                                color: AppColors.primary,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 45,
                                            width: 45,
                                            child: Image.asset(
                                                "assets/images/koin.png"),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Poin saat ini",
                                                  style: AppTextStyle.semiBold
                                                      .copyWith(
                                                    color: AppColors.neutral100,
                                                  ),
                                                ),
                                                Text(
                                                  "2908",
                                                  style: AppTextStyle.semiBold
                                                      .copyWith(
                                                    color: AppColors.neutral100,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        // Navigator.pushNamed(
                                                        //     context,
                                                        //     RouteName
                                                        //         .riwayatPoin);
                                                      },
                                                      child: Text(
                                                        "Riwayat Poin",
                                                        style: AppTextStyle
                                                            .medium
                                                            .copyWith(
                                                          color: AppColors
                                                              .neutral100,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontSize:
                                                              AppFontSize.small,
                                                        ),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.06),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Pesanan Saya",
                                  style: AppTextStyle.bold.copyWith(
                                    color: AppColors.neutral500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: size.height * 0.12,
                              width: size.width,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.08,
                                    right: size.width * 0.08,
                                    top: size.height * 0.03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.pushNamed(
                                            //     context, RouteName.pesananSaya);
                                          },
                                          child: Column(
                                            children: [
                                              listpesan[0]["icon"],
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: size.height * 0.01,
                                                ),
                                                child: Text(
                                                  listpesan[0]["title"],
                                                  style: AppTextStyle.regular
                                                      .copyWith(
                                                    color: AppColors.neutral500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.pushNamed(
                                            //     context, RouteName.pesananSaya);
                                          },
                                          child: Column(
                                            children: [
                                              listpesan[1]["icon"],
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: size.height * 0.01,
                                                ),
                                                child: Text(
                                                  listpesan[1]["title"],
                                                  style: AppTextStyle.regular
                                                      .copyWith(
                                                    color: AppColors.neutral500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.pushNamed(
                                            //     context, RouteName.pesananSaya);
                                          },
                                          child: Column(
                                            children: [
                                              listpesan[2]["icon"],
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: size.height * 0.01,
                                                ),
                                                child: Text(
                                                  listpesan[2]["title"],
                                                  style: AppTextStyle.regular
                                                      .copyWith(
                                                    color: AppColors.neutral500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.pushNamed(
                                            //     context, RouteName.pesananSaya);
                                          },
                                          child: Column(
                                            children: [
                                              listpesan[3]["icon"],
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: size.height * 0.01,
                                                ),
                                                child: Text(
                                                  listpesan[3]["title"],
                                                  style: AppTextStyle.regular
                                                      .copyWith(
                                                    color: AppColors.neutral500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ]),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    // Navigator.pushNamed(
                                    //     context, RouteName.detailProfile);
                                    break;
                                  case 1:
                                    // Navigator.pushNamed(
                                    //     context, RouteName.ulasan);
                                    break;
                                  case 2:
                                    // Navigator.pushNamed(context, RouteName.faq);
                                    break;

                                  case 3:
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text("Keluar"),
                                              content: const Text(
                                                  "Apakah anda yakin untuk keluar dari aplikasi ini?"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      "Batal",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .accentOrange500),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      // authViewModel.logOut();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackbarAlert(
                                                                  size, 1));
                                                      // Navigator
                                                      //     .pushNamedAndRemoveUntil(
                                                      //         context,
                                                      //         RouteName.welcome,
                                                      //         (route) => false);
                                                    },
                                                    child: const Text(
                                                      "Keluar",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primary),
                                                    )),
                                              ],
                                            ));
                                    break;
                                  default:
                                }
                              },
                              dense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05, vertical: 0),
                              leading: listMenu[index]["icon"],
                              title: Text(
                                listMenu[index]["title"],
                                style: AppTextStyle.medium.copyWith(
                                  color: AppColors.neutral500,
                                ),
                              ),
                              trailing: const Icon(
                                IconlyLight.arrowRight2,
                                size: 24,
                              ),
                            ),
                        separatorBuilder: (context, index) => const Divider(
                              thickness: 2,
                            ),
                        itemCount: listMenu.length),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SnackBar snackbarAlert(Size size, int condition) {
    late String message;
    late String image;

    switch (condition) {
      case 1:
        message = "Anda berhasil keluar!";
        image = "assets/lotie/success_AppColors.primary.json";
        break;
      default:
    }

    return SnackBar(
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.only(
            bottom: size.height * 0.5,
            left: size.width * 0.2,
            right: size.width * 0.2),
        backgroundColor: AppColors.neutral100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        behavior: SnackBarBehavior.floating,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(image, width: 80, height: 80),
            Text(
              message,
              style: AppTextStyle.regular.copyWith(
                color: AppColors.neutral500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
