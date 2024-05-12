import 'package:coffee_spot/constants/color_constant.dart';
// import 'package:coffee_spot/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

class SearchFieldHomeWidget extends StatefulWidget {
  const SearchFieldHomeWidget({super.key});

  @override
  State<SearchFieldHomeWidget> createState() => _SearchFieldHomeWidgetState();
}

class _SearchFieldHomeWidgetState extends State<SearchFieldHomeWidget> {
  TextEditingController searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search');
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: ColorConstant.white,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.black.withOpacity(0.12),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: TextField(
          enabled: false,
          cursorColor: ColorConstant.primary,
          controller: searchInputController,
          textInputAction: TextInputAction.search,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            color: ColorConstant.gray7,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: ColorConstant.primary,
            ),
            contentPadding: const EdgeInsets.only(left: 50, right: 17, top: 12),
            hintText: 'Search any cafe',
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: ColorConstant.gray6.withOpacity(0.8),
            ),
            border: InputBorder.none,
            focusColor: ColorConstant.primary,
          ),
        ),
      ),
    );
  }
}
