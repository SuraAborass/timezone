class OrderState {
  static String fromId(int id) {
    switch (id) {
      case 0:
        return "تم الإستلام";
      case 1:
        return "قيد التدقيق";
      case 2:
        return "قيد التجهيز";
      case 3:
        return "قيد التوصيل";
      case 4:
        return "تم التسليم";

      default:
        return "";
    }
  }
}
