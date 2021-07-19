import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/data_models/comment.dart';
import 'package:re7al/data_models/user.dart';
import 'package:re7al/providers/auth_provider.dart';
import 'package:re7al/providers/commets_provider.dart';

class BottomSheetModal extends StatefulWidget {
  String placeId;
  BottomSheetModal(this.placeId);

  @override
  _BottomSheetModalState createState() => _BottomSheetModalState();
}

class _BottomSheetModalState extends State<BottomSheetModal> {
  @override
  initState() {
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<CommentsProvider>(context, listen: false)
          .fetchComments(widget.placeId);
    });
    super.initState();
  }

  final commentController = TextEditingController();
  bool isValid = true;
  bool fav = true;
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<AuthProvider>(context, listen: false).user;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: font_color,
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.imgUrl),
              backgroundColor: Colors.white,
              child: Icon(Icons.person_outline_rounded),
              foregroundColor: font_color,
            ),
          ),
          title: Text(user == null ? "User name" : user.name),
          subtitle: Text('this is my comment'),
          trailing: Icon(
            Icons.arrow_drop_up_sharp,
            size: 40,
            color: font_color,
          ),
          onTap: () {
            showModalBottomSheet<void>(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                      color: font_color,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  height: 300,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: TextFormField(
                                controller: commentController,
                                onFieldSubmitted: (v) async {
                                  if (v.trim().length == 0 || v.length < 5) {
                                    setState(() {
                                      isValid = false;
                                    });
                                  } else {
                                    Comment comment = Comment(
                                        content: v,
                                        id: DateTime.now().toString(),
                                        userId: user.id,
                                        placeId: int.parse(widget.placeId),
                                        userImage: user.imgUrl,
                                        userName: user.name);
                                    await Provider.of<CommentsProvider>(context,
                                            listen: false)
                                        .addComment(widget.placeId, comment);
                                    commentController.clear();
                                  }
                                },
                                decoration: InputDecoration(
                                  errorText: isValid ? null : "Short Comment",
                                  prefixIcon: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        color: Colors.white),
                                    child: CircleAvatar(
                                      backgroundColor: font_color,
                                      backgroundImage:
                                          NetworkImage(user.imgUrl),
                                      radius: 10,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  hintText: '   Add a public comment',
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.arrow_forward),
                                    onPressed: () async {
                                      if (commentController.text
                                                  .trim()
                                                  .length ==
                                              0 ||
                                          commentController.text.length < 5) {
                                        setState(() {
                                          isValid = false;
                                        });
                                      } else {
                                        Comment comment = Comment(
                                            content: commentController.text,
                                            id: DateTime.now().toString(),
                                            userId: user.id,
                                            placeId: int.parse(widget.placeId),
                                            userImage: user.imgUrl,
                                            userName: user.name);
                                        await Provider.of<CommentsProvider>(
                                                context,
                                                listen: false)
                                            .addComment(
                                                widget.placeId, comment);
                                        commentController.clear();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Consumer<CommentsProvider>(
                                builder: (ctx, commentsProv, _) => commentsProv
                                            .comment.isEmpty ||
                                        commentsProv.comment == null
                                    ? Center(
                                        child:
                                            Text("No comments for this place"),
                                      )
                                    : Column(
                                        children: commentsProv.comment
                                            .map((comment) =>
                                                MBS_comment(comment))
                                            .toList(),
                                      ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MBS_comment extends StatefulWidget {
  final Comment comment;

  MBS_comment(this.comment);

  @override
  _MBS_commentState createState() => _MBS_commentState();
}

class _MBS_commentState extends State<MBS_comment> {
  @override
  bool fav = true;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.comment.userImage),
                backgroundColor: font_color,
                radius: 19,
                child: widget.comment == null
                    ? Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      )
                    : null,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              width: 300,
              child: ListTile(
                trailing: IconButton(
                  iconSize: 30,
                  icon: Icon(
                    fav ? Icons.favorite_outline_outlined : Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      fav = !fav;
                    });
                  },
                ),
                title: Text(
                  widget.comment.userName,
                ),
                subtitle: Text(widget.comment.content),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Row(
            children: [
              Text(
                '4h',
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                child: Text(
                  'reply',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
