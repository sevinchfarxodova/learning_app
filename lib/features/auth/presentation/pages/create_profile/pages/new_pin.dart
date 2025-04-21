import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_state.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';

import '../widgets/pin_box.dart';


class CreateNewPinPage extends StatefulWidget {
  @override
  State<CreateNewPinPage> createState() => _CreateNewPinPageState();
}

class _CreateNewPinPageState extends State<CreateNewPinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Create New PIN",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Add a PIN number to make your account\n                       more secure.",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400 ),
              ),
            ),
            const SizedBox(height: 80),
            BuildPinBoxWidget(),
            const SizedBox(height: 80),
            BlocConsumer<ConfirmEmailBloc, ConfirmEmailState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ConfirmEmailLoading) {
                  return CircularProgressIndicator();
                }
                return   LongButtonWg(title: "Continue", onPressed: () {
                  Navigator.pushNamed(context, RouteNames.fingerPrint);
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
