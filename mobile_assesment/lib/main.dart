import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_bloc.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_event.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/basket.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/details.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/home.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/splash_screen.dart';
import 'package:mobile_assesment/locator.dart';

void main() async {
  await init();
  Bloc.observer = CustomBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final args = settings.arguments as GroceryModel;
          return MaterialPageRoute(builder: (context) => DetailsPage(item: args));
        }else if(settings.name == '/basket'){
          final args = settings.arguments as List<GroceryModel?>;
          return MaterialPageRoute(builder: (context) => MyBasket());
        }
        return null;
      },
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => BlocProvider(
              create: (context) => sl.get<GorceryBloc>()..add(GetAllGroceriesEvent()),
              child: HomePage(),
            ),
        
          
      },
    );
  }
}
