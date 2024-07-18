import 'package:flutter/material.dart';


class Grocery{
  final int id;
  final String name;
  final double price;
  final String imagePath;

  Grocery({
    required this.id, 
    required this.name, 
    required this.price, 
    required this.imagePath
    });
}





















// class GroceryItems {
//   final String id;
//   final String name;
//   final double price;
//   final String imagePath;
//   int quantity;
  

//   GroceryItems({
    
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.imagePath,
//     this.quantity = 1,
    
//   });

// }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(
//           color: Color.fromARGB(255, 218, 216, 216),
//           width: 1,
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           //image

//           Image.asset(
//             imagePath,
//             height: 64,
//           ),

//           //itemname
//           Text(
//             name,
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           //price

//           Text(
//             price,
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//             ),
//           ),

//           //add to cart button

//           MaterialButton(
//             padding: EdgeInsets.all(18),
//             onPressed: onPressed,
//             color: Colors.green[100],
//             child: Text(
//               'Add to Cart',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
