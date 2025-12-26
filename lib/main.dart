import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  //ตั้งค่า System UI (Status Bar + Navigation Bar)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Status Bar โปร่งใส
      statusBarIconBrightness: Brightness.dark, // ไอคอนสีเข้ม
      statusBarBrightness: Brightness.light, // สำหรับ iOS
      systemNavigationBarColor: Colors.white, // Navigation Bar สีขาว
      systemNavigationBarIconBrightness: Brightness.dark, // ไอคอนสีเข้ม
      systemNavigationBarDividerColor: Colors.transparent, // ไม่มีเส้นแบ่ง
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SiamGas Shop',
      theme: ThemeData(
        //พื้นหลังสีขาวทั้งแอพ
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        
        //AppBar Theme
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red, // หรือสีที่ต้องการ
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: GoogleFonts.prompt( 
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light, // ไอคอนสีอ่อนบน AppBar แดง
            statusBarBrightness: Brightness.dark,
          ),
        ),
        
        //Bottom Navigation Bar Theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
        
        useMaterial3: false, colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ).copyWith(
          surface: Colors.white, // พื้นผิวสีขาว
          background: Colors.white, // พื้นหลังสีขาว
        ).copyWith(background: Colors.white), //ปิด Material 3 เพื่อควบคุมง่ายขึ้น
      ),
      initialRoute: AppRoutes.main,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}