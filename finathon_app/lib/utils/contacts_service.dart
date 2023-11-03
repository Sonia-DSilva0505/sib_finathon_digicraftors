import 'package:contacts_service/contacts_service.dart';
import 'package:finathon_app/utils/permission_service.dart';

class ContactService {
  static Future<List<Contact>> getContacts() async {
    bool permissionGranted = await PermissionService.requestContactPermission();
   
    if (permissionGranted) {
     
      Iterable<Contact> contacts = await ContactsService.getContacts();
      return contacts.toList();
    } else {
      return [];
    }
  }
}
