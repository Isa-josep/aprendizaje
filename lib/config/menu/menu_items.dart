import 'package:flutter/material.dart';

class MenuItem{ 
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems = <MenuItem>[

  // MenuItem(
  //   title: 'Inicio',
  //   subTitle: 'Página principal',
  //   link: '/home_view',
  //   icon: Icons.home,
  // ),

  MenuItem(
    title: 'Memorama',
    subTitle: 'Página principal',
    link: '/m',
    icon: Icons.memory_sharp,
  ),

  MenuItem(
    title: 'Desafios Matematicos',
    subTitle: 'Página principal',
    link: '/d',
    icon: Icons.calculate_rounded,
  ),

  MenuItem(
    title: 'Palabras',
    subTitle: 'Página principal',
    link: '/p',
    icon: Icons.text_fields_rounded,
  ),

  MenuItem(
    title: 'Inicio',
    subTitle: 'Página principal',
    link: '/home_view',
    icon: Icons.home,
  ),

  MenuItem(
    title: 'Inicio',
    subTitle: 'Página principal',
    link: '/home_view',
    icon: Icons.home,
  ),

  MenuItem(
    title: 'Inicio',
    subTitle: 'Página principal',
    link: '/home_view',
    icon: Icons.home,
  ),

  
  
  
];