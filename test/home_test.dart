import 'package:coffee_spot/constants/image_constant.dart';
import 'package:coffee_spot/screens/home/widgets/header/header_home_widget.dart';
import 'package:coffee_spot/screens/home/widgets/search_field/search_field_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home Screen harus dapat menampilkan widget', () {
    testWidgets('HeaderHomeWidget test', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeaderHomeWidget(),
          ),
        ),
      );
      expect(find.text('Hello User'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is CircleAvatar &&
              widget.backgroundImage is AssetImage &&
              (widget.backgroundImage as AssetImage).assetName ==
                  ImageConstant.userPhotoProfile),
          findsOneWidget);
    });
    testWidgets('SearchFieldHomeWidget test', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SearchFieldHomeWidget(),
          ),
        ),
      );
      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      final textFieldFinder = find.byType(TextField);
      final textFieldWidget = tester.widget<TextField>(textFieldFinder);
      expect(textFieldWidget.enabled, false);
      expect(textFieldWidget.textInputAction, TextInputAction.search);
      expect(
        textFieldWidget.style,
        const TextStyle(
          fontSize: 14,
          color: Color(0xff474f5a),
          fontWeight: FontWeight.w400,
        ),
      );
      expect(textFieldWidget.decoration?.hintText, 'Search any cafe');
    });
  });
}
