// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/provider/donation_provider.dart';
import 'package:untitledtest11/util/app_constants.dart';
import 'package:untitledtest11/util/color_resources.dart';

import '../../../data/model/body/send_message_model.dart';
import '../../../data/model/response/all_friends_model.dart';
import '../../../data/model/response/all_friends_model.dart';
import '../../../data/model/response/get_conversation_model.dart';
import '../../../provider/auth_provider.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String reciverId;
  const ChatDetailsScreen({super.key, required this.reciverId});


  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  var messageController = TextEditingController();
  MessageModel messageModel = MessageModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context,listen: false).getConversation(widget.reciverId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        print("nnnnnnader ====>>>> ${auth.conversationData!.length}");
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleSpacing: 0.0,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },
              icon: Icon(Icons.arrow_back,
                color: Colors.black,
                size: 20,
              ),
            ),
            title: Row(
              children: [
                CircleAvatar(backgroundColor: ColorResources.mainColor,),
                SizedBox(width: 15.0,),
                Text(
                  Provider.of<AuthProvider>(context,listen: false).userData!.username.toString(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context ,index)
                      {
                        return buildMessage(Provider.of<AuthProvider>(context,listen: false).conversationData![index]);
                      },

                      separatorBuilder: (context,index) => SizedBox(height: 15.0,),
                      itemCount: Provider.of<AuthProvider>(context,listen: false).conversationData!.length),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: messageController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '  Type your message here ...',
                          ),
                        ),
                      ),
                      Container(
                        height: 49.5,
                        color: ColorResources.mainColor,
                        child: MaterialButton(
                          minWidth: 1.0,
                          onPressed: (){
                            messageModel.senderId = auth.userData!.userId.toString();
                            messageModel.reciverId = widget.reciverId;
                            messageModel.content = messageController.text;
                            Provider.of<AuthProvider>(context, listen: false)
                                .sendMessage(messageModel,action);
                            print(messageController.text);
                            // Provider.of<AuthProvider>(context,listen: false).sendMessage()
                            //   (
                            //     senderId: Provider.of<AuthProvider>(context,listen: false).getUserData(id),
                            //     reciverId: dataModel!.id!,
                            //     content: messageController.text
                            //   );
                            messageController.clear();
                          },
                          child: Icon(
                            Icons.send,
                            size: 16.0,
                            color: Colors.white,

                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        );

      },
    );

  }

  Widget buildMessage (ConversationData messages) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only
              (
              topEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              bottomEnd: Radius.circular(10.0),

            )
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text
          (
          '${messages.content}',
        )
    ),
  );

  Widget buildMyMessage (messages) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
        decoration: BoxDecoration(
            color: ColorResources.mainColor.withOpacity(.2,),
            borderRadius: BorderRadiusDirectional.only
              (
              topEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              bottomStart: Radius.circular(10.0),

            )
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text
          (
          '${messages['content']}',
        )
    ),
  );

  action(bool action,String message,String reciverId) {
    if (action) {
      Provider.of<AuthProvider>(context, listen: false).getConversation(reciverId);
    }
    else{


    }
  }

}
