class WelcomePageEntity {
  final String description;
  final String images;

  WelcomePageEntity({
    required this.description,
    required this.images,
  });

  static List<WelcomePageEntity> getWelcomePageList = [
    WelcomePageEntity(
      description:
          'Buat RAB onlinemu dengan dukungan database harga terbaru dan pembaharuan secara realtime',
      images: "assets/illustrations/1.svg",
    ),
    WelcomePageEntity(
      description:
          'Seluruh data proyek yang telah dibuat dapat dengan mudah digunakan kembali untuk proyek lainny',
      images: "assets/illustrations/2.svg",
    ),
    WelcomePageEntity(
      description:
          'Membuat RAB kapanpun di manapun secara online dan gratis. Ayo gabung sekarang!',
      images: "assets/illustrations/3.svg",
    ),
  ];
}
