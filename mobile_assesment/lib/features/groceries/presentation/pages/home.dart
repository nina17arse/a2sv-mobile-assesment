// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/bloc/search_bloc.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/bloc/search_event.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_bloc.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_event.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery/gorcery_state.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/basket.dart';
import 'package:mobile_assesment/features/groceries/presentation/widgets/item_card.dart';

class HomePage extends StatelessWidget {
  final TextEditingController search_term = TextEditingController();
  @override
  Widget build(BuildContext context) {
      void _performSearch() {
    final search = search_term.text;
    context.read<SearchBloc>().add(SearchProductEvent(search));
  }
    int currentIndex = 0;
    bool isPressed = false;
    List<Widget> pages = [
      HomePage(),
      MyBasket(),
    ];
    List<Widget> bottomNavItems = [
      Icon(Icons.home_rounded,size: 30,color: Colors.black,),
      Icon(Icons.shopping_cart_outlined,color: Colors.black,size: 30,),
    ];
    Future<void> onRefresh() {
      context.read<GorceryBloc>().add(GetAllGroceriesEvent());
      return  Future.delayed(Duration(seconds: 3));}
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0,right: 24.0,top: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: 
                    BoxDecoration(
                          color: Colors.white, // Background color for the container
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(13, 10, 44, 1).withOpacity(0.06),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                    
                    ),
                    child: Icon(Icons.circle_rounded,color: Colors.white,size: 42)),
                  Row(
                    children: [
                      Image.asset('assets/images/Cheese Burger.jpg'),
                      SizedBox(width: 12,),
                      Text('Burger', style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                    ],
                  ),
                  SizedBox(width: 42,height: 42,)
                ],),
            ),
              
          ],
        ),
            SizedBox(height: 24),
            Container(
              width: 345,
              height: 48,
              decoration: BoxDecoration(
                
                border: Border.all(color: Color.fromRGBO(186, 189, 193, 1)),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(children: [
                Icon(Icons.search,color: Color.fromRGBO(186, 189, 193, 1),size: 24,),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      
                      fillColor: Color.fromRGBO(186, 189, 193, 1),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _performSearch();
                  },
                  child: Icon(Icons.tune_rounded)),
              ],),

            ),
            SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<GorceryBloc, GorceryState>(
                builder: (context, state) {
                if (state is GroceryLoadingState) {
                  
                  return Center(child: CircularProgressIndicator());
                }else if (state is GroceryLoadedAllState) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                    child: Expanded(
                      child: RefreshIndicator(
                        onRefresh: onRefresh,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: state.groceries.length,
                          itemBuilder: (context, index) {
                            return ItemCard(item: state.groceries[index]);
                          },
                        ),
                      ),
                    ),
                  );
                } else if (state is GroceryFetchFailedState) {
                  return Text(state.message);
                } else {
                  return  Text('Button');
              
                }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: bottomNavItems[0], label: ''),
          BottomNavigationBarItem(icon: bottomNavItems[1], label: ''),
        ],
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

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('Current State: ${change.currentState}');
    print('Next State: ${change.nextState}');
  }
}


