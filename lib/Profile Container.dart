// import 'package:flutter/material.dart';
//
// class ProfileCont extends StatefulWidget {
//
//   const  ProfileCont({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileCont> createState() => _ProfileContState();
// }
//
// class _ProfileContState extends State<ProfileCont> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
//       child: Stack(
//         alignment: Alignment.bottomRight,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 8,),
//             height: 60,
//             width: 60,
//             child: Image(image: AssetImage("Assets/Todo_logo.png"),fit: BoxFit.cover,),
//             decoration: BoxDecoration(
//                 color: Colors.grey,
//                 shape: BoxShape.circle
//             ),
//           ),
//           Positioned(
//             right:5,
//             bottom:5,
//             child: Container(
//               height: 15,
//               width: 15,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.green,
//                 border: Border.all(color: Colors.black)
//               ),
//             ),
//           )],
//       ),
//     );
//   }
// }
