import 'package:flutter/cupertino.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/payment_pages/widgets/payment_types_widget.dart';
import '../../../../../../core/utils/responsiveness/app_responsive.dart';

class ContactUsTab extends StatelessWidget {
  const ContactUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: appH(24),
      children: [
        PaymentTypesWidget(
          image: "assets/images/headphones.png",
          text: "Customer Service",
        ),
        PaymentTypesWidget(
          image: "assets/images/whatsap.png",
          text: "WhatsApp",
        ),
        PaymentTypesWidget(
          image: "assets/images/website.png",
          text: "Website",
        ),
        PaymentTypesWidget(
          image: "assets/images/facebook.png",
          text: "Facebook",
        ),
        PaymentTypesWidget(
          image: "assets/images/twitter.png",
          text: "Twitter",
        ),
        PaymentTypesWidget(
          image: "assets/images/insta.png",
          text: "Instagram",
        ),
      ],
    );
  }
}
