import 'package:bloc/bloc.dart';
import 'package:queezy/model/result.dart';
import 'package:queezy/screens/models/create_room_model.dart';
import 'package:queezy/screens/service/create_join_room.dart';

class CreateRoomCubit extends Cubit<Result<CreateRoomModel>> {
  final CreateJoinRoomService _createJoinRoomService;
  CreateRoomCubit(this._createJoinRoomService) : super(Result(isLoading: false));

  Future<void> createRoom({String? difficulity, String? type, int? categoryId}) async{
    try {
      emit(Result(isLoading: true));
      final response = await _createJoinRoomService.createRoom(difficulity: difficulity,type: type,categoryId: categoryId);
      emit(Result(data: response));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
}
