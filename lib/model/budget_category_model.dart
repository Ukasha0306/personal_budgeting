import 'package:cloud_firestore/cloud_firestore.dart';

class BudgetCategoryModel {
  final String id;
  final String name;
  final String budget;
  final String spent;

  BudgetCategoryModel({
    required this.id,
    required this.name,
    required this.budget,
    required this.spent,
  });

  static BudgetCategoryModel empty() => BudgetCategoryModel(
        id: '',
        name: '',
        budget: '',
        spent: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'budget': budget,
      'spent': spent,
    };
  }

  factory BudgetCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BudgetCategoryModel(
          id: document.id,
          name: data['name'] ?? '',
          budget: data['budget'] ?? '',
          spent: data['spent'] ?? '');
    } else {
      return BudgetCategoryModel.empty();
    }
  }
}
