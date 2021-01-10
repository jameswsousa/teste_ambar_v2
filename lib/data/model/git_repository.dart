import 'package:equatable/equatable.dart';

class GitRepo extends Equatable {
  final String name;
  final String owner;
  final String avatar;
  final String repUrl;

  GitRepo({
    this.avatar,
    this.name,
    this.owner,
    this.repUrl,
  });

  factory GitRepo.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;

    return GitRepo(
      name: json['name'],
      owner: json['owner']['login'],
      avatar: json['owner']['avatar_url'],
      repUrl: json['html_url'],
    );
  }

  @override
  List<Object> get props => [
        name,
        avatar,
        owner,
        repUrl,
      ];
}
