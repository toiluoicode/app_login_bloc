import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/contact_list/contact_bloc.dart';
import '../../blocs/contact_list/contact_events.dart';
import '../../entitys/contact.dart';

class AddFormContatct extends StatelessWidget {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  AddFormContatct({super.key});

  void _saveContact(BuildContext context) {
    final newContact = Contact(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
    );
    if (newContact.name.isEmpty || newContact.phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tên hoặc số điện thoại trống")),
      );
      return;
    }
    context.read<ContactBloc>().add(AddContact(contact: newContact));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Thêm Contact"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Tên",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: "Số điện thoại",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Đóng"),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text("Lưu"),
          onPressed: () => _saveContact(context),
        ),
      ],
    );
  }
}
