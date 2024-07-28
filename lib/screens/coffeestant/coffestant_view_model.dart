import 'package:coffee_spot/constants/image_constant.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class CoffeestantViewModel extends ChangeNotifier {
  final Gemini _gemini = Gemini.instance;
  final String _systemInstructions = 'Kamu adalah Coffestant, seorang assistant yang paham mengenai dunia cafe yang ada di Kota Malang beserta dengan menunya. Aku ingin kamu menjawab (jawaban hanya dalam bentuk paragraf dan berusahalah ramah): ';
  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  final ChatUser _currentUser = ChatUser(
    id: "0",
    firstName: "User",
  );
  ChatUser get currentUser => _currentUser;
  final ChatUser _geminiUser = ChatUser(
    id: "1",
    firstName: "Coffestant",
    profileImage: ImageConstant.coffeestantImage,
  );

  void sendMessage(ChatMessage chatMessage) async {
    _messages.insert(0, chatMessage);
    notifyListeners();

    try {
      String question = '$_systemInstructions ${chatMessage.text}';
      _gemini.streamGenerateContent(question).listen(
        (event) {
          ChatMessage? lastMessage = _messages.firstOrNull;
          if (lastMessage != null && lastMessage.user == _geminiUser) {
            lastMessage = _messages.removeAt(0);
            String response = event.content?.parts?.fold("", (previousValue, element) => "$previousValue${element.text}") ?? "";
            lastMessage.text += response;
            _messages.insert(0, lastMessage);
            notifyListeners();
          } else {
            String response = event.content?.parts?.fold("", (previousValue, element) => "$previousValue${element.text}") ?? "";
            ChatMessage message = ChatMessage(
              user: _geminiUser,
              createdAt: DateTime.now(),
              text: response,
            );
            _messages.insert(0, message);
            notifyListeners();
          }
        },
      );
    } catch (err) {
      throw Exception(err);
    }
  }
}