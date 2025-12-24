import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/lang/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/packages_cubit.dart';

class CurrencyBottomSheet extends StatelessWidget {
  const CurrencyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PackagesCubit>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Text(
            LangKeys.chooseYourCurrency.tr(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          ListTile(
            title:   Text("${LangKeys.egyptianPound.tr()} (EGP)"),
            trailing: cubit.selectedCurrency == "EGP"
                ? const Icon(Icons.check)
                : null,
            onTap: () {
              cubit.changeCurrency("EGP");
              Navigator.pop(context);
            },
          ),

          ListTile(
            title:   Text("${LangKeys.uSDollar.tr()} (USD)"),
            trailing: cubit.selectedCurrency == "USD"
                ? const Icon(Icons.check)
                : null,
            onTap: () {
              cubit.changeCurrency("USD");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
