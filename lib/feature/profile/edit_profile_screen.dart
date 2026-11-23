import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/birthday/birthday_picker_screen.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String? initialImage;

  const EditProfileScreen({super.key, this.initialImage});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: 'أحمد محمد',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'ahmed@example.com',
  );
  String _birthDate = '14 أكتوبر 1998';
  String? _pickedImagePath;

  @override
  void initState() {
    super.initState();
    _pickedImagePath = widget.initialImage;
  }

  Future<void> _pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null && result.files.single.path != null) {
        setState(() {
          _pickedImagePath = result.files.single.path;
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // Top Header with Back Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: ColorManager.cardBackground,
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorManager.borderLight),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: ColorManager.textDark,
                        ),
                      ),
                    ),
                    const Text(
                      'تعديل الملف الشخصي',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.textDark,
                      ),
                    ),
                    const SizedBox(width: 44),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),

                      // Avatar with camera badge
                      GestureDetector(
                        onTap: _pickImage,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              width: 105,
                              height: 105,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF0C2),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: _pickedImagePath != null
                                    ? Image.file(
                                        File(_pickedImagePath!),
                                        width: 105,
                                        height: 105,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        AppAssets.userAvatar,
                                        width: 105,
                                        height: 105,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: ColorManager.primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                size: 18,
                                color: ColorManager.textDark,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      GestureDetector(
                        onTap: _pickImage,
                        child: const Text(
                          'انقر لتغيير صورتك',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textCharcoal,
                          ),
                        ),
                      ),

                      const SizedBox(height: 26),

                      // Name Field
                      _buildFieldHeader('الاسم'),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _nameController,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.textDark,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.cancel_outlined,
                              size: 18,
                              color: ColorManager.textHint,
                            ),
                            onPressed: () => _nameController.clear(),
                          ),
                          suffixIcon: const Icon(
                            Icons.person_outline_rounded,
                            color: ColorManager.textHint,
                          ),
                          filled: true,
                          fillColor: ColorManager.cardBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: ColorManager.borderColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: ColorManager.borderColor,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Email Field
                      _buildFieldHeader('البريد الإلكتروني'),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _emailController,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.textDark,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.mail_outline_rounded,
                            color: ColorManager.textHint,
                          ),
                          filled: true,
                          fillColor: ColorManager.cardBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: ColorManager.borderColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: ColorManager.borderColor,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Birth Date Field (Clickable)
                      _buildFieldHeader('تاريخ الميلاد'),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BirthdayPickerScreen(),
                            ),
                          );
                          if (result != null && result is String) {
                            setState(() {
                              _birthDate = result;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.cardBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: ColorManager.borderColor),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.lock_outline_rounded,
                                size: 18,
                                color: ColorManager.textHint,
                              ),
                              const Spacer(),
                              Text(
                                _birthDate,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.textDark,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 18,
                                color: ColorManager.textHint,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Info Shield Note
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.verified_user_outlined,
                            size: 16,
                            color: ColorManager.greenSuccess,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'هنستخدم تاريخ ميلادك بس عشان نهنّيك في يومك المميز.',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: ColorManager.textCharcoal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Save Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 16,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor,
                      foregroundColor: ColorManager.textDark,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('تم حفظ التغييرات بنجاح'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      Navigator.pop(context, {
                        'image': _pickedImagePath,
                        'name': _nameController.text,
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_rounded,
                          size: 20,
                          color: ColorManager.textDark,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'حفظ التغييرات',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldHeader(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: ColorManager.textDark,
        ),
      ),
    );
  }
}
