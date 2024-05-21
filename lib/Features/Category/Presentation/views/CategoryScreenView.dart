import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_dolist_app/Core/DataBaseHelper/databaseservices.dart';
import 'package:to_dolist_app/Core/Theme/styles.dart';
import 'package:to_dolist_app/Features/Category/Presentation/widgets/customtextform.dart';
import 'package:to_dolist_app/Features/HomeScreen/Data/model/getTasksData.dart';
import 'package:to_dolist_app/Features/HomeScreen/Presentation/model-view/categorymodel.dart';
import 'package:to_dolist_app/Features/HomeScreen/Presentation/widgets/CustomContainer.dart';
class CategoryScreenView extends StatefulWidget {
  final int i;
CategoryScreenView({required this.i});
  @override
  State<CategoryScreenView> createState() => _CategoryScreenViewState();
}
class _CategoryScreenViewState extends State<CategoryScreenView> {
var isDone=false.obs;
  var categ="";
   String popmenutext="Low";
  final tasktext = TextEditingController();
  final date = TextEditingController();
  final time=TextEditingController();
  late Rx<String> prioritytype;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tasktext.dispose();
    date.dispose();
    time.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 47.h,
        width: 40.w,
        child: FloatingActionButton(
       elevation: 10.sp,
          hoverColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r)
          ),
          onPressed: () {
            showDialogBox(context,()
           async {
             if(tasktext.text.isEmpty||date.text.isEmpty||time.text.isEmpty||prioritytype.value=="Select Priority"){
               ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                 content: Text("Please fill all fields"),
               ));
               return;
             }
             final id =  await DataBaseHelper.insertData(
                 Task(priority:prioritytype.value ,id: 0,title: tasktext.text, category: categ, date: date.text));
             Navigator.pop(context);
             setState(() {

             });
           });
          },
          child:  Icon(Icons.add,size: 10.0.sp, color: Colors.white,),

          backgroundColor: Colors.black12,
        ),
      ),
      body: FutureBuilder<List<Task>>(
        future: DataBaseHelper.getDataDependsOnCategoryandPriority(
            category: getDataDependingOnIndex(),priority: popmenutext),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:

                   PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: const Text("Low"),
                            onTap: (){
                           setState(() {
                             popmenutext="Low";
                           });

                            },
                          ),
                          PopupMenuItem(
                            child: const Text("Medium"),
                            onTap: (){
                  setState(() {
                    popmenutext="Medium";
                  });

                            },
                          ),
                          PopupMenuItem(
                            child: const Text("High"),
                            onTap: (){
                  setState(() {
                    popmenutext="High";
                  });
                          }
                          )];
                      }
                                   ,icon: const Align(alignment: Alignment.topLeft,child:  Icon(Icons.more_vert)),),

              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50.h,),
              ),
           snapshot.data!.length==0?SliverToBoxAdapter(child: Center(child:
           Column(
             children: [
               Text("No Task Added",style: Styles.LibreCaslonw600,),
             ],
           ))):   SliverToBoxAdapter(
                 child:
                      ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.h,);
                      },
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                                         return
                            GestureDetector(
                             onLongPress: () async{
                               await showDialogBox2(context,snapshot,index);
                             },
                             child: CustomContainer(
                               color: CustomCategory.customcateglist[widget.i].color1,
                               color2: CustomCategory.customcateglist[widget.i].color2,
                               width: double.infinity,
                               height: 100.h,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text("Task content: "+snapshot.data![index].title!,
                                       style: Styles.LibreCaslonw600.copyWith(fontSize: 12.sp,
                                           color: Colors.white),),
                                     Text("Task Date: "+snapshot.data![index].date!,style: Styles.LibreCaslonw600.copyWith(fontSize: 12.sp,color: Colors.white),),
                                   ],
                                 ),
                                   Text("Task Category: "+snapshot.data![index].category!,  style: Styles.LibreCaslonw600.copyWith(fontSize: 12.sp,
                                       color: Colors.white) ,)
                               ]
                               )
                             )
                            );
                      },
                                        ),
                    ),
              ]
              ),
            )
            );
          }
          else{
            return const Center(child: CircularProgressIndicator(
              backgroundColor: Colors.blueGrey,
              color: Colors.white,
            ),
            );
          }
        },
      )
    );
  }
    String getDataDependingOnIndex(){
    if(widget.i == 0){
      categ="Personal";
    }else if(widget.i == 1){
      categ="Learning";
    }
    else if(widget.i == 2){
      categ="Work";
    }
    else
    {
      categ="Shopping";
    }
    return categ;
  }
  Future showDialogBox(BuildContext context,void Function() onpressed) {
    return showDialog(context: context, builder: (context)
    {
      var priority=<String>[
        "Low",
        "Medium",
        "High"
      ];
       prioritytype="Select Priority".obs;
      return AlertDialog(
          title: const Text("Add Task"),
titleTextStyle: Styles.LibreCaslonw600,
          content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(hint: "Enter Task", controller: tasktext,
                ),
                CustomTextFormField(node: AlwaysDisabledFocusNode(),controller: date,hint: "Enter Date",
                    iconButton: IconButton(onPressed: (){
                  showDatePicker(
                    context: context,
                      firstDate: DateTime(DateTime.now().year),
                      lastDate: DateTime(DateTime.now().year+1),
                      initialDate: DateTime.now()).then((value) {
                    date.text = DateFormat('yMMMd').format(value!).toString();
                  });
                },
                      icon: const Icon(Icons.calendar_today),color: Colors.blueGrey,)),
CustomTextFormField(
  node: AlwaysDisabledFocusNode(),
    iconButton: IconButton(
  onPressed: ()async{
    await showTimePicker(builder: (context, child) {
     return customThemeTimePicker(child);
    },
        barrierColor: Colors.black12,context: context, initialTime: TimeOfDay.now()).then((value) {
      time.text = value!.format(context).toString();
    });
  },
  icon: const Icon(Icons.alarm),
),hint: "Enter Time", controller: time),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: Obx(() =>
                    DropdownButton(
                         items: priority.map((e) =>
                             DropdownMenuItem(value: e,child: Text(e))).toList(), onChanged: (String? value) {

                          prioritytype.value = value!;
print(prioritytype.value);
                        },
                        hint: Text(prioritytype.value,style: Styles.LibreCaslonw600.copyWith(
                            color: Colors.blueGrey,fontSize: 10.sp),),
                        ),
                    ),
                  ),
              ]
          ),
          actions: [
            TextButton(
              onPressed: onpressed,
                child: Text("Submit",style: Styles.LibreCaslonw600.copyWith
                  (color: Colors.black,fontSize:10.sp ),)),
          ]);
    });
  }
  Future showDialogBox2(BuildContext context,AsyncSnapshot<List<Task>>snapshot,int index) {
    return showDialog(context: context, builder: (context)
    {
      return AlertDialog(
          title:  Center(child: Text("Task",style: Styles.LibreCaslonw600,)),
          actions: [
            TextButton(
              onPressed: ()async{
              await DataBaseHelper.deleteData(" "
                  "delete from Task where id = ${snapshot.data![index].id}");
setState(() {

});
              Navigator.pop(context);
      },
              child: Text("Delete",style: Styles.LibreCaslonw600.copyWith(
              fontSize: 12.sp,
              color: Colors.blueGrey,
            )
            ),
            ),

            TextButton(
              onPressed: ()async{
                await showDialogBox(context,() async{
                  if(tasktext.text.isEmpty||
                      date.text.isEmpty||
                      time.text.isEmpty
                      ||
                      prioritytype.value=="Select Priority"){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please Fill All Details"),
                    ));
                    return;
                  }
                 await DataBaseHelper.updateData(
                   priority: prioritytype.value,
                   id: snapshot.data![index].id,
                   date: time.text,
                   title: tasktext.text
                 );
                 setState(() {

                 });
               },);
                Navigator.pop(context);
              },
              child: Text("Update",style: Styles.LibreCaslonw600.copyWith(
                fontSize: 12.sp,
                color: Colors.blueGrey,
              )
              ),
            ),
          ],
      );
    }
    );
}
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

Theme customThemeTimePicker(Widget? child){
  return Theme(
      child: child!,
      data: ThemeData(
      ).copyWith(
          colorScheme: ColorScheme.dark(
              primary: Colors.white
          )
      )
  );
}