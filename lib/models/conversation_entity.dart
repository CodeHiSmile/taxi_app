class Conversation {
  String? avatarUrl;
  String? nameUser;
  String? lastTime;
  List<Message>? messages;

  Conversation({
    this.avatarUrl,
    this.nameUser,
    this.lastTime,
    this.messages,
  });
}

class Message {
  String? content;
  String? timeSend;
  String? userId;
  String? timeSeen;
  bool? isChoose;

  Message({
    this.userId,
    this.content,
    this.timeSend,
    this.isChoose,
    this.timeSeen,
  });
}

List<Conversation> listConversation = [
  Conversation(
    avatarUrl: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
    nameUser: "Flutter",
    lastTime: "Now",
    messages: [
      Message(
        content: 'Hi, How are you? asdhasdohoas ahsdhas hdashd ahsdhas sahd ashdashd ashdhasd as ',
        timeSend: "2022-02-14 20:46:31.710",
        userId: "Flutter",
      ),
      Message(
        content: 'I am fine, thank you. And you - Flutter?',
        timeSend: "2022-02-14 21:46:31.710",
        userId: "Me",
      ),
      Message(
        content: 'Where are you from?',
        timeSend: "2022-02-14 21:46:31.710",
        userId: "Me",
      ),
      Message(
        content: 'I am very good',
        timeSend: "2022-02-14 23:46:31.710",
        userId: "Flutter",
      ),
      Message(
        content: 'I am from VietNam',
        timeSend: "2022-02-14 23:46:31.710",
        userId: "Flutter",
      ),
    ],
  ),
  Conversation(
    avatarUrl: 'https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg',
    nameUser: "React Native",
    lastTime: "12:15",
    messages: [
      Message(
        content: 'Hi, How are you?',
        timeSend: "2022-02-14 20:46:31.710",
        userId: "React Native",
      ),
      Message(
        content: 'I am fine, thank you. And you - React?',
        timeSend: "2022-02-14 21:46:31.710",
        userId: "Me",
      ),
      Message(
        content: 'I am very good',
        timeSend: "2022-02-14 23:46:31.710",
        userId: "React Native",
      ),
    ],
  ),
  Conversation(
    avatarUrl:
        'https://www.w3schools.com/w3images/fjords.jpg',
    nameUser: "Xamarin",
    lastTime: "23:59",
    messages: [
      Message(
        content: 'Hi, How are you?',
        timeSend: "2022-02-14 20:46:31.710",
        userId: "Xamarin",
      ),
      Message(
        content: 'I am fine, thank you. And you - Xamarin?',
        timeSend: "2022-02-14 21:46:31.710",
        userId: "Me",
      ),
      Message(
        content: 'I am very good',
        timeSend: "2022-02-14 23:46:31.710",
        userId: "Xamarin",
      ),
    ],
  ),
];
