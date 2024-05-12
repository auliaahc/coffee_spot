import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:provider/provider.dart';
import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/provider/global_provider.dart';

class BottomNavigationBarGlobalWidget extends StatelessWidget {
  const BottomNavigationBarGlobalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GlobalProvider>(context);
    return MoltenBottomNavigationBar(
      barColor: ColorConstant.white,
      domeCircleColor: ColorConstant.primary,
      onTabChange: (clickedIndex) {
        provider.selectedIndex = clickedIndex;
        provider.changeTabs(context);
      },
      selectedIndex: provider.selectedIndex,
      tabs: [
        MoltenTab(
          icon: const Icon(Icons.home),
        ),
        MoltenTab(
          icon: const Icon(Icons.sms),
        ),
      ],
    );
  }
}