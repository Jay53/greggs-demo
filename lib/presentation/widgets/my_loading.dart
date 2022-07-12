import 'package:flutter/material.dart';
import 'package:greggs/app/config/app_colors.dart';
import 'package:greggs/app/config/app_constants.dart';
import 'package:greggs/presentation/widgets/my_text.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: AppColors.secondPrimary,
          ),
          SizedBox(height: 8),
          MyText(
            AppConstants.loading,
            fontSize: 16,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
