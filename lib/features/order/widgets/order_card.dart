import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siamgasshop/core/constants/app_assets.dart';
import 'package:siamgasshop/core/constants/app_colors.dart';
import 'package:siamgasshop/core/utils/size_extension.dart';
import 'package:siamgasshop/features/chat/view/chats_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.wp(90),
      margin: EdgeInsets.symmetric(
        horizontal: context.wp(0.5),
        vertical: context.hp(0.5),
      ),
      padding: EdgeInsets.all(context.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: context.hp(1.5)),
          _buildDateTime(context),
          _buildAddress(context),
          SizedBox(height: context.hp(1)),
          _buildBrandSection(
            context,
            brandName: 'แบรนด์สยามแก๊ส',
            logoAsset: AppAssets.logo,
            showIcon: true,
          ),
          SizedBox(height: context.hp(0.5)),
          _buildProductBox(
            context,
            productName: 'ถังเกลียวแดง 4 กก.',
            note: 'หมายเหตุ : ....',
            price: '193',
          ),
          SizedBox(height: context.hp(1)),
          _buildBrandSection(
            context,
            brandName: 'แบรนด์ยูนิคแก๊ส',
            showIcon: true,
            logoAsset: AppAssets.ugplogo,
          ),
          SizedBox(height: context.hp(0.5)),
          _buildProductBox(
            context,
            productName: 'ถังเกลียวแดง 4 กก.',
            note: 'หมายเหตุ : ....',
            price: '193',
          ),
          SizedBox(height: context.hp(1.5)),
          _buildSummarySection(context),
          SizedBox(height: context.hp(2)),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: context.wp(12),
              height: context.wp(12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                size: context.wp(8),
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: context.wp(2.5)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'xxxxx',
                  style: GoogleFonts.prompt(
                    fontSize: context.sp(4.5),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'เลขที่คำสั่งซื้อ',
                  style: GoogleFonts.prompt(
                    fontSize: context.sp(3.8),
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: context.wp(11),
          height: context.wp(11),
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatsView()),
                );
              },
              child: Icon(
                MaterialCommunityIcons.chat_processing,
                color: Colors.white,
                size: context.wp(6.5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateTime(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.prompt(
          fontSize: context.sp(3.8),
          color: Colors.black87,
        ),
        children: [
          TextSpan(
            text: '3/10/2568',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(text: ' เวลา '),
          TextSpan(
            text: '13:05',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(text: ' น.'),
        ],
      ),
    );
  }

  Widget _buildAddress(BuildContext context) {
    return Text(
      'อาคารเดอะพาลาเดี้ยม .... ชั้น 3',
      style: GoogleFonts.prompt(
        fontSize: context.sp(3.8),
        color: Colors.black87,
      ),
    );
  }

  Widget _buildBrandSection(
    BuildContext context, {
    required String brandName,
    String? logoAsset,
    bool showIcon = false,
    IconData? iconData,
    Color? iconColor,
  }) {
    return Row(
      children: [
        Text(
          brandName,
          style: GoogleFonts.prompt(
            fontSize: context.sp(3.8),
            fontWeight: FontWeight.w700,
          ),
        ),
        if (showIcon && logoAsset != null) ...[
          SizedBox(width: context.wp(1.5)),
          SizedBox(
            width: context.wp(5),
            height: context.wp(5),
            child: Image.asset(
              logoAsset,
              fit: BoxFit.contain,
            ),
          ),
        ],
        if (showIcon && iconData != null) ...[
          SizedBox(width: context.wp(1.5)),
          Icon(
            iconData,
            size: context.sp(4.5),
            color: iconColor ?? Colors.blue,
          ),
        ],
      ],
    );
  }

  Widget _buildProductBox(
    BuildContext context, {
    required String productName,
    required String note,
    required String price,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.wp(3),
        vertical: context.hp(1.2),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: GoogleFonts.prompt(
                    fontSize: context.sp(3.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  note,
                  style: GoogleFonts.prompt(
                    fontSize: context.sp(3.5),
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.prompt(
                fontSize: context.sp(3.8),
                color: Colors.black,
              ),
              children: [
                TextSpan(text: 'ราคา '),
                TextSpan(
                  text: price,
                  style: TextStyle(
                    fontSize: context.sp(4.2),
                    fontWeight: FontWeight.w700,
                    color: AppColors.red,
                  ),
                ),
                TextSpan(text: ' บาท'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'วิธีการชำระเงิน : เงินโอน',
          style: GoogleFonts.prompt(
            fontSize: context.sp(3.8),
            fontWeight: FontWeight.w600,
            color: AppColors.red,
          ),
        ),
        SizedBox(height: context.hp(0.5)),
        
        // Coupon Badge แบบใหม่
        Row(
          children: [
            Text(
              'คูปองที่ใช้ : ',
              style: GoogleFonts.prompt(
                fontSize: context.sp(3.8),
                color: Colors.black87,
              ),
            ),
            _buildCouponBadge(context, 'ลดทันทีเมื่อซื้อครบ -100 บาท'),
          ],
        ),
        
        SizedBox(height: context.hp(0.5)),
        Text(
          'โค้ดโปรโมชั่น :',
          style: GoogleFonts.prompt(
            fontSize: context.sp(3.8),
            color: Colors.black87,
          ),
        ),
        SizedBox(height: context.hp(0.5)),
        _buildSummaryRow(context, 'ค่าจัดส่ง', '50'),
        SizedBox(height: context.hp(0.3)),
        _buildSummaryRow(context, 'ค่ายก', '30'),
        SizedBox(height: context.hp(0.5)),
        Text(
          'ค่าบริการอื่น ๆ :',
          style: GoogleFonts.prompt(
            fontSize: context.sp(3.8),
            color: Colors.black87,
          ),
        ),
        SizedBox(height: context.hp(0.3)),
        _buildSummaryRow(context, 'รวม', '366', isBold: true),
      ],
    );
  }

  // Widget สำหรับ Coupon Badge
  Widget _buildCouponBadge(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.wp(2),
        vertical: context.hp(0.3),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.red,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: GoogleFonts.prompt(
              fontSize: context.sp(3.3),
              fontWeight: FontWeight.w500,
              color: AppColors.red,
            ),
          ),
          SizedBox(width: context.wp(1)),
          Icon(
            Icons.error_outline,
            size: context.sp(3.8),
            color: AppColors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value, {
    bool isBold = false,
  }) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.prompt(
          fontSize: context.sp(3.8),
          color: Colors.black87,
        ),
        children: [
          TextSpan(text: '$label : '),
          TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
              color: AppColors.red,
            ),
          ),
          if (isBold) TextSpan(text: ' บาท'),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: context.hp(4.5),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppColors.red,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                'ยกเลิกคำสั่งซื้อ',
                style: GoogleFonts.prompt(
                  fontSize: context.sp(3.5),
                  fontWeight: FontWeight.w600,
                  color: AppColors.red,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: context.wp(2)),
        Expanded(
          child: SizedBox(
            height: context.hp(4.5),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: Text(
                'ยืนยันคำสั่งซื้อ',
                style: GoogleFonts.prompt(
                  fontSize: context.sp(3.5),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}