import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/widgets/displaye/edit_form_contact.dart';
import '../../blocs/contact_list/contact_bloc.dart';
import '../../blocs/contact_list/contact_events.dart';
import '../../entitys/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  const ContactItem({super.key, required this.contact});
  @override
  Widget build(BuildContext context) {
    final contactBloc = context.read<ContactBloc>();
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
        contactBloc.add(DeleteContact(contact));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
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
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_){
                        return BlocProvider.value(value: context.read<ContactBloc>(),
                        child: EditFormContact(contact: contact,));
                      },
                  );
                },
                icon: Icon(Icons.edit)
            )
          ],
        ),
      ),
    );
  }
}
