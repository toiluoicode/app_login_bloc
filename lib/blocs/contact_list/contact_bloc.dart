import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/blocs/contact_list/contact_events.dart';
import 'package:login_app_bloc/blocs/contact_list/contact_state.dart';
import 'package:login_app_bloc/entitys/contact.dart';
import 'package:login_app_bloc/entitys/user.dart';

import '../../storage/user_storage.dart';

class ContactBloc extends Bloc<ContactListEvent,ContactListState>{
  ContactBloc(User user) : super (ContactListLoad( user)){
    on<AddContact>(_AddContact);
    on<DeleteContact>(_DeleteContact);
    on<UpdateContact>(_UpdateContact);
  }
  void _AddContact(AddContact event, Emitter<ContactListState> emit) async{
    if (state is ContactListLoad) {
      final currentState = state as ContactListLoad;
      final updateUser =  currentState.user.coppyWithList(listContact: List<Contact>.from(currentState.user.listContact)..add(event.contact));
      List<User> users = await UserStorage.loadUsers();
      int index = users.indexWhere((u) => u.userName == updateUser.userName);
      if (index != -1) {
        users[index] = updateUser;
        await UserStorage.saveData(users);
      }
      emit(ContactListLoad(updateUser));
    }
  }
  void _DeleteContact(DeleteContact event, Emitter<ContactListState> emit) async {
    if (state is ContactListLoad){
      final currentState = state as ContactListLoad;
      final deleteContact = currentState.user.listContact.where((c)=> c.name != event.contact.name ).toList();
      final updateUser = currentState.user.coppyWithList(listContact: deleteContact);
      List<User> users = await UserStorage.loadUsers();
      int index = users.indexWhere((u) => u.userName == updateUser.userName);
      if (index != -1) {
        users[index] = updateUser;
        await UserStorage.saveData(users);
      }
      emit(ContactListLoad(updateUser));
    }
  }
  void _UpdateContact (UpdateContact event, Emitter<ContactListState> emit) async {
    if (state is ContactListLoad){
      final currentState = state as ContactListLoad;
      final updateContacts =  currentState.user.listContact.map((c)=> (
          (c.name == event.oldcontact.name) ? event.newcontact : c)).toList();
      final UpdateUser =  currentState.user.coppyWithList(listContact: updateContacts);
      List<User> users = await UserStorage.loadUsers();
      final index = users.indexWhere((u)=> u.userName == UpdateUser.userName);
      if (index != -1){
        users[index] = UpdateUser;
        await UserStorage.saveData(users);
      }
      emit(ContactListLoad(UpdateUser));
    }
  }

}