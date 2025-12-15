abstract class SessionsStates{}

class SessionsInitState extends SessionsStates{}

class GetAllSessionsLoadingState extends SessionsStates{}
class GetAllSessionsErrorState extends SessionsStates{
  final String error;
  GetAllSessionsErrorState(this.error);

}
class GetAllSessionsSuccessState extends SessionsStates{}