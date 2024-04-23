// import 'package:cinema_app/core/themes/theme_data.dart';
// import 'package:cinema_app/core/features/profile/presentation/views/widgets/custom_textfield.dart';
// import 'package:flutter/material.dart';

// import 'widgets/custom_textfield.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: lightTheme.primaryColor,
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: ColorsConfig().appBarColor,
//           leading: IconButton(
//             padding: const EdgeInsets.only(left: 15),
//             onPressed: () {},
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: ColorsConfig().iconColor,
//             ),
//           ),
//           title: Text(
//             'Profile',
//             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           actions: [
//             IconButton(
//                 padding: const EdgeInsets.only(right: 15),
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.logout,
//                   color: ColorsConfig().iconColor,
//                 )),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 28),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CircleAvatar(
//                     radius: 48,
//                     backgroundImage: AssetImage('assets/image/lonely_tree.jpg'),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'Wayne Jackson',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 25,
//                     ),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Information',
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: ColorsConfig().iconColor),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15),
//                     child: Column(
//                       children: [
//                         CustomTextField(
//                           title: 'Fullname',
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
