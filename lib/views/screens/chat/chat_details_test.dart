import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/provider/auth_provider.dart';
import 'package:untitledtest11/util/color_resources.dart';

import '../../../data/model/body/send_message_model.dart';
import '../../../data/model/response/get_conversation_model.dart';

class ChatDetailsTestScreen extends StatefulWidget {
  final String id;
  ChatDetailsTestScreen({super.key, required this.id});
  @override
  State<ChatDetailsTestScreen> createState() => _ChatDetailsTestScreenState();
}

class _ChatDetailsTestScreenState extends State<ChatDetailsTestScreen> {
  var messageController = TextEditingController();

  MessageModel messageModel = MessageModel();

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
            leading: IconButton(onPressed: () {
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
                  auth.userData!.username.toString(),
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
                      itemBuilder: (context, index) {
                        return buildMessage(auth.conversationData![index]);
                        // buildMyMessage(),
                        // Spacer(),
                        // var message = Provider.of<AuthProvider>(context, listen: false).conversationData![index];
                        //
                        // StreamBuilder<>
                        // {
                        //   stream:
                        // buider:(context , snapshot)
                        //   {
                        //     retutn ;
                        //   }
                        // }
                        // if(appUserId == Provider.of<AuthProvider>(context, listen: false).conversationData![index]['senderId'])
                        //
                        // return buildMyMessage(Provider.of<AuthProvider>(context, listen: false).conversationData![index]);
                        //
                        //
                        // // return buildMessage(DonorCubit.get(context).conversationData![index]);

                      },
                      separatorBuilder: (context, index) => SizedBox(height: 15.0),
                      itemCount: auth.conversationData!.length),
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
                          onPressed: () {
                            messageModel.senderId = auth.userData!.userId.toString();
                            messageModel.reciverId = widget.id;
                            messageModel.content = messageController.text;
                            Provider.of<AuthProvider>(context, listen: false)
                                .sendMessage(messageModel,action);
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

  action(bool action,String message,String reciverId) {
    if (action) {
      Provider.of<AuthProvider>(context, listen: false).getConversation(reciverId);
    }
  else{


  }
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
            color: ColorResources.mainColor,
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
}
