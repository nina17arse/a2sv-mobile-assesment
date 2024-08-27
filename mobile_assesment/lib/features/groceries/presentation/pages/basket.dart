import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_bloc.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_event.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/home.dart';

class MyBasket extends StatefulWidget {
  MyBasket({Key? key}) : super(key: key);

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route != null && route.settings.arguments == null) {
      return Center(child:Text('No arguments'));
    }
    int currentIndex = 0;
    List<Widget> pages = [
      HomePage(),
      MyBasket(),
    ];
    List<Widget> bottomNavItems = [
      Icon(Icons.home_outlined,size: 30,color: Colors.black,),
      Icon(Icons.shopping_cart_rounded,color: Colors.black,size: 30,),
    ];
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios_rounded,size: 30,color: Colors.black,)),
                Text('My Basket',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(children: [
              Text('Order Summary',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              OutlinedButton(onPressed: (){
                Navigator.pushNamed(context, '/home');
                context.read<GorceryBloc>().add(GetAllGroceriesEvent());
              }, child: Text("Add More Items",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))
            ],)
          ],
        ),
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: bottomNavItems.map((e) => BottomNavigationBarItem(icon: e, label: '')).toList(),
        onTap: (index) {
          currentIndex = index;
          if (index==0) {
            Navigator.pushNamed(context, '/home');
            context.read<GorceryBloc>().add(GetAllGroceriesEvent());
          } else {
            Navigator.pushNamed(context, '/basket');
          }
          
        },
      ),
    );
  }
}