import 'package:collection/collection.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

const _kAdFreeKey = "ad_free";

class RestEyePurchases {
  RestEyePurchases._();

  // 購入を検証
  static Future<bool> isActive() async {
    final info = await Purchases.getCustomerInfo();
    return info.allPurchaseDates[_kAdFreeKey] != null;
  }

  static Future<Package?> getAdFree() async {
    final offerings = await Purchases.getOfferings();
    if (offerings.current != null) {
      return offerings.current?.availablePackages.firstOrNull;
    }

    return null;
  }

  // 広告削除を購入
  static Future<bool> purchaseAdFree() async {
    final package = await getAdFree();

    if (package != null) {
      final info = await Purchases.purchasePackage(package);

      return info.entitlements.all[_kAdFreeKey]?.isActive ?? false;
    } else {
      return false;
    }
  }

  // 購入情報を復元
  static Future<bool> restorePurchases() async {
    final info = await Purchases.restorePurchases();

    return info.entitlements.all[_kAdFreeKey]?.isActive ?? false;
  }
}
