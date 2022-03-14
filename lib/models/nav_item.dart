import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavItem {
  final int id;
  final IconData icon;
  final String label;

  NavItem({required this.id, required this.icon, required this.label});
}

List<NavItem> navItems = [
  NavItem(id: 0, icon: Icons.home, label: "홈"),
  NavItem(id: 1, icon: FontAwesomeIcons.user, label: "내 단어"),
  NavItem(id: 2, icon: FontAwesomeIcons.coins, label: "리워드"),
  NavItem(id: 3, icon: FontAwesomeIcons.percent, label: "달성률"),
  NavItem(id: 4, icon: Icons.settings, label: "설정"),
];
