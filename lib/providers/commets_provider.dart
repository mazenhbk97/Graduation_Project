import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:re7al/data_models/comment.dart';
import 'package:re7al/helpers/public.dart';
import 'package:http/http.dart' as http;

class CommentsProvider with ChangeNotifier {
  List<Comment> _comments = [];

  List<Comment> get comment {
    return [..._comments];
  }

  Future<void> fetchComments(String placeId) async {
    final url = Uri.parse("${Public.baseUrl}/comments/places/$placeId");

    final token = await Public.getToken();
    final response = await http.get(url, headers: {"auth-token": token});
    final responseData = jsonDecode(response.body) as List<dynamic>;
    List<Comment> tempList = [];
    responseData.forEach((element) {
      tempList.add(Comment.fromMap(element as Map<String, dynamic>));
    });
    _comments = tempList;

    notifyListeners();
  }

  Future<void> addComment(String placeId, Comment comment) async {
    final url = Uri.parse("${Public.baseUrl}/comments/new/places/$placeId");
    final token = await Public.getToken();

    try {
      _comments.add(comment);
      notifyListeners();
      await http.post(url,
          body: {"content": comment.content}, headers: {"auth-token": token});
    } catch (e) {
      _comments.remove(comment);
      notifyListeners();
      throw e;
    }
  }
}
