import 'package:flutter/material.dart';
import 'package:taxi_app/commons/app_gradient.dart';
import 'package:taxi_app/models/conversation_entity.dart';

import 'details_conversation.dart';

class HomeChatPage extends StatefulWidget {
  const HomeChatPage({Key? key}) : super(key: key);

  @override
  _HomeChatPageState createState() => _HomeChatPageState();
}

class _HomeChatPageState extends State<HomeChatPage> {
  List<Conversation> listUser = listConversation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 155,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppGradient.gradientSplash,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 43),
                const Text(
                  "CONTACTS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Color(0x5C000000),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color(0x99999999),
                            ),
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: listUser.length,
              separatorBuilder: (context, index) => Container(
                height: 1,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 14),
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F2F2),
                ),
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailConversation(
                          idUser: listUser[index].nameUser ?? '',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  listUser[index].avatarUrl ?? '',
                                ),
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            "${listUser[index].nameUser}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF34495E),
                            ),
                          ),
                        ),
                        Text(
                          "${listUser[index].lastTime}",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF2BAF46),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
