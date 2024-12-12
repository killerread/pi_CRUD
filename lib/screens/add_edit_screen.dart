import 'package:flutter/material.dart';
import '../models/contact.dart';
import 'package:pi_crud/services/db_services.dart';

class AddEditScreen extends StatefulWidget {
  final Contact? contact;

  const AddEditScreen({super.key, this.contact});

  @override
  // ignore: library_private_types_in_public_api
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.contact != null) {
      _nameController.text = widget.contact!.name;
      _emailController.text = widget.contact!.email;
      _phoneController.text = widget.contact!.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.contact == null ? 'Add Contact' : 'Edit Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final contact = Contact(
                  id: widget.contact?.id,
                  name: _nameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                );

                if (widget.contact == null) {
                  DBService().insertContact(contact);
                } else {
                  DBService().updateContact(contact);
                }

                Navigator.pop(context);
              },
              child: Text(widget.contact == null ? 'Add Contact' : 'Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
