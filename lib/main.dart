import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/screens/main_screen.dart';
import 'package:coffee_spot/utils/env/env.dart';
import 'package:coffee_spot/provider/global_provider.dart';
import 'package:coffee_spot/screens/coffeestant/coffestant_screen.dart';
import 'package:coffee_spot/screens/coffeestant/coffestant_view_model.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_screen.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:coffee_spot/screens/home/home_view_model.dart';
import 'package:coffee_spot/screens/list_cafes/most_liked/cafe_most_liked_screen.dart';
import 'package:coffee_spot/screens/list_cafes/open_cafes/open_cafes_screen.dart';
import 'package:coffee_spot/screens/list_cafes/top_rated/top_rated_cafes_screen.dart';
import 'package:coffee_spot/screens/reviews/review_screen.dart';
import 'package:coffee_spot/screens/search/search_screen.dart';
import 'package:coffee_spot/screens/search/search_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'utils/firebase/firebase_options.dart';

void main() async {
  BindingBase.debugZoneErrorsAreFatal = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Gemini.init(apiKey: Env.key);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider<DetailCafeViewModel>(
          create: (context) => DetailCafeViewModel(),
        ),
        ChangeNotifierProvider<SearchViewModel>(
          create: (context) {
            final homeViewModel =
                Provider.of<HomeViewModel>(context, listen: false);
            return SearchViewModel(homeViewModel);
          },
        ),
        ChangeNotifierProvider<GlobalProvider>(
          create: (context) => GlobalProvider(),
        ),
        ChangeNotifierProvider<CoffeestantViewModel>(
          create: (context) => CoffeestantViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: ColorConstant.gray1),
          scaffoldBackgroundColor: ColorConstant.gray1,
          fontFamily: 'Poppins',
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: ColorConstant.primary,
            selectionColor: ColorConstant.primary.withOpacity(0.5),
            selectionHandleColor: ColorConstant.primary,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => const MainScreen(),
          '/details': (_) => const DetailCafeScreen(),
          '/reviews': (_) => const ReviewScreen(),
          '/search': (_) => const SearchScreen(),
          '/coffeestant': (_) => const CoffeestantScreen(),
          '/most-liked-cafe': (_) => const CafeMostLikedScreen(),
          '/open-cafe': (_) => const OpenCafesScreen(),
          '/top-rated-cafe': (_) => const TopRatedCafesScreen(),
        },
      ),
    );
  }
}
