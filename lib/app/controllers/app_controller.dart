import 'package:get/get.dart';
import '../data/models/chart_item.dart';
import '../data/models/product.dart';

class AppController extends GetxController {
  // table number
  RxString tableNo = ''.obs;
  RxList<CartItem> orderItems = <CartItem>[].obs;
  RxDouble orderTotalPrice = 0.0.obs;
  RxInt orderTotalItem = 0.obs;

  // add product to order list
  addToOrder({required Product product}) {
    final exist =
        orderItems.firstWhereOrNull((element) => element.id == product.id);
    if (exist != null) {
      // exist add quantity
      exist.qt += 1;
      exist.total = exist.qt * exist.price;
    } else {
      // not exist first add
      orderItems.add(
        CartItem(
          id: product.id,
          title: product.title,
          qt: 1,
          price: product.price,
          total: product.price,
        ),
      );
    }

    orderPriceTotal();
    orderTotalItems();
  }

  // order total items
  orderTotalItems() {
    int total = 0;
    for (var element in orderItems) {
      total = total + element.qt;
    }
    orderTotalItem.value = total;
  }

  // order price total
  orderPriceTotal() {
    double total = 0.0;
    for (var element in orderItems) {
      total = total + element.total;
    }

    orderTotalPrice.value = total;
  }

  // increase item
  increaseQuantity({required String id}) {
    final item = orderItems.firstWhereOrNull((element) => (element.id == id));
    if (item != null) {
      item.qt = item.qt + 1;
      item.total = item.price * item.qt;
    }

    orderPriceTotal();
    orderTotalItems();
    update();
  }

  // decrease item
  void decreaseQuantity({required String id}) {
    final item = orderItems.firstWhereOrNull((element) => (element.id == id));
    if (item != null) {
      item.qt = item.qt - 1;
      item.total = item.price * item.qt;
      if (item.qt == 0) {
        orderItems.removeWhere((element) => (element.id == id));
      }
    }

    orderPriceTotal();
    orderTotalItems();
    update();
  }
}
