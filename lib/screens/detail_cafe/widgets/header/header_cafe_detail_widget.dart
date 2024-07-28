import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderCafeDetailWidget extends StatelessWidget {
  const HeaderCafeDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailCafeViewModel>(context, listen: false).selectedCafe;
    return Stack(
      children: [
        Image.network(
          provider!.image,
          fit: BoxFit.cover,
          height: 260,
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorConstant.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: BoxConstant.shadow,
              ),
              width: 350,
              margin: const EdgeInsets.only(top: 160),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  bottom: 25,
                  left: 27,
                  right: 27,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.name,
                      style: TextStyleConstant.nameDetailCafe,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      provider.address,
                      style: TextStyleConstant.headerRegularDetailCafe,
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      color: ColorConstant.gray7.withOpacity(0.3),
                      height: 0.5,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.schedule,
                          color: ColorConstant.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          provider.operationalHour,
                          style: TextStyleConstant.headerRegularDetailCafe,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          color: ColorConstant.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          provider.whatsappNumber ?? '-',
                          style: TextStyleConstant.headerRegularDetailCafe,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 143),
              width: 125,
              height: 30,
              decoration: BoxDecoration(
                color: ColorConstant.primary,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  provider.isOpen ? 'Open' : 'Closed',
                  style: TextStyleConstant.statusDetailCafe
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}