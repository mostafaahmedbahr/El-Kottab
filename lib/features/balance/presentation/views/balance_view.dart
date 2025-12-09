import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/balance/presentation/views/widgets/balance_summary_card.dart';
import 'package:el_kottab/features/balance/presentation/views/widgets/toggle_buttons_section.dart';
import 'package:el_kottab/features/balance/presentation/views/widgets/transactions_list.dart';
import 'package:el_kottab/main_imports.dart';

class BalanceView extends StatelessWidget {
  const BalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.balance.tr()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          children: [
            ToggleButtonsSection(),
            Gap(24.h),
            BalanceSummaryCard(),
            Gap(24.h),
            Expanded(
              child: TransactionsList(),
            ),
          ],
        ),
      ),
    );
  }





}
class SubscriptionItem {
  final String name;
  final String price;
  final String startDate;
  final String endDate;
  final String totalMinutes;
  final String remainingMinutes;
  final String type;
  final String status;

  SubscriptionItem({
    required this.name,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.totalMinutes,
    required this.remainingMinutes,
    required this.type,
    required this.status,
  });
}