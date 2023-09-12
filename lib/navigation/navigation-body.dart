import 'package:adoptable_paws/Business/setting/ui/setting_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavigationBody {
  static List<Widget> pageBody = <Widget>[
    Center(child: Text("Home")),
    Center(child: Text("History")),
    const SettingUi(),
  ];

  static List<Widget> navigationDestination = <Widget>[
    const NavigationDestination(
      icon: Icon(CupertinoIcons.home),
      label: 'Home',
    ),
    NavigationDestination(
      //selectedIcon: Icon(CupertinoIcons.heart_solid),
      icon: Icon(MdiIcons.history),
      label: 'History',
    ),
    const NavigationDestination(
      selectedIcon: Icon(CupertinoIcons.settings_solid),
      icon: Icon(CupertinoIcons.settings),
      label: 'Settings',
    ),
  ];
}
