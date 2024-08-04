import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_budgeting/res/components/text_field.dart';
import 'package:personal_budgeting/utils/color.dart';
import 'package:personal_budgeting/utils/extension.dart';
import 'package:personal_budgeting/utils/utils.dart';
import 'package:personal_budgeting/view_model/budget_controller.dart';
import 'package:provider/provider.dart';

class AddCategoryScreen extends StatefulWidget {

  const AddCategoryScreen(
      {super.key,});

  @override
  State<AddCategoryScreen> createState() =>
      _AddCategoryScreenState();
}

class _AddCategoryScreenState
    extends State<AddCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BudgetController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TTextFormField(
                controller: provider.nameController,
                hintText: 'Category Name',
                labelText: 'Category Name',
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              TTextFormField(
                controller: provider.budgetController,
                hintText: 'Total budget amount',
                suffix: const Icon(FontAwesomeIcons.dollarSign),
                labelText:'Total budget amount' ,
                keyBoardType: TextInputType.number,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              TTextFormField(
                controller: provider.spentController,
                hintText: 'Total spent amount',
                labelText: 'Total spent amount',
                suffix: const Icon(FontAwesomeIcons.dollarSign),
                keyBoardType: TextInputType.number,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: context.height*0.08,
                    width: context.width * 0.40,
                    child: Consumer<BudgetController>(
                      builder: (context, value, child) {
                        return OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            value.clearForm();
                          },
                          child: const Text('Cancel'),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.height*0.08,
                    width: context.width * 0.40,
                    child: Consumer<BudgetController>(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          onPressed: () {
                            if (provider.budgetController.text.isEmpty) {
                              Utils.flushBarErrorMessage(
                                  'Please Enter Total Budget ', context);
                            }
                            else if (provider.nameController.text.isEmpty) {
                              Utils.flushBarErrorMessage(
                                  'Please Enter Category Name', context);
                            } else if (
                                provider.spentController.text.isEmpty) {
                              Utils.flushBarErrorMessage(
                                  'Please Enter spent Budget', context);
                            } else {
                              value.addCategoryBudget();
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.pop(context);
                              });
                            }
                          },
                          child:const Text('Save'),
                        );
                      },
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
