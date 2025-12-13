import 'package:el_kottab/features/chat/data/repos/chat_repo.dart';
import 'package:el_kottab/features/chat/presentation/view_model/chat_states.dart';
import '../../../../main_imports.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit(this.chatRepo) : super(ChatInitState());

  ChatRepo? chatRepo;

  static ChatCubit get(context) => BlocProvider.of(context);


}