//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../../shared/constants.dart';
// import '../choses.dart';
// import '../login/cubit_login/cubit.dart';
// import '../login/cubit_login/states.dart';
// import 'change_password.dart';
//
//
// class ChangePasswordEmailScreen extends StatelessWidget {
//
//   var formKeyC = GlobalKey<FormState>();
//
//   var emailController = TextEditingController();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => LoginCubit(),
//       child: BlocConsumer<LoginCubit , LoginStates>(
//         listener: (BuildContext context, state)
//         {  },
//         builder: (BuildContext context, state)
//         {
//           return Scaffold(
//             backgroundColor: Colors.grey[200],
//             appBar: AppBar(
//               backgroundColor: Colors.grey[200],
//               elevation: 0.0,
//               leading: IconButton(
//                 icon: Icon(
//                   CupertinoIcons.arrow_left,
//                   color: Colors.black,),
//                 onPressed: ()
//                 {
//                   Navigator.pop(
//                       context, MaterialPageRoute(builder:(context) => Choose()));
//                 },
//               ),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: formKeyC,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 30.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Change Password',
//                               style: TextStyle(
//                                 fontSize: 35.0,
//                                 color: mainColor,
//                               ),
//                             ),
//                             SizedBox(height: 5.0,),
//                             Text(
//                               'Please enter your email',
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 color: Colors.grey[400],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       TextFormField(
//                         controller: emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: const InputDecoration(
//                           labelText: 'Email',
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(
//                             Icons.email,
//                           ),
//                         ),
//
//                         validator: (String? value)
//                         {
//                           if(value!.isEmpty)
//                           {
//                             return("Email must not be empty");
//                           }
//                           return null;
//                         },
//
//                       ),
//
//                       Padding(
//                         padding: const EdgeInsets.only(top: 40.0,bottom: 40.0),
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: mainColor,
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                           child: MaterialButton(
//                             child: Text(
//                               'Start',
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                             onPressed: ()
//                             {
//                               if (formKeyC.currentState!.validate())
//                               {
//                                 print(emailController.text);
//
//                                 if(email == emailController.text)
//                                   print("object");
//                                 Navigator.push(
//                                     context, MaterialPageRoute(builder:(context) => ChangePasswordScreen()));
//
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
