class CreateRoomModel {
  int? success;
  String? message;
  Data? data;

  CreateRoomModel({this.success, this.message, this.data});

  CreateRoomModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? roomCode;
  String? type;
  String? difficulty;
  int? categoryId;
  List<Player>? players;
  Player? player;

  Data(
      {this.roomCode,
      this.type,
      this.difficulty,
      this.categoryId,
      this.players,
      this.player});

  Data.fromJson(Map<String, dynamic> json) {
    roomCode = json['roomCode'];
    type = json['type'];
    difficulty = json['difficulty'];
    categoryId = json['categoryId'];
    if (json['players'] != null) {
      players = <Player>[];
      json['players'].forEach((v) {
        players!.add(new Player.fromJson(v));
      });
    }
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomCode'] = this.roomCode;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['categoryId'] = this.categoryId;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}

class Player {
  int? playerId;
  int? userId;
  String? name;
  String? avatar;
  bool? isHost;

  Player({this.playerId, this.userId, this.name, this.avatar, this.isHost});

  Player.fromJson(Map<String, dynamic> json) {
    playerId = json['playerId'];
    userId = json['userId'];
    name = json['name'];
    avatar = json['avatar'];
    isHost = json['isHost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playerId'] = this.playerId;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['isHost'] = this.isHost;
    return data;
  }
}
