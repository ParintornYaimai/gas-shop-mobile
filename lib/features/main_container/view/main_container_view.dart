import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siamgasshop/core/constants/app_colors.dart';
import '../../home/view/home_view.dart';
import '../../order/view/order_pending_view.dart';
import '../../order/view/order_processing_view.dart';
import '../../order/view/order_cancelled_view.dart';
import '../../order/view/order_success_view.dart';

class MainContainerView extends StatefulWidget {
  const MainContainerView({super.key});

  @override
  State<MainContainerView> createState() => _MainContainerViewState();
}

class _MainContainerViewState extends State<MainContainerView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const OrderPendingView(),
    const OrderProcessingView(),
    const OrderCancelledView(),
    const OrderSuccessView(),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: SafeArea(
        top: false,
        bottom: false, 
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.red,
                width: 1,
              ),
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              selectedItemColor: AppColors.red,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              enableFeedback: false,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0, 
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'หน้าหลัก',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long_outlined),
                  activeIcon: Icon(Icons.receipt_long),
                  label: 'คำสั่งซื้อ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_shipping_outlined),
                  activeIcon: Icon(Icons.local_shipping),
                  label: 'กำลังจัดส่ง',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.block_outlined),
                  activeIcon: Icon(Icons.block),
                  label: 'ยกเลิก',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history_outlined),
                  activeIcon: Icon(Icons.history),
                  label: 'ประวัติ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}