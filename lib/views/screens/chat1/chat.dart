//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../cubit/all_friends_model1.dart';
// import '../../../cubit/cubit.dart';
// import '../../../cubit/states.dart';
// import '../../../shared/network/local/cache_helper.dart';
// import '../../../shared/network/remote/constants.dart';
// import 'chat_details.dart';
//
// class ChatScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => DonorCubit()..getAllFriends(),
//       child: BlocConsumer<DonorCubit,DonorStates>(
//         listener: (BuildContext context, state) {  },
//         builder: (BuildContext context, Object? state)
//         {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               elevation: 0.0,
//               leading: IconButton(onPressed: (){
//                 Navigator.pop(context);
//               },
//                 icon: Icon(Icons.arrow_back,
//                   color: Colors.black,
//                   size: 20,
//                 ),
//               ),
//               title: Text('Chats',
//                 style: TextStyle(
//                     color: mainColor,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: (){},
//                   icon:Icon(
//                     Icons.search,
//                     color: Colors.grey,
//                     size: 30.0,
//
//                   ),
//                 )
//               ],
//               backgroundColor: Colors.white,
//             ),
//             body: DonorCubit.get(context).allData != null ?
//             ListView.separated(
//               physics: BouncingScrollPhysics(),
//                 itemBuilder: (context ,index ) => builtChatItem(DonorCubit.get(context).allData!.dataf[index] , context),
//                 separatorBuilder: (context ,index ) => myDivider(),
//                 itemCount:  DonorCubit.get(context).allData!.dataf.length,
//             )
//                 :Center(child: CircularProgressIndicator()),
//           );
//         },
//       ),
//     );
//   }
//   Widget builtChatItem (DataF model , context) => Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: InkWell(
//       onTap: ()
//       {
//         CacheHelper.saveData(key: 'reciverId', value: model.id);
//         Navigator.push(
//             context, MaterialPageRoute(builder:(context) => ChatDetailsScreen(dataModel: model,)));
//       },
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 23.0,
//             backgroundColor: mainColor,
//           ),
//           SizedBox(width: 13.0,),
//           Text(
//             model.userName!,
//             style: TextStyle(
//                 fontSize: 16.0
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
//   Widget myDivider() => Padding(
//     padding: const EdgeInsets.only(right: 20.0 ,left: 20.0),
//     child: Container(
//       width: double.infinity,
//       height: 1.0,
//       color: Colors.grey[300],
//     ),
//   );
// }
