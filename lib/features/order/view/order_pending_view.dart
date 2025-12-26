import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siamgasshop/core/constants/app_colors.dart';
import 'package:siamgasshop/core/utils/size_extension.dart';

class OrderPendingView extends StatelessWidget {
  const OrderPendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.hp(7.4)),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: context.hp(7),
            color: AppColors.red,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    'คำสั่งซื้อ',
                    style: GoogleFonts.prompt(
                      fontSize: context.sp(5.9),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: context.wp(4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // กลับไปหน้าก่อนหน้า
                    },
                    child: Icon(
                      Ionicons.chevron_back,
                      color: Colors.white,
                      size: context.wp(6.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(child: Text('Order Pending Content')),
    );
  }
}
