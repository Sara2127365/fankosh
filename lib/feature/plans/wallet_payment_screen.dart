import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/plans/models/plan_model.dart';
import 'package:fankosh/feature/plans/payment_success_screen.dart';
import 'package:fankosh/feature/plans/widgets/payment_header_title.dart';
import 'package:fankosh/feature/plans/widgets/payment_security_badge.dart';
import 'package:fankosh/feature/plans/widgets/payment_total_bottom_bar.dart';
import 'package:fankosh/feature/plans/widgets/plans_custom_app_bar.dart';
import 'package:fankosh/feature/plans/widgets/selected_plan_summary_banner.dart';
import 'package:fankosh/feature/plans/widgets/wallet_option_tile.dart';
import 'package:fankosh/feature/plans/widgets/wallet_phone_input_box.dart';
import 'package:flutter/material.dart';

class WalletPaymentScreen extends StatefulWidget {
  final PlanModel plan;

  const WalletPaymentScreen({super.key, required this.plan});

  @override
  State<WalletPaymentScreen> createState() => _WalletPaymentScreenState();
}

class _WalletPaymentScreenState extends State<WalletPaymentScreen> {
  int _selectedWalletIndex = 0; // 0 = Vodafone, 1 = Etisalat, 2 = Orange
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: '010 1234 5678');
  }

  @override
  void dispose() {
    _phoneController.dispose();
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

  Widget _buildVodafoneIcon() {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: ColorManager.vodafoneRed,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(4),
      child: Center(
        child: Image.asset(
          AppAssets.vodafoneLogo,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) =>
              const Icon(Icons.circle, color: Colors.white, size: 20),
        ),
      ),
    );
  }

  Widget _buildEtisalatIcon() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorManager.borderColor),
      ),
      padding: const EdgeInsets.all(4),
      child: Center(
        child: Image.asset(
          AppAssets.etisalatLogo,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) => const Icon(
            Icons.spa_rounded,
            color: ColorManager.etisalatGreen,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildOrangeIcon() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: ColorManager.orangeBrand,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(3),
      child: Center(
        child: Image.asset(
          AppAssets.orangeLogo,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) => const Text(
            'orange',
            style: TextStyle(
              fontSize: 8.5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Shared App Bar
                      const PlansCustomAppBar(),

                      const SizedBox(height: 16),

                      // Header Title & Circular Back Button
                      PaymentHeaderTitle(
                        title: 'ادفع بمحفظتك',
                        subtitle: 'اختار محفظتك وكمّل اشتراكك بسهولة وأمان',
                        onBack: () => Navigator.pop(context),
                      ),

                      const SizedBox(height: 18),

                      // Selected Plan Summary Banner
                      SelectedPlanSummaryBanner(
                        plan: plan,
                        onChangePlan: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),

                      const SizedBox(height: 22),

                      // Wallets Section Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'اختار محفظتك',
                            style: TextStyle(
                              fontSize: 15.5,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.textDark,
                            ),
                          ),
                          Text(
                            'محافظ مصر الرقمية',
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorManager.textMuted,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Wallet Option 1: Vodafone Cash
                      WalletOptionTile(
                        title: 'فودافون كاش',
                        iconWidget: _buildVodafoneIcon(),
                        isSelected: _selectedWalletIndex == 0,
                        onTap: () {
                          setState(() {
                            _selectedWalletIndex = 0;
                          });
                        },
                      ),

                      // Wallet Option 2: Etisalat Cash
                      WalletOptionTile(
                        title: 'اتصالات كاش',
                        iconWidget: _buildEtisalatIcon(),
                        isSelected: _selectedWalletIndex == 1,
                        onTap: () {
                          setState(() {
                            _selectedWalletIndex = 1;
                          });
                        },
                      ),

                      // Wallet Option 3: Orange Cash
                      WalletOptionTile(
                        title: 'أورنج كاش',
                        iconWidget: _buildOrangeIcon(),
                        isSelected: _selectedWalletIndex == 2,
                        onTap: () {
                          setState(() {
                            _selectedWalletIndex = 2;
                          });
                        },
                      ),

                      const SizedBox(height: 16),

                      // Mobile Number Input Box
                      WalletPhoneInputBox(controller: _phoneController),

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
