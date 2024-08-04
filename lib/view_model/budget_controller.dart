import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:personal_budgeting/model/budget_category_model.dart';
import 'package:personal_budgeting/utils/utils.dart';

class BudgetController extends ChangeNotifier {


  final nameController = TextEditingController();
  final budgetController = TextEditingController();
  final spentController = TextEditingController();

  final _db = FirebaseFirestore.instance;

  Future<void> addCategoryBudget() async {

    try {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      final model = BudgetCategoryModel(
          name: nameController.text,
          budget: budgetController.text,
          spent: spentController.text,
          id: id);
      await _db
          .collection('budget')
          .doc(model.id)
          .set(model.toJson())
          .then((value) {

        clearForm();
        Utils.toastMesg('Category Added Successfully');
      });
    } catch (e) {

      if (kDebugMode) {
        print('Error in addCategoryBudget $e');
      }
    }
  }

  Stream<List<BudgetCategoryModel>> fetchCategory() {
    try {
      return _db.collection('budget').snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => BudgetCategoryModel.fromSnapshot(doc))
            .toList();
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error in fetchCategory');
      }
      throw 'Something went wrong. Please try again later';
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      return await _db.collection('budget').doc(id).delete();
    } catch (e) {
      if (kDebugMode) {
        print('Error in deleteCategory $e');
      }
      throw 'Something went wrong. Please try again later';
    }
  }


  Future<void> updateCategory(String id, String name, String budget) async {
    try {
      await _db.collection('budget').doc(id).update({
        'name': name,
        'budget': budget,
      });
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error in updateCategory: $e');
      }
      throw 'Something went wrong. Please try again later';
    }
  }


  clearForm() {
    nameController.clear();
    budgetController.clear();
    spentController.clear();
  }

  updateClearForm() {
    nameController.clear();
    budgetController.clear();
  }
}
