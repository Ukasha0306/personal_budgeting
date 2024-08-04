import 'package:flutter/material.dart';
import 'package:personal_budgeting/utils/color.dart';
import 'package:personal_budgeting/utils/extension.dart';
import 'package:personal_budgeting/utils/routes/route_name.dart';
import 'package:personal_budgeting/view_model/budget_controller.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BudgetController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Expanded(
              child: StreamBuilder(
                stream: provider.fetchCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.black,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('The Error ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text(
                      'Add Category',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ));
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesName.details,
                                  arguments: {
                                    'id': item.id,
                                    'budget': item.budget,
                                    'name': item.name,
                                    'spent':item.spent,
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:context.height*0.05,
                                      child: Text(
                                        item.name.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(

                                          color: AppColor.whiteColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: context.height * 0.03,
                                    ),
                                    Center(
                                      child: Text(
                                        '\$ ${item.budget.toString()}',
                                        style: const TextStyle(
                                            color: AppColor.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    SizedBox(
                                      height: context.height * 0.03,
                                    ),
                                    Text(
                                      'Net spent: \$ ${item.spent.toString()}',
                                      style: const TextStyle(
                                          color: AppColor.whiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.whiteColor,
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.addOrEdit);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
