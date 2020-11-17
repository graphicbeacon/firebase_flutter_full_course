import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_message_other.dart';
import 'chat_message.dart';

class MessageWall extends StatelessWidget {
  final List<QueryDocumentSnapshot> messages;
  final ValueChanged<String> onDelete;

  const MessageWall({
    Key key,
    this.messages,
    this.onDelete,
  }) : super(key: key);

  bool shouldDisplayAvatar(int idx) {
    if (idx == 0) return true;

    final previousId = messages[idx - 1].data()['author_id'];
    final authorId = messages[idx].data()['author_id'];
    return authorId != previousId;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final data = messages[index].data();
        final user = FirebaseAuth.instance.currentUser;

        if (user != null && user.uid == data['author_id']) {
          return Dismissible(
            onDismissed: (_) {
              onDelete(messages[index].id);
            },
            key: ValueKey(data['timestamp']),
            child: ChatMessage(
              index: index,
              data: data,
            ),
          );
        }

        return ChatMessageOther(
          index: index,
          data: data,
          showAvatar: shouldDisplayAvatar(index),
        );
      },
    );
  }
}
