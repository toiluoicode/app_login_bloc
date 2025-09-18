import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/blocs/contact_list/contact_bloc.dart';
import 'package:login_app_bloc/blocs/contact_list/contact_events.dart';
import 'package:login_app_bloc/blocs/contact_list/contact_state.dart';
import '../entitys/contact.dart';
import '../entitys/user.dart';

class ListContactScreen extends StatefulWidget {
  User user;

  ListContactScreen({super.key, required this.user});

  @override
  State<ListContactScreen> createState() => _ListContactScreenState();
}

class _ListContactScreenState extends State<ListContactScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void _showAddContactForm(BuildContext context) {
    final contactBloc = context.read<ContactBloc>();
    showDialog(
      context: context,
      builder: (context) {
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
              onPressed: () {
                final newContact = Contact(
                  name: _nameController.text,
                  phone: _phoneController.text,
                );
                contactBloc.add(AddContact(contact: newContact));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactBloc(widget.user),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Contact " + widget.user.userName),
        ),
        body: BlocConsumer<ContactBloc, ContactListState>(
          listener: (BuildContext context, ContactListState state) {},
          builder: (BuildContext context, ContactListState state) {
            if (state is ContactListLoad) {
              final contacts = state.user.listContact;
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return Dismissible(
                    key: Key(contact.name + contact.phone),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      context.read<ContactBloc>().add(DeleteContact(contact));
                    },
                    child: GestureDetector(
                      onTap: () {
                        // update contact
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            CircleAvatar(child: Text(contact.name[0])),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(contact.name),
                                Text(contact.phone),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                _showAddContactForm(context);
              },
              child: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
