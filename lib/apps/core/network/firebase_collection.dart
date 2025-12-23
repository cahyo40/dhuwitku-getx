import 'package:cloud_firestore/cloud_firestore.dart';

final userCollection = FirebaseFirestore.instance.collection('users');
final workspaceCollection = FirebaseFirestore.instance.collection('workspaces');
final memberCollection = FirebaseFirestore.instance.collection('members');
final transactionCollection = FirebaseFirestore.instance.collection(
  'transactions',
);
final budgetCollection = FirebaseFirestore.instance.collection('budgets');
final activityCollection = FirebaseFirestore.instance.collection('activities');
final categoryCollection = FirebaseFirestore.instance.collection('categories');
