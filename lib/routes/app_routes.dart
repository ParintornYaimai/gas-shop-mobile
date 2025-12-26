import 'package:flutter/material.dart';

// auth
import '../features/auth/view/auth_newshoplogin_view.dart';
import '../features/auth/view/auth_oldshoplogin_view.dart';
import '../features/auth/view/auth_register_view.dart';

// home
import '../features/home/view/home_view.dart';

// chat
import '../features/chat/view/chats_view.dart';
import '../features/chat/view/chatroom_view.dart';

// notifications
import '../features/notification/view/notification_view.dart';
import '../features/notification/view/notification_news_view.dart';
import '../features/notification/view/notification_promotion_view.dart';
import '../features/notification/view/notification_points_view.dart';

// orders
import '../features/order/view/order_pending_view.dart';
import '../features/order/view/order_processing_view.dart';
import '../features/order/view/order_success_view.dart';
import '../features/order/view/order_cancelled_view.dart';

// settings
import '../features/setting/view/settings_view.dart';
import '../features/setting/view/edit_shop_name_view.dart';
import '../features/setting/view/edit_shop_address_view.dart';
import '../features/setting/view/edit_shop_phone_view.dart';
import '../features/setting/view/edit_shop_hours_view.dart';
import '../features/setting/view/edit_shop_document_view.dart';
import '../features/setting/view/edit_shop_products_price_view.dart';

//main
import '../features/main_container/view/main_container_view.dart';

class AppRoutes {
  // ================= AUTH =================
  static const String newShopLogin = '/auth/new-shop-login';
  static const String oldShopLogin = '/auth/old-shop-login';
  static const String register = '/auth/register';

  // ================= HOME =================
  static const String home = '/home';

  // ================= CHAT =================
  static const String chats = '/chats';
  static const String chatRoom = '/chats/room';

  // ================= NOTIFICATIONS =================
  static const String notifications = '/notifications';
  static const String notificationNews = '/notifications/news';
  static const String notificationPromotions = '/notifications/promotions';
  static const String notificationPoints = '/notifications/points';

  // ================= ORDERS =================
  static const String ordersPending = '/orders/pending';
  static const String ordersProcessing = '/orders/processing';
  static const String ordersSuccess = '/orders/success';
  static const String ordersCancelled = '/orders/cancelled';

  // ================= SETTINGS =================
  static const String setting = '/settings';
  static const String editShopName = '/settings/edit/name';
  static const String editShopAddress = '/settings/edit/address';
  static const String editShopPhone = '/settings/edit/phone';
  static const String editShopHours = '/settings/edit/hours';
  static const String editShopDocuments = '/settings/edit/documents';
  static const String editProductsPrice = '/settings/edit/products';

  // ================= MAINCONTAINER =================
  static const String main = '/main';

  // ================= ROUTE GENERATOR =================
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // auth
      case newShopLogin:
        return MaterialPageRoute(builder: (_) => NewshoploginView());

      case oldShopLogin:
        return MaterialPageRoute(builder: (_) => OldshoploginView());

      case register:
        return MaterialPageRoute(builder: (_) => RegisterView());

      // home
      case home:
        return MaterialPageRoute(builder: (_) => HomeView());

      // chat
      case chats:
        return MaterialPageRoute(builder: (_) => ChatsView());

      case chatRoom:
        return MaterialPageRoute(builder: (_) => ChatroomView());

      // notifications
      case notifications:
        return MaterialPageRoute(builder: (_) => NotificationView());

      case notificationNews:
        return MaterialPageRoute(builder: (_) => NotificationNewsView());

      case notificationPromotions:
        return MaterialPageRoute(builder: (_) => NotificationPromotionView());

      case notificationPoints:
        return MaterialPageRoute(builder: (_) => NotificationPointsView());

      // orders
      case ordersPending:
        return MaterialPageRoute(builder: (_) => OrderPendingView());

      case ordersProcessing:
        return MaterialPageRoute(builder: (_) => OrderProcessingView());

      case ordersSuccess:
        return MaterialPageRoute(builder: (_) => OrderSuccessView());

      case ordersCancelled:
        return MaterialPageRoute(builder: (_) => OrderCancelledView());

      // settings
      case setting:
        return MaterialPageRoute(builder: (_) => SettingsView());

      case editShopName:
        return MaterialPageRoute(builder: (_) => EditShopNameView());

      case editShopAddress:
        return MaterialPageRoute(builder: (_) => EditShopAddressView());

      case editShopPhone:
        return MaterialPageRoute(builder: (_) => EditShopPhoneView());

      case editShopHours:
        return MaterialPageRoute(builder: (_) => EditShopHoursView());

      case editShopDocuments:
        return MaterialPageRoute(builder: (_) => EditShopDocumentView());

      case editProductsPrice:
        return MaterialPageRoute(builder: (_) => EditShopProductsPriceView());

      case main:
        return MaterialPageRoute(builder: (_) => const MainContainerView());
      // fallback
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
