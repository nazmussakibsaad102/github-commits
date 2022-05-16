class UserProfileResponseModel {
  String? login;
  String? avatarUrl;
  String? name;
  String? bio;
  int? publicRepos;
  int? publicGists;

  UserProfileResponseModel(
      {this.login,
        this.avatarUrl,

        this.name,
        this.bio,
        this.publicRepos
      });

  UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
    name = json['name'];
    bio = json['bio'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['avatar_url'] = avatarUrl;
    data['name'] = name;
      data['bio'] = bio;
     data['public_repos'] = publicRepos;
    data['public_gists'] = publicGists;
    return data;
  }
}
