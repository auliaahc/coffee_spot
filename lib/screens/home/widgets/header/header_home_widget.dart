import 'package:coffee_spot/constants/color_constant.dart';
import 'package:flutter/material.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello User',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: ColorConstant.gray7,
                ),
              ),
              const SizedBox(height: 7),
              RichText(
                text: TextSpan(
                  text: 'What ',
                  style: TextStyle(
                    color: ColorConstant.secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                  children: [
                    TextSpan(
                      text: 'cafe',
                      style: TextStyle(color: ColorConstant.primary),
                    ),
                    const TextSpan(text: ' would you like to visit today?'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/coffee-spot-9a740.appspot.com/o/beauty-skin-care-concept-close-up-beautiful-young-asian-woman-with-perfect-face-without-blemi.jpg?alt=media&token=f4ddf14c-3dfb-469f-9f53-8eb23bd51cb4',
            ),
          ),
        ),
      ],
    );
  }
}
