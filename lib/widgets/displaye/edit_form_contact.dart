import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/contact_list/contact_bloc.dart';
import '../../blocs/contact_list/contact_events.dart';
import '../../entitys/contact.dart';

class EditFormContact extends StatefulWidget {
  final Contact contact;

  EditFormContact({super.key, required this.contact});

  @override
  State<EditFormContact> createState() => _EditFormContactState();
}

class _EditFormContactState extends State<EditFormContact> {
  late TextEditingController _nameController;

  late TextEditingController _phoneController;

  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text:widget.contact.name );
    _phoneController = TextEditingController(text:widget.contact.phone );
  }
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
    context.read<ContactBloc>().add(UpdateContact(oldcontact: widget.contact , newcontact: newContact));
    Navigator.pop(context);
  }
  @override

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Sửa Contact"),
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
