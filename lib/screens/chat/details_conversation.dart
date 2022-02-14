import 'package:flutter/material.dart';
import 'package:taxi_app/commons/app_colors.dart';
import 'package:taxi_app/commons/app_gradient.dart';
import 'package:taxi_app/commons/app_images.dart';
import 'package:taxi_app/models/conversation_entity.dart';

import 'custom_chat_bubble.dart';

class DetailConversation extends StatefulWidget {
  final String idUser;

  const DetailConversation({
    Key? key,
    required this.idUser,
  }) : super(key: key);

  @override
  _DetailConversationState createState() => _DetailConversationState();
}

class _DetailConversationState extends State<DetailConversation> {
  @override
  Widget build(BuildContext context) {
    Conversation user = listConversation.where((element) => element.nameUser == widget.idUser).first;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 171,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppGradient.gradientSplash,
            ),
            padding: const EdgeInsets.only(top: 43, left: 22),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        AppImages.icBack,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "${user.nameUser}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 22, bottom: 40),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 62,
                        width: 62,
                        margin: const EdgeInsets.only(left: 26),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(31),
                          image: DecorationImage(
                            image: NetworkImage(
                              user.avatarUrl ?? '',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x57000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                AppImages.icPhone,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 12),
                itemCount: user.messages?.length ?? 0,
                itemBuilder: (context, index) {
                  final isCheck = user.messages![index].userId == widget.idUser;
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: isCheck ? MainAxisAlignment.start : MainAxisAlignment.end,
                      children: [
                        CustomPaint(
                          painter: CustomChatBubble(
                            isOwn: !isCheck,
                            color: !isCheck ? AppColors.greyBorder : AppColors.greenTop,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            child: Text(
                              user.messages![index].content ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBorder,
                width: 1,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColors.greyBorder,
                      ),
                      hintText: 'Soạn tin nhắn',
                      border: InputBorder.none,
                      // contentPadding: EdgeInsets.only(bottom: 11),
                    ),
                    maxLines: 5,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.send,
                  color: AppColors.greenBottom,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
