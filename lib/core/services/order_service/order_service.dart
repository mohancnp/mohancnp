abstract class OrderService {
  Future createOrder(Map<String, dynamic> data);
  Future getAllOrder();
  Future getOrderDetailWithId({required int id});
  Future cancelOrderWithId({required int id});
  Future reorderWithOrderId({required int id});
}
