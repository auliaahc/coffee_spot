import 'package:coffee_spot/provider/global_provider.dart';
import 'package:coffee_spot/screens/coffeestant/coffestant_screen.dart';
import 'package:coffee_spot/screens/home/home_screen.dart';
import 'package:coffee_spot/widgets/bottom_navigation_bar_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CoffeestantScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GlobalProvider>(context);
    return Scaffold(
      body: _widgetOptions.elementAt(provider.selectedIndex),
      bottomNavigationBar: const BottomNavigationBarGlobalWidget(),
    );
  }
}