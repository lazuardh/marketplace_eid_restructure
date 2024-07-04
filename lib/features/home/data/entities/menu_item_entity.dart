class MenuItemEntity {
  String icon;
  String label;

  MenuItemEntity({required this.icon, required this.label});

  static List<MenuItemEntity> menuItemList = [
    MenuItemEntity(icon: "assets/icons/dinding.png", label: "Dinding"),
    MenuItemEntity(icon: "assets/icons/electrical.png", label: "Elektrikal"),
    MenuItemEntity(icon: "assets/icons/electrical.png", label: "Lantai"),
    MenuItemEntity(icon: "assets/icons/mekanikal.png", label: "Mekanikal"),
    MenuItemEntity(icon: "assets/icons/pintu.png", label: "Pintu"),
    MenuItemEntity(icon: "assets/icons/plafon.png", label: "Atap"),
    MenuItemEntity(icon: "assets/icons/plumbing.png", label: "Plumbing"),
    MenuItemEntity(icon: "assets/icons/sanitasi.png", label: "Sanitari"),
  ];
}
