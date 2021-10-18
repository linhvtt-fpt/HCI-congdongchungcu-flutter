class CancelReason {
  final String reason;

  CancelReason({ required this.reason});

  static List<CancelReason> getCancelReason() {
        return <CancelReason> [
          CancelReason(reason: "Muốn thay đổi địa chỉ giao hàng"),
          CancelReason(reason: "Muốn thay đổi sản phẩm trong đơn hàng(size, màu sắc, số lượng,...)"),
          CancelReason(reason: "Thủ tục thanh toán quá rắc rối"),
          CancelReason(reason: "Tìm thấy giá rẻ hơn ở chỗ khác"),
        ];
  }
}