import 'package:riverpod/riverpod.dart';
import 'package:riverpod_sample/models/customer.dart';

class CustomerService{
final Ref container;
final List<Customer> _customers = [];

CustomerService(this.container);

void addCustomers(String name, String email){
  final newCustomer = Customer(name,email);
  _customers.add(newCustomer);
  print('$name (Email: $email) has been added.');
}

void viewCustomer(){
  if (_customers.isEmpty){
    print( 'No Customers available.');
  }else{
    print('Customers:');
    for (var customer in _customers) {
      print(customer);
    }
  }
}
List<Customer> get customers => _customers;

}
