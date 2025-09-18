import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/blocs/contact_list/contact_bloc.dart';
import 'package:login_app_bloc/blocs/contact_list/contact_state.dart';
import 'package:login_app_bloc/widgets/displaye/add_form_contatct.dart';
import '../entitys/user.dart';
import '../widgets/displaye/ContactItem.dart';

class ListContactScreen extends StatefulWidget {
  User user;
  ListContactScreen({super.key, required this.user});

  @override
  State<ListContactScreen> createState() => _ListContactScreenState();
}

class _ListContactScreenState extends State<ListContactScreen> {
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
                  return ContactItem(contact: contact);
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
                showDialog(
                    context: context,
                    builder: (_){
                      return BlocProvider.value(value: context.read<ContactBloc>(),
                      child: AddFormContatct(),
                      );
                    }
                );
              },
              child: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
