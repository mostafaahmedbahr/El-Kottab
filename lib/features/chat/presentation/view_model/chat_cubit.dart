import 'package:el_kottab/features/chat/data/models/send_message_model.dart';
import 'package:el_kottab/features/chat/data/repos/chat_repo.dart';
import 'package:el_kottab/features/chat/presentation/view_model/chat_states.dart';
import '../../../../main_imports.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit(this.chatRepo) : super(ChatInitState());

  ChatRepo? chatRepo;

  static ChatCubit get(context) => BlocProvider.of(context);

  SendMessageModel? sendMessageModel;

  Future<void> sendMessage({
    required String message,
    required int teacherId,
  }) async {
    emit(SendMessageLoadingState());
    var result = await chatRepo!.sendMessage(
      message: message,
      teacherId: teacherId,
    );
    return result.fold(
      (failure) {
        emit(SendMessageErrorState(failure.errMessage));
      },
      (data) async {
        sendMessageModel = data;
        emit(SendMessageSuccessState(data));
      },
    );
  }


  var messageCon = TextEditingController();
}
