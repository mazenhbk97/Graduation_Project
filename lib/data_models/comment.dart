class Comment {
  String id;
  int placeId;
  String content;
  String userId;
  String userName;
  String userImage;

  Comment(
      {this.id,
      this.placeId,
      this.content,
      this.userId,
      this.userImage,
      this.userName});

  Comment.fromMap(Map<String, dynamic> commentMap) {
    this.id = commentMap["id"];
    this.placeId = commentMap["place"];
    this.content = commentMap["content"];
    this.userId = commentMap["author"]["id"];
    this.userName = commentMap["author"]["name"];
    this.userImage = commentMap["author"]["image"];
  }
}
