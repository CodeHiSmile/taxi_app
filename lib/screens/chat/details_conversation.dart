import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taxi_app/commons/app_colors.dart';
import 'package:taxi_app/commons/app_gradient.dart';
import 'package:taxi_app/commons/app_images.dart';
import 'package:taxi_app/models/conversation_entity.dart';
import 'package:taxi_app/utils/datetime_formatter.dart';

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
    Conversation conversation = listConversation
        .where((element) => element.nameUser == widget.idUser)
        .first;
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
                      "${conversation.nameUser}",
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
                              conversation.avatarUrl ?? '',
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
                itemCount: conversation.messages?.length ?? 0,
                itemBuilder: (context, index) {
                  final isOwner = conversation.messages![index].userId != widget.idUser;
                  final dateSend = DateTime.parse(conversation.messages![index].timeSend ?? DateTime.now().toString());
                  final isDifferent = DateTime
                      .now()
                      .difference(dateSend)
                      .inDays;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (!(conversation.messages![index].isChoose ?? false)) {
                          conversation.messages![index].isChoose = true;
                        } else {
                          conversation.messages![index].isChoose = false;
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: index == 0,
                            child: Text(
                              DateFormat(isDifferent > 3
                                  ? DateTimeFormater.formatDate
                                  : DateTimeFormater.formatNameDayHour)
                                  .format(DateTime.parse(
                                  conversation.messages![index].timeSend ?? DateTime.now().toString())),
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF8A8A8F),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            margin: const EdgeInsets.only(top: 7, bottom: 3),
                            child: Row(
                              mainAxisAlignment: isOwner ? MainAxisAlignment.end : MainAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: isOwner,
                                  child: SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.2,
                                  ),
                                ),
                                Flexible(
                                  child: CustomPaint(
                                    painter: CustomChatBubble(
                                      isOwn: isOwner,
                                      color: isOwner ? AppColors.greenTop : AppColors.greyBorder,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      child: Text(
                                        conversation.messages![index].content ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: !isOwner,
                                  child: SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.2,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: conversation.messages?[index].isChoose ?? false,
                            child: Align(
                              alignment: isOwner ? Alignment.centerRight : Alignment.centerLeft,
                              child: Padding(
                                padding: isOwner ? const EdgeInsets.only(right: 20) : const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Read ${DateFormat(DateTimeFormater.formatHour)
                                      .format(DateTime.parse(DateTime.now().toString()))}",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF858E99),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                const SizedBox(width: 12),
                const Icon(
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
