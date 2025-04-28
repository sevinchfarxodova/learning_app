import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_state.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';
import '../../../bloc/confirm_email/confirm_email_event.dart';
import '../widgets/pin_box.dart';

class CreateNewPinPage extends StatefulWidget {
  final String userId;

  const CreateNewPinPage({super.key, required this.userId});

  @override
  State<CreateNewPinPage> createState() => _CreateNewPinPageState();
}

class _CreateNewPinPageState extends State<CreateNewPinPage> {
  final TextEditingController codeController = TextEditingController();

  void _confirmCode() {
    context.read<ConfirmEmailBloc>().add(
      SendConfirmCodeEvent(userId: widget.userId, code: codeController.text, isResetPassword: false),
    );
  }

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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 80),
            BuildPinBoxWidget(controller: codeController),
            const SizedBox(height: 80),
            BlocConsumer<ConfirmEmailBloc, ConfirmEmailState>(
              listener: (context, state) {
                if (state is ConfirmEmailSuccess) {
                  Navigator.pushNamed(context, RouteNames.homePage);
                } else if (state is ConfirmEmailFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is ConfirmEmailLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return LongButtonWg(title: "Continue", onPressed: _confirmCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
