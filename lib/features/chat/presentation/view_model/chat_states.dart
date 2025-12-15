abstract class ChatStates{}

class ChatInitState extends ChatStates{}

class GetAllChatMessagesLoadingState extends ChatStates{}
class GetAllChatMessagesErrorState extends ChatStates{
  final String error;
  GetAllChatMessagesErrorState(this.error);

}
class GetAllChatMessagesSuccessState extends ChatStates{}