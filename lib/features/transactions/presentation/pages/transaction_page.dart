import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_bar/default_app_bar_wg.dart';
import '../../../../core/constants/strings/app_strings.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:DefaultAppBarWg(
        titleText: AppStrings.transactions,
        onMorePressed: () {
          Navigator.pop(context);
        },
onSearchPressed: (){

},
      ),
    );
  }
}
