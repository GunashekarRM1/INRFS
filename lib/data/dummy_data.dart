import '../models/user_model.dart';

final dummyUser = UserModel(
  name: 'John Doe',
  mobile: '9876543210',
  email: 'john@example.com',
  customerId: 'I1234',
);
class Investment {
  final String id;
  final int amount;
  final int returns;
  final bool isActive;

  Investment({
    required this.id,
    required this.amount,
    required this.returns,
    required this.isActive,
  });
}

final investments = [
  Investment(
    id: 'INV-2024-001',
    amount: 10000,
    returns: 1800,
    isActive: true,
  ),
  Investment(
    id: 'INV-2024-002',
    amount: 5000,
    returns: 600,
    isActive: true,
  ),
  Investment(
    id: 'INV-2023-045',
    amount: 20000,
    returns: 4800,
    isActive: false,
  ),
];
