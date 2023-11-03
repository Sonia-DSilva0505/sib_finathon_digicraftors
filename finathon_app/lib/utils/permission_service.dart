import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;

    if (permission != PermissionStatus.granted) {
      PermissionStatus newPermission = await Permission.contacts.request();

      if (newPermission == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}