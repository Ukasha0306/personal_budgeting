import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_budgeting/res/components/text_field.dart';
import 'package:personal_budgeting/utils/color.dart';
import 'package:personal_budgeting/utils/extension.dart';
import 'package:personal_budgeting/utils/routes/route_name.dart';
import 'package:personal_budgeting/view_model/budget_controller.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final String id;
  final String name;
  final String budget;
  final String spent;
  const DetailsScreen(
      {super.key, required this.id, required this.name, required this.budget, required this.spent});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late TextEditingController _spentController;
  late TextEditingController _nameController;
  late TextEditingController _budgetController;
  bool _isEditing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _spentController = TextEditingController(text: widget.spent);
    _nameController = TextEditingController(text: widget.name);
    _budgetController = TextEditingController(text: widget.budget);
  }

  @override
  void dispose() {
    _spentController.dispose();
    _nameController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      if (_isEditing) {
        // Save the updated values
        Provider.of<BudgetController>(context, listen: false).updateCategory(
          widget.id,
          _nameController.text,
          _budgetController.text,
        );
      }
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.name.toString()),
        actions: [
          Consumer<BudgetController>(
            builder: (context, value, child){
              return  TextButton(
                onPressed: () {
                  _toggleEditing();

                },
                child: Text(_isEditing ? 'Save' : 'Edit',style: const TextStyle(color: AppColor.primary),),
              );
            },

          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TTextFormField(
              controller: _nameController,
              hintText: 'Category',
              labelText:'Category' ,
              readOnly: !_isEditing,
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            TTextFormField(
              controller: _budgetController,
              hintText: 'budget',
              labelText:'budget' ,
              readOnly: !_isEditing,
              suffix: const Icon(FontAwesomeIcons.dollarSign),
              keyBoardType: TextInputType.number,
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            TTextFormField(
              controller: _spentController,
              hintText: 'spent',
              labelText: 'spent',
              keyBoardType: TextInputType.number,
              suffix: const Icon(FontAwesomeIcons.dollarSign),
              readOnly: !_isEditing,
            ),
            
            SizedBox(height: context.height*0.03,),
            
            Consumer<BudgetController>(
              builder: (context, provider, child){
                return GestureDetector(
                  onTap: (){
                    provider.deleteCategory(widget.id).then((value){
                      Navigator.pushReplacementNamed(context, RoutesName.main);
                    });
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.delete,color: Colors.red,),
                      SizedBox(width: 10,),
                      Text('Delete Category',style: TextStyle(color:AppColor.redColor),)
                    ],
                  ),
                );
              },

            )
          ],
        ),
      ),
    );
  }
}
