import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/send_message_model.dart';
import 'chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final ApiService? apiService;

  ChatRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SendMessageModel>> sendMessage({
    required String message,
    required int teacherId,
  }) async {
    try {
      var data = json.encode({
        "recipient_id": teacherId, /// teacherId
        "message": message
      });
      var response = await apiService!.postData(
        endPoint: EndPoints.sendMessage,
        data: data,
      );
      SendMessageModel result = SendMessageModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
