class DeviceEntity {
  DeviceEntity({
    required this.id,
    required this.name,
    required this.kind,
  });
  final String id;
  final String name;
  final DeviceKind kind;
}

enum DeviceKind {
  ble,
  classic,
  usb,
  wifi,
  unknown,
}
