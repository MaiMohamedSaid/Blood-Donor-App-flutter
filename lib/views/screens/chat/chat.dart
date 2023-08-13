// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/provider/auth_provider.dart';
import 'package:untitledtest11/util/color_resources.dart';

import '../../../data/model/response/all_friends_model.dart';
import 'chat_details.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context,listen: false).getAllFreindsrData();
    // Future.microtask(() => context.read<AuthProvider>());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text('Chats',
          style: TextStyle(
            color: ColorResources.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon:Icon(
              Icons.search,
              color: Colors.grey,
              size: 30.0,

            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Provider.of<AuthProvider>(context,listen: false).usersFreinds != null
          ? ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder:(context , index) => builtChatItem(context,
            Provider.of<AuthProvider>(context,listen: false).usersFreinds!.dataf![index]
        ),
        separatorBuilder: (context ,index ) => myDivider(),
        itemCount:  Provider.of<AuthProvider>(context,listen: false).usersFreinds!.dataf!.length)
          : Center(child: CircularProgressIndicator()

      )
    );
  }

  Widget builtChatItem ( BuildContext context, DataF model ) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: ()
      {
        Navigator.push(
            context, MaterialPageRoute(builder:(context) => ChatDetailsScreen(reciverId: model.messageRecived![0].reciverId!)));
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 23.0,
            backgroundColor: ColorResources.mainColor,
          ),
          SizedBox(width: 13.0,),
          Text(
            model.userName!,
            style: TextStyle(
                fontSize: 16.0
            ),
          ),
        ],
      ),
    ),
  );

  Widget myDivider() => Padding(
    padding: const EdgeInsets.only(right: 20.0 ,left: 20.0),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  );
}
