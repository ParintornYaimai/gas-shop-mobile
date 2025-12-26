import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siamgasshop/core/constants/app_assets.dart';
import 'package:siamgasshop/core/constants/app_colors.dart';
import 'package:siamgasshop/features/notification/view/notification_view.dart';
import 'package:siamgasshop/features/setting/view/settings_view.dart';
import '../../../core/utils/size_extension.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomeView extends StatefulWidget {
  // เปลี่ยนเป็น StatefulWidget
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //เพิ่ม State
  int _currentIndex = 0; // เพิ่มตัวแปรเก็บ index

  final List<Map<String, String>> banners = [
    {'image': AppAssets.banner},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.hp(7.4)),
        child: SafeArea(
          child: Container(
            color: AppColors.red,
            child: Container(
              height: context.hp(7),
              padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            width: context.wp(10), // วงกลมใหญ่ (ขอบขาว)
                            height: context.wp(10),
                            padding: EdgeInsets.all(
                              context.wp(1),
                            ), // ความหนาของขอบขาว
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                AppAssets.logo,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: context.wp(5)),
                          Text(
                            "SIAMGAS Shop",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.prompt(
                              fontSize: context.sp(4.9),
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsView(),
                            ),
                          );
                        },
                        child: Icon(
                          Ionicons.person_circle_outline,
                          color: Colors.white,
                          size: context.wp(8.7),
                        ),
                      ),
                      SizedBox(width: context.wp(2)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationView(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: context.wp(8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: context.wp(2),
          ).copyWith(top: context.wp(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(context.wp(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Joe Android debugs",
                      style: GoogleFonts.prompt(
                        fontSize: context.sp(4.5),
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: context.hp(0.5)),
                    Text(
                      "เลขประจำตัวผู้เสียภาษี: 1234567890123",
                      style: GoogleFonts.prompt(
                        fontSize: context.sp(4.5),
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.hp(1)),
              // Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: context.hp(19),
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  enlargeCenterPage: false,
                  aspectRatio: 15 / 20,
                  viewportFraction: 1.0,
                  padEnds: true,
                  onPageChanged: (index, reason) {
                    //เพิ่ม callback
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: banners.map((item) {
                  return Builder(
                    builder: (context) {
                      return SizedBox(
                        width: context.wp(83),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(item['image']!, fit: BoxFit.cover),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              // เพิ่มจุด indicator ตรงนี้
              SizedBox(height: context.hp(1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(1, (index) {
                  return Container(
                    width: 9,
                    height: 9,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? AppColors.red
                          : Colors.grey[300],
                    ),
                  );
                }),
              ),
              SizedBox(height: context.hp(3)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.wp(2.5)),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 0.75,
                  padding: EdgeInsets.zero, //ลบ default padding
                  children: [
                    _buildMenuItem(context, Icons.newspaper, "ข่าวสาร"),
                    _buildMenuItem(context, Icons.card_giftcard, "ชิงโชค"),
                    _buildMenuItem(context, Icons.star, "คะแนน"),
                    _buildMenuItem(context, Icons.language, "เว็บไซต์"),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0, -5), //เลื่อนขึ้น -5  pixels
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "คำสั่งซื้อ >",
                            style: GoogleFonts.prompt(
                              fontSize: context.sp(4.7),
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: context.wp(2)),
                          Container(
                            width: context.wp(21),
                            height: context.hp(3),
                            decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "6 รายการ",
                                style: GoogleFonts.prompt(
                                  fontSize: context.sp(3.5),
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: context.wp(18),
          height: context.wp(18),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: context.wp(14),
            height: context.wp(14),
            decoration: BoxDecoration(
              color: AppColors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: context.wp(9)),
          ),
        ),
        SizedBox(height: context.hp(0.5)),
        Text(
          label,
          style: GoogleFonts.prompt(
            fontSize: context.sp(3.95),
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
