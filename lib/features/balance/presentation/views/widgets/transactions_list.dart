import 'package:el_kottab/features/balance/presentation/views/widgets/transaction_card.dart';

import '../../../../../main_imports.dart';
import '../balance_view.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SubscriptionItem> subscriptions = [
      SubscriptionItem(
        name: 'الباقة الذهبية',
        price: '200 ريال',
        startDate: '2024-01-01',
        endDate: '2024-03-01',
        totalMinutes: '1000',
        remainingMinutes: '500',
        type: 'اشتراك',
        status: 'نشط',
      ),
      SubscriptionItem(
        name: 'الباقة الفضية',
        price: '150 ريال',
        startDate: '2023-12-01',
        endDate: '2024-02-01',
        totalMinutes: '800',
        remainingMinutes: '200',
        type: 'اشتراك',
        status: 'منتهي',
      ),
      SubscriptionItem(
        name: 'إيداع رصيد',
        price: '+100 ريال',
        startDate: '2023-11-15',
        endDate: '-',
        totalMinutes: '200',
        remainingMinutes: '50',
        type: 'إيداع',
        status: 'مكتمل',
      ),
    ];
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: subscriptions.length,
      separatorBuilder: (context, index) => Gap( 12.h),
      itemBuilder: (context, index) {
        final item = subscriptions[index];
        return TransactionCard(item: item,);
      },
    );
  }
}


