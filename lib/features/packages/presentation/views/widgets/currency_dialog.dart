import '../../../../../core/utils/enums.dart';
import '../../../../../main_imports.dart';

Future<void> showCurrencyDialog({
  required BuildContext context,
  required Currency selectedCurrency,
  required Function(Currency) onSelected,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Select Currency'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<Currency>(
              title: const Text('Egyptian Pound (EGP)'),
              value: Currency.egp,
              groupValue: selectedCurrency,
              onChanged: (value) {
                onSelected(value!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<Currency>(
              title: const Text('US Dollar (USD)'),
              value: Currency.usd,
              groupValue: selectedCurrency,
              onChanged: (value) {
                onSelected(value!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
