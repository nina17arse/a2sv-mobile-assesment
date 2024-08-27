// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_assesment/features/groceries/data/models/grocery_model.dart';

class DetailsPage extends StatefulWidget {
  final GroceryModel item;
  
  // final bool isFavourited;
  DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<GroceryModel> basketItems = [];
  bool isfavorite = false;
  bool _isExpanded = false;
  bool isChecked = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children:[ 
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 393,
                        height: 300,
                       decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.item.imageUrl),
                      fit: BoxFit.cover
                    )
                  ),
                                      ),
                    ),
                  Positioned(
                    bottom: 24,
                    right: 22,
                    child: Container( 
                      padding: EdgeInsets.all(1),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(100)),
                          child: IconButton(onPressed: (){
                            setState(() {
                              isfavorite = !isfavorite;
                            });
                          }, icon: Icon(isfavorite ? Icons.favorite : Icons.favorite_border, color: Color.fromRGBO(255, 99, 71, 1),size: 26,),),
                  ),
                  ),
                  Positioned(
                    top: 54,
                    left: 24,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255,255,255,0.06),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(255,255,255,1).withOpacity(0.06),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      icon: Icon(Icons.arrow_back,size: 26,color: Colors.black,),),
                    )
                  )
                  
                  
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0,left: 25,right: 27),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ 
                          Text(widget.item.title, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                          Padding(
                            padding: const EdgeInsets.only(top:12.0),
                            child: Row(
                              children: [
                                Text('£'+ widget.item.price.toString(), style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.grey,decoration: TextDecoration.lineThrough,decorationColor: Colors.grey),),
                                Padding(padding: EdgeInsets.only(left: 5),child: Text('£'+ widget.item.discount.toString(), style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500,color: Colors.red),),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star_rounded, color: Color.fromRGBO(255, 199, 0, 1), size: 30,),
                                    Padding(padding: EdgeInsets.only(left: 5),child: Text(widget.item.rating.toString(), style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),),),
                                    SizedBox(width: 12,),
                                    Text('(1.205)',style: GoogleFonts.roboto(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w400),)
                                  ],
                                ),
                                Text('See all review',style: GoogleFonts.roboto(fontSize: 16,color: Color.fromRGBO(105, 112, 121, 1),decoration: TextDecoration.underline),)
                              ],
                            ),
                          ),
            
                          Padding(
                            padding: const EdgeInsets.only(top:16.0),
                            child: Text(widget.item.description, 
                            style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w300,color: Color.fromRGBO(105, 112, 121, 1)),
                            maxLines: _isExpanded ? null : 3, // `null` means no limit
                            overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          
            
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                              child: Text(_isExpanded ? 'See Less' :'See more',style:GoogleFonts.roboto(fontWeight:FontWeight.w500,fontSize: 16,color: Color.fromRGBO(105, 112, 121, 1),decoration: TextDecoration.underline))),
                          )
                                                          
                  
                        ],), //Here starts title ends wih see reviews
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Additional Options :',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),),
                            Padding(
                              padding: const EdgeInsets.only(top:16.0),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.15,
                                child: ListView.builder(
                                  itemCount: widget.item.options.length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(widget.item.options[index].name,style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                                          Row(
                                            children: [
                                              Text('£'+ widget.item.options[index].price.toString(),style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                                              Checkbox(
                                                activeColor: Colors.yellow,
                                                value: isChecked,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                }),
                        
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
            
            
                          ],),//Here ends Options part
                      ),
                      
                    ],),
                  ),
                ),
                Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 12),
                        child: Container(
                          width:  400,
                          height: 70,
                          padding: EdgeInsets.all(1),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(13, 10, 44, 1).withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(
                                  color:Color.fromRGBO(233, 234, 235, 1),
                                )),
                                child: IconButton(onPressed: (){
                                  setState(() {
                                    count--;
                                  });
                                }, icon: Icon(Icons.remove_rounded,size: 30,color: Colors.black,))),
                                SizedBox(width: 12,),
                                Text(count.toString(),style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),), 
                                SizedBox(width: 12,),
                                Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(
                                  color: Color.fromRGBO(233, 234, 235, 1),
                                ),),
                                child: IconButton(onPressed: (){
                                  setState(() {
                                    count++;
                                  });
                                }, icon: Icon(Icons.add_rounded,size: 30,color: Colors.black,))),
                                Row(
                                  children: [
                                  SizedBox(width: 10,),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        basketItems.add(widget.item);
                                      });
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 99, 71, 1),
                                        borderRadius: BorderRadius.circular(35),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon( Icons.shopping_bag_rounded,color: Colors.white, ),
                                          Center(child: Text('Add to Basket',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)),
                                        ],
                                      ),
                                    ),
                                  )
                                ],)


                          
                          ],),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}