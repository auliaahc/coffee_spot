import 'package:coffee_spot/screens/coffeestant/widgets/app_bar_coffeestant_widget.dart';
import 'package:coffee_spot/screens/coffeestant/widgets/chat_field_coffeestant_widget.dart';
import 'package:coffee_spot/screens/coffeestant/widgets/header_coffeestant_widget.dart';
import 'package:coffee_spot/widgets/bottom_navigation_bar_global_widget.dart';
import 'package:flutter/material.dart';

class CoffeestantScreen extends StatelessWidget {
  const CoffeestantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCoffeestantWidget(),
      bottomNavigationBar: BottomNavigationBarGlobalWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            HeaderCoffeestantWidget(),
            ChatFieldCoffeestantWidget(),
          ],
        ),
      ),
    );
  }
}
