abstract class BalanceStates{}

class BalanceInitState extends BalanceStates{}

class GetBalanceLoadingState extends BalanceStates{}
class GetBalanceErrorState extends BalanceStates{
  final String error;
  GetBalanceErrorState(this.error);

}
class GetBalanceSuccessState extends BalanceStates{}

