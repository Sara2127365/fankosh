import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/plans/models/plan_model.dart';
import 'package:fankosh/feature/plans/payment_success_screen.dart';
import 'package:fankosh/feature/plans/widgets/card_form_box.dart';
import 'package:fankosh/feature/plans/widgets/payment_header_title.dart';
import 'package:fankosh/feature/plans/widgets/payment_security_badge.dart';
import 'package:fankosh/feature/plans/widgets/payment_total_bottom_bar.dart';
import 'package:fankosh/feature/plans/widgets/plans_custom_app_bar.dart';
import 'package:fankosh/feature/plans/widgets/selected_plan_summary_banner.dart';
import 'package:flutter/material.dart';

class CardPaymentScreen extends StatefulWidget {
  final PlanModel plan;

  const CardPaymentScreen({super.key, required this.plan});

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  late final TextEditingController _cardNumberController;
  late final TextEditingController _expiryController;
  late final TextEditingController _cvvController;
  late final TextEditingController _holderNameController;

  @override
  void initState() {
    super.initState();
    _cardNumberController = TextEditingController(text: '1234 5678 9012 3456');
    _expiryController = TextEditingController(text: '08/28');
    _cvvController = TextEditingController(text: '123');
    _holderNameController = TextEditingController(text: 'AHMED MOHAMED');
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _holderNameController.dispose();
    super.dispose();
  }

  void _onPayNow() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentSuccessScreen(plan: widget.plan),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final plan = widget.plan;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Shared App Bar
                      const PlansCustomAppBar(),

                      const SizedBox(height: 16),

                      // Header Title & Circular Back Button
                      PaymentHeaderTitle(
                        title: 'ادخل بيانات بطاقتك',
                        subtitle: 'كمّل اشتراكك بسهولة وأمان',
                        onBack: () => Navigator.pop(context),
                      ),

                      const SizedBox(height: 18),

                      // Selected Plan Summary Banner
                      SelectedPlanSummaryBanner(
                        plan: plan,
                        onChangePlan: () {
                          // Go back to plans selection
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),

                      const SizedBox(height: 18),

                      // Card Details Box
                      CardFormBox(
                        cardNumberController: _cardNumberController,
                        expiryController: _expiryController,
                        cvvController: _cvvController,
                        holderNameController: _holderNameController,
                      ),

                      const SizedBox(height: 16),

                      // Security Badge
                      const PaymentSecurityBadge(),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Bottom Sticky Pay Footer
              PaymentTotalBottomBar(
                price: plan.price,
                onPay: _onPayNow,
                buttonText: 'ادفع الآن',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
