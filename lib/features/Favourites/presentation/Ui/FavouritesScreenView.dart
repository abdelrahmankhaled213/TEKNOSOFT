import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FavouritesScreenView extends StatelessWidget {
  final Stream<QuerySnapshot>userstream=
  FirebaseFirestore.instance.
  collection('favourites').where("uid",isEqualTo:FirebaseAuth.instance.currentUser!.uid )
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: userstream,
        builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
          return  SafeArea(
              child:
              BlocBuilder<FavCubit,FavState>(
                  builder: (context, state) {
                    if(snapshot.data?.docs==null){
                      return const Center(child: CircularProgressIndicator(
                        backgroundColor: AppColor.customred,
                      )
                      );
                    }
                    return
                     snapshot.data!.docs.length==0?
                     Center(child: Text(
                          "No Favourites Added".tr(
                          ),style: Styles.LibreCaskonpink40bold)):
                     SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.sp
                          ),
                          child: ListView
                              .builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                            return Align(
                              alignment: Alignment.center,
                              child: CustomFavouriteContainer(
                                data: snapshot.data!.docs[index],
                              ),
                            );
                          },
                          ),
                        ),
                      );

                  })
          );
        },

      ),
    );

  }
}

class CustomFavouriteContainer extends StatelessWidget {
  QueryDocumentSnapshot<Object?>  data;
  CustomFavouriteContainer({
   required this.data,
});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     height: 200.h,
     margin: EdgeInsets.symmetric(vertical: 7.h),
     padding: EdgeInsets.symmetric(vertical: 10.sp),
     width:double.infinity ,
     decoration: BoxDecoration(
       borderRadius:  BorderRadius.circular(25.r),
       color: AppColor.offWhite
     ),
     child: CustomRowFavourite(
       data: data,
     ),
   );
  }
}
class CustomRowFavourite extends StatelessWidget{
   QueryDocumentSnapshot<Object?>data;
  CustomRowFavourite({
    required this.data,

});
  @override
  Widget build(BuildContext context) {
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       Column(
         children: [
   CachedNetworkImage(
     imageUrl: data[
       'image'
     ],
     placeholder: (context, url) {
       return Image.asset("assets/Images/Animation - 1711669824617.gif");
     },
     errorWidget: (context, url, error) {
       return Image.asset("assets/Images/Animation - 1715076571938.gif",fit: BoxFit.contain,);
     },
     height: 120.h,
     fit: BoxFit.cover,
   ),
           SizedBox(
             width: 5.w,
           ),
           Text(data['name'],style: Styles.Montserratgrey16w300.copyWith(
               color: AppColor.customred
           ),),
         ],
       ),

      GestureDetector (onTap:()async{
        await BlocProvider.of<FavCubit>(context).removeFavourites(data.id);
    }  ,child: Icon(Icons.remove_circle,color: AppColor.customred,size: 30.sp,))
   ]);
  }
}
