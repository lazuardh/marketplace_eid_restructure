import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeaderIconEntity {
  final IconData icon;

  HeaderIconEntity({required this.icon});

  static List<HeaderIconEntity> headerIconList = [
    HeaderIconEntity(icon: IconlyLight.notification),
    HeaderIconEntity(icon: IconlyLight.buy),
    HeaderIconEntity(icon: IconlyLight.chat),
  ];
}
