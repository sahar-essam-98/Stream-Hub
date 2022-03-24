class FeedListResponse {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  FeedListResponse(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  FeedListResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
  }

}

class Data {
  int? id;
  String? title;
  String? description;
  String? path;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? favoritesCount;
  String? commentsCount;
  String? descriptionData;
  String? descriptionIframe;
  bool? isFavorite;
  List<Comments>? comments;
  User? user;

  Data(
      {this.id,
        this.title,
        this.description,
        this.path,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.favoritesCount,
        this.commentsCount,
        this.descriptionData,
        this.descriptionIframe,
        this.isFavorite,
        this.comments,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    path = json['path'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    favoritesCount = json['favorites_count'];
    commentsCount = json['comments_count'];
    descriptionData = json['description_data'];
    descriptionIframe = json['description_iframe'];
    isFavorite = json['is_favorite'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }


}

class Comments {
  int? id;
  String? userId;
  String? description;
  String? postId;
  int? postCommentId;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<Null>? attachments;

  Comments(
      {this.id,
        this.userId,
        this.description,
        this.postId,
        this.postCommentId,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.attachments});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    description = json['description'];
    postId = json['post_id'];
    postCommentId = json['post_comment_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
      });
    }
  }


}

class User {
  int? id;
  String? name;
  String? avatar;
  String? createdAt;
  String? emailNotification;
  String? smsNotification;

  User(
      {this.id,
        this.name,
        this.avatar,
        this.createdAt,
        this.emailNotification,
        this.smsNotification});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    createdAt = json['created_at'];
    emailNotification = json['email_notification'];
    smsNotification = json['sms_notification'];
  }


}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }


}