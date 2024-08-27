import 'package:flutter/material.dart';

  Widget build(BuildContext context) {
    final search_term = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 48,
        width: 345,
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 12),
            Expanded(
          child: TextField(
            controller: search_term,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color.fromARGB(255, 63, 81, 243),
                  )),
              border: InputBorder.none,
              hintText: "Leather",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.all(10)
            ),
          ),
        ),
            Icon(Icons.tune_rounded)
          ],
        ),
      ),
    );
  }

// Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 7),
//                         child: SizedBox(
//                           width: MediaQuery.of(context).size.width *
//                               0.70, 
//                           height: 48,
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: Color.fromRGBO(217, 217, 217, 1)),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(8))),
//                             child: ,
//                           ),
//                         ),
//                       ),