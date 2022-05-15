class SingleCommitResponseModel {
  Commit? commit;
  AuthorImg? authorImg;

  SingleCommitResponseModel({this.commit, this.authorImg});

  SingleCommitResponseModel.fromJson(Map<String, dynamic> json) {
    commit = json['commit'] != null ? Commit.fromJson(json['commit']) : null;
    authorImg =
        json['author'] != null ? AuthorImg.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (commit != null) {
      data['commit'] = commit!.toJson();
    }
    if (authorImg != null) {
      data['author'] = authorImg!.toJson();
    }
    return data;
  }
}

class Commit {
  Author? author;
  Committer? committer;
  String? message;

  Commit({this.author, this.committer, this.message});

  Commit.fromJson(Map<String, dynamic> json) {
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    committer = json['committer'] != null
        ? Committer.fromJson(json['committer'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (committer != null) {
      data['committer'] = committer!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Author {
  String? name;

  Author({this.name});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Committer {
  String? date;

  Committer({this.date});

  Committer.fromJson(Map<String, dynamic> json) {
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    return data;
  }
}

class AuthorImg {
  String? avatarUrl;

  AuthorImg({this.avatarUrl});

  AuthorImg.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar_url'] = avatarUrl;
    return data;
  }
}

class AllCommitsResponseModel {
  List<SingleCommitResponseModel>? commits;
  AllCommitsResponseModel({this.commits});
  factory AllCommitsResponseModel.fromJson(List<dynamic> json) {
    List<SingleCommitResponseModel>? commits;
    commits = json.map((e) => SingleCommitResponseModel.fromJson(e)).toList();
    return AllCommitsResponseModel(commits: commits);
  }
}
