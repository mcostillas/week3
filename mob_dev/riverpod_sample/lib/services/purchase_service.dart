import 'package:riverpod/riverpod.dart';
import 'package:riverpod_sample/global_providers.dart';
import 'package:riverpod_sample/models/purchase.dart';

class PurchaseService {
  final Ref container;
  List<Purchase> _purchases = [];

  PurchaseService(this.container);

  void addPurchase(String customerName, String productName) {
    final customerService = container.read(customerServiceProvider);
    final productService = container.read(productServiceProvider);

    final customer = customerService.customers.firstWhere(
      (customer) => customer.name == customerName,
    );

    final product = productService.products.firstWhere(
      (product) => product.name == productName,
    );

    if (customer != null && product != null) {
      _purchases.add(Purchase(customer, product));
      print('${customer.name} bought ${product.name} (\$${product.price}).');
    } else {
      print('Customer or Product not found.');
    }
  }

  void viewPurchases() {
    if (_purchases.isEmpty) {
      print('No purchases available.');
    } else {
      print('Purchases:');
      for (var purchase in _purchases) {
        print(purchase);
      }
    }
  }

  List<Purchase> get purchases => _purchases;
}