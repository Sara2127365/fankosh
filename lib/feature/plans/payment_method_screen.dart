import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/plans/card_payment_screen.dart';
import 'package:fankosh/feature/plans/models/plan_model.dart';
import 'package:fankosh/feature/plans/wallet_payment_screen.dart';
import 'package:fankosh/feature/plans/widgets/payment_method_tile.dart';
import 'package:fankosh/feature/plans/widgets/plans_custom_app_bar.dart';
import 'package:fankosh/feature/plans/widgets/selected_plan_summary_banner.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  final PlanModel plan;

  const PaymentMethodScreen({super.key, required this.plan});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _selectedMethodIndex = 0; // 0 = Bank card, 1 = E-wallet

  void _handlePayment() {
    if (_selectedMethodIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CardPaymentScreen(plan: widget.plan),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WalletPaymentScreen(plan: widget.plan),
        ),
      );
    }
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Shared App Bar
                      const PlansCustomAppBar(),

                      const SizedBox(height: 12),

                      // Top Small Notice
                      const Text(
                        'إتمام عملية الدفع بأمان وسرعة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.textDark,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Header with Circular Back Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'اختار طريقة الدفع',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.textDark,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: ColorManager.cardBackground,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.chevron_right_rounded,
                                size: 28,
                                color: ColorManager.textDark,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        'اختار الطريقة اللي تناسبك وكمّل اشتراكك.',
                        style: TextStyle(
                          fontSize: 13,
                          color: ColorManager.textMuted,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Selected Plan Mini Card
                      SelectedPlanSummaryBanner(
                        plan: plan,
                        onChangePlan: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),

                      const SizedBox(height: 24),

                      // Payment Methods Section
                      const Text(
                        'طرق الدفع المتاحة',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.textDark,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Option 1: Bank Card
                      PaymentMethodTile(
                        title: 'بطاقة بنكية',
                        subtitle: 'Visa • Mastercard • Meeza',
                        icon: Icons.credit_card_rounded,
                        iconColor: ColorManager.cardOrange,
                        iconBackgroundColor: ColorManager.cardOrangeBg,
                        isSelected: _selectedMethodIndex == 0,
                        onTap: () {
                          setState(() {
                            _selectedMethodIndex = 0;
                          });
                        },
                      ),

                      // Option 2: E-Wallet
                      PaymentMethodTile(
                        title: 'محفظة إلكترونية',
                        subtitle: 'الدفع بالمحفظة',
                        icon: Icons.account_balance_wallet_outlined,
                        iconColor: ColorManager.walletPink,
                        iconBackgroundColor: ColorManager.walletPinkBg,
                        isSelected: _selectedMethodIndex == 1,
                        onTap: () {
                          setState(() {
                            _selectedMethodIndex = 1;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Bottom Sticky Payment Area
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                decoration: const BoxDecoration(
                  color: ColorManager.backgroundColor,
                  border: Border(
                    top: BorderSide(color: ColorManager.borderColor),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Total Due Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'الإجمالي المستحق',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textDark,
                          ),
                        ),
                        Text(
                          '${plan.price} جنيه',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: ColorManager.goldAmber,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Pay Button
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primaryColor,
                          foregroundColor: ColorManager.textDark,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: _handlePayment,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'متابعة للدفع',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.textDark,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: ColorManager.textDark,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
