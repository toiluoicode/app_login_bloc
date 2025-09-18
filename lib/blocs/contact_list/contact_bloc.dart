import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/blocs/contact_list/contact_events.dart';
import 'package:login_app_bloc/blocs/contact_list/contact_state.dart';
import 'package:login_app_bloc/entitys/contact.dart';
import 'package:login_app_bloc/entitys/user.dart';

class ContactBloc extends Bloc<ContactListEvent,ContactListState>{
  ContactBloc(User user) : super (ContactListLoad( user)){
    on<AddContact>(_AddContact);
    on<DeleteContact>(_DeleteContact);
  }
  void _AddContact(AddContact event, Emitter<ContactListState> emit){
    if (state is ContactListLoad) {
      final currentState = state as ContactListLoad;
      final updateUser =  currentState.user.coppyWithList(listContact: List<Contact>.from(currentState.user.listContact)..add(event.contact));
      emit(ContactListLoad(updateUser));
    }
  }
  void _DeleteContact(DeleteContact event, Emitter<ContactListState> emit) {
    if (state is ContactListLoad){
      final currentState = state as ContactListLoad;
      final afterDelete = currentState.user.listContact.where((c)=> c.name != event.contact.name ).toList();
      final updateList = currentState.user.coppyWithList(listContact: afterDelete);
      emit(ContactListLoad(updateList));
    }
  }
}