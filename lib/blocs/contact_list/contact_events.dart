import 'package:equatable/equatable.dart';
import '../../entitys/contact.dart';
import '../../entitys/user.dart';

abstract class ContactListEvent  extends Equatable{

  const ContactListEvent();
}
class AddContact extends ContactListEvent{
  final Contact contact;
  const AddContact({required this.contact});
  @override
  // TODO: implement props
  List<Object?> get props => [contact];

}
class DeleteContact extends ContactListEvent {
  final Contact contact;

  DeleteContact(this.contact);
  @override
  // TODO: implement props
  List<Object?> get props => [contact];

}
class UpdateContact extends ContactListEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}