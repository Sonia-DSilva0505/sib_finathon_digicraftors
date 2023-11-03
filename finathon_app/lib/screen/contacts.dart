import 'package:contacts_service/contacts_service.dart';
import 'package:finathon_app/utils/contacts_service.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
        body: FutureBuilder<List<Contact>>(
          future: ContactService.getContacts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var contacts = snapshot.data;
              return ListView.builder(
                itemCount: contacts?.length ?? 0,
                itemBuilder: (context, index) {
                  Contact? contact = contacts?[index];
                  return ListTile(
                    title: Text(contact?.displayName ?? ""),
                    subtitle: Text(contact?.phones?[0].value ?? ""),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
