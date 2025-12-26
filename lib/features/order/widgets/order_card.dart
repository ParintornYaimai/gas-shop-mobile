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
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: context.wp(90),
        minHeight: context.hp(72),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: context.wp(13),
                      height: context.wp(13),
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.profile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: context.wp(2)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Parintorn Yaimai",
                          style: GoogleFonts.prompt(
                            fontSize: context.sp(4.5),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "0015679994323",
                          style: GoogleFonts.prompt(
                            fontSize: context.sp(4),
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: context.wp(10),
                  height: context.wp(10),
                  child: Material(
                    color: AppColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(3),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatsView()),
                        );
                      },
                      customBorder: const CircleBorder(),
                      child: Icon(
                        MaterialCommunityIcons.chat_processing,
                        color: Colors.white,
                        size: context.wp(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: context.hp(1)),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "3/10/2568",
                            style: GoogleFonts.prompt(
                              fontSize: context.sp(4),
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkGray,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text("เวลา",style: GoogleFonts.prompt(fontSize: context.sp(4))),
                          const SizedBox(width: 4),
                          Text(
                            "13:05",
                            style: GoogleFonts.prompt(
                              fontSize: context.sp(4),
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkGray,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text("น.",style: GoogleFonts.prompt(fontSize: context.sp(4)) ),
                        ],
                      ),
                      Text(
                        'อาคารเดอะพาลาเดี้ยม .... ชั้น 3',
                        style: GoogleFonts.prompt(fontSize: context.sp(4)),
                      ),
                      SizedBox(height: context.hp(0.7)),
                      Text(
                        'รายละเอียดคำสั่งซื้อ',
                        style: GoogleFonts.prompt(fontSize: context.sp(4), fontWeight: FontWeight.w800,),
                      ),
                      SizedBox(height: context.hp(0.7)),
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("แบรนสยามแก๊ส", style: GoogleFonts.prompt(fontSize: context.sp(4),)),
                            // Image.asset(
                              
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
