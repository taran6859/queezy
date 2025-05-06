import 'package:queezy/screens/models/create_room_model.dart';
import 'package:queezy/service/dio_instance.dart';

class CreateJoinRoomService {
  CreateJoinRoomService();

  Future<CreateRoomModel> createRoom({String? difficulity, String? type, int? categoryId}) async {
  try {
    final response = await DioSingleton.instance.dio.post("create_room", data: {
      "difficulity": difficulity ?? "easy",
      "type": type ?? "multiple",
      "categoryId": categoryId,
    });
    final body = response.data;
    return CreateRoomModel.fromJson(body);
  } catch (e) {
    print("Error while creating room: $e");
    rethrow;
  }
}

Future<CreateRoomModel> joinRoom({String? roomCode}) async {
  try {
    final response = await DioSingleton.instance.dio.post("create_room", data: {
      "roomCode": roomCode,
    });
    final body = response.data;
    return CreateRoomModel.fromJson(body);
  } catch (e) {
    print("Error while joining room: $e");
    rethrow;
  }
}

}