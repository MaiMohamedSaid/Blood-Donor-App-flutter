//
//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../cubit/all_friends_model1.dart';
// import '../../../cubit/cubit.dart';
// import '../../../cubit/states.dart';
// import '../../../shared/network/local/cache_helper.dart';
// import '../../../shared/network/remote/constants.dart';
//
// class ChatDetailsScreen extends StatelessWidget {
//
//   DataF ? dataModel;
//
//
//   ChatDetailsScreen({this.dataModel});
//
//   var messageController = TextEditingController();
//   Timer ? timer;
//
//
//   @override
//   Widget build(BuildContext context) {
//     reciverId = CacheHelper.getData(key: 'reciverId');
//     //print(reciverId);
//     return BlocProvider(
//       create: (BuildContext context) => DonorCubit()..getConversation(),
//       child: Builder(
//         builder: (BuildContext context)
//         {
//           timer = Timer.periodic(Duration(seconds: 1), (timer) => DonorCubit.get(context).getConversation());
//
//           //DonorCubit.get(context).getConversation();
//
//           return  BlocConsumer<DonorCubit,DonorStates>(
//             listener: (BuildContext context, state) {  },
//             builder: (BuildContext context, Object? state)
//             {
//               return Scaffold(
//                 backgroundColor: Colors.white,
//                 appBar: AppBar(
//                   backgroundColor: Colors.white,
//                   elevation: 0.0,
//                   titleSpacing: 0.0,
//                   leading: IconButton(onPressed: (){
//                     Navigator.pop(context);
//                     timer!.cancel();
//                   },
//                     icon: Icon(Icons.arrow_back,
//                       color: Colors.black,
//                       size: 20,
//                     ),
//                   ),
//                   title: Row(
//                     children: [
//                       CircleAvatar(backgroundColor: mainColor,),
//                       SizedBox(width: 15.0,),
//                       Text(
//                         dataModel!.userName!,
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 body: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: ListView.separated(
//                             itemBuilder: (context ,index)
//                             {
//                               //return buildMessage(DonorCubit.get(context).conversationData![index]);
//                               // buildMyMessage(),
//                               // Spacer(),
//                               // var message = DonorCubit.get(context).conversationData![index];
//                               // StreamBuilder<>
//                               // {
//                               //   stream:
//                               // buider:(context , snapshot)
//                               //   {
//                               //     retutn ;
//                               //   }
//                               // }
//                              //timer.cancel();
//                              if(appUserId == DonorCubit.get(context).conversationData![index]['senderId'])
//                               {
//                                 return buildMyMessage(DonorCubit.get(context)
//                                     .conversationData![index]);
//                               }
//                               else
//                               {
//                                 return buildMessage(DonorCubit.get(context)
//                                     .conversationData![index]);
//                               }
//
//                             },
//
//                             separatorBuilder: (context,index) => SizedBox(height: 15.0,),
//                             itemCount: DonorCubit.get(context).conversationData!.length),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             width: 1.0,
//                             color: Colors.grey.shade300,
//                           ),
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: TextFormField(
//                                 controller: messageController,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: '  Type your message here ...',
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 49.5,
//                               color: mainColor,
//                               child: MaterialButton(
//                                 minWidth: 1.0,
//                                 onPressed: (){
//                                   print(messageController.text);
//                                   DonorCubit.get(context).sengMessage
//                                     (senderId: appUserId!,
//                                       reciverId: dataModel!.id!,
//                                       content: messageController.text);
//                                   messageController.clear();
//                                 },
//                                 child: Icon(
//                                   Icons.send,
//                                   size: 16.0,
//                                   color: Colors.white,
//
//                                 ),
//                               ),
//                             )
//
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//
//       ),
//     );
//   }
//   Widget buildMessage (messages) => Align(
//     alignment: AlignmentDirectional.centerStart,
//     child: Container(
//         decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadiusDirectional.only
//               (
//               topEnd: Radius.circular(10.0),
//               topStart: Radius.circular(10.0),
//               bottomEnd: Radius.circular(10.0),
//
//             )
//         ),
//         padding: EdgeInsets.symmetric(
//           vertical: 5.0,
//           horizontal: 10.0,
//         ),
//         child: Text
//           (
//           '${messages['content']}',
//         )
//     ),
//   );
//   Widget buildMyMessage (messages) => Align(
//     alignment: AlignmentDirectional.centerEnd,
//     child: Container(
//         decoration: BoxDecoration(
//             color: mainColor.withOpacity(.2,),
//             borderRadius: BorderRadiusDirectional.only
//               (
//               topEnd: Radius.circular(10.0),
//               topStart: Radius.circular(10.0),
//               bottomStart: Radius.circular(10.0),
//
//             )
//         ),
//         padding: EdgeInsets.symmetric(
//           vertical: 5.0,
//           horizontal: 10.0,
//         ),
//         child: Text
//           (
//           '${messages['content']}',
//         )
//     ),
//   );
// }
