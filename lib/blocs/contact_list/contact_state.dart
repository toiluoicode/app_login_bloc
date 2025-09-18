import 'package:equatable/equatable.dart';
import 'package:login_app_bloc/entitys/contact.dart';
import 'package:login_app_bloc/entitys/user.dart';

abstract class ContactListState  extends Equatable{

}
class ContactListLoad extends ContactListState {
  User user;
  ContactListLoad(this.user);
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
