import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';

class ItemCard extends StatelessWidget {
  final GroceryModel item;
  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 187,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(13, 10, 44, 1).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      
      // width: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,left: 8.0,right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(item.imageUrl),
                  fit: BoxFit.cover
                )
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(Icons.favorite_border, color: Color.fromRGBO(255, 99, 71, 1),size: 26,),
                    ),
                  )
                ],
                ),
            ),
        
            Padding(padding:EdgeInsets.only(top: 8),
            child:  Container(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(item.title, style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),),
                 Padding(
                   padding: const EdgeInsets.only(top:8.0),
                   child: Row(children: [
                    const Icon(Icons.star_rounded, color: Color.fromRGBO(255, 199, 0, 1), size: 30,),
                    Padding(padding: EdgeInsets.only(left: 5),child: Text(item.rating.toString(), style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),),),
                   ],),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                   child: Row(
                    children: [
                      Text('£'+ item.price.toString(), style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.grey,decoration: TextDecoration.lineThrough,decorationColor: Colors.grey),),
                      Padding(padding: EdgeInsets.only(left: 5),child: Text('£'+ item.discount.toString(), style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.red),),),
                    ],),
                 )
        
        
                ],),
            ),
            ),
            
          ],),
      ),
    );
  }
}