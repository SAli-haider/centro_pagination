import 'package:permission_handler/permission_handler.dart';

Future<void> requestNotificationPermission() async {
  PermissionStatus status = await Permission.notification.status;

  if (status != PermissionStatus.granted) {
    await Permission.notification.request();
  }
}
