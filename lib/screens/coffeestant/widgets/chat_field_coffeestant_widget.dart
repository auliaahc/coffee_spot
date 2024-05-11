import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/coffeestant/coffestant_view_model.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatFieldCoffeestantWidget extends StatelessWidget {
  const ChatFieldCoffeestantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<CoffeestantViewModel>(
        builder: (context, coffeestantViewModel, _) {
          return DashChat(
            messageOptions: MessageOptions(containerColor: ColorConstant.white),
            inputOptions: InputOptions(
              inputToolbarStyle: BoxConstant.decoration,
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Ask Coffeestant something...',
                hintStyle: TextStyleConstant.inputFieldCoffeestant,
                border: InputBorder.none,
                focusColor: ColorConstant.primary,
              ),
            ),
            currentUser: coffeestantViewModel.currentUser,
            onSend: (message) => coffeestantViewModel.sendMessage(message),
            messages: coffeestantViewModel.messages,
          );
        },
      ),
    );
  }
}
