import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/widgets/custombutton.dart';
import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';
import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';
import 'package:ecommerce_app/features/Favourites/Data/model/Favmodel.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_state.dart';
import 'package:ecommerce_app/features/DetailsHomeScreen/Presentation/widgets/DetailsWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker_service/internet_connection_checker_service.dart';
class DetailsHomeScreen extends StatefulWidget {
  Product? data  ;
  DetailsHomeScreen({
    this.data,
  });
  @override
  State<DetailsHomeScreen> createState() => _DetailsHomeScreenState();
}
class _DetailsHomeScreenState extends State<DetailsHomeScreen> {
  InternetConnectionCheckerService connectionCheckerService=InternetConnectionCheckerService();
  var id='';
  var cartid="";
  var favlist=<FavModel>[];
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body:
          FutureBuilder(
builder: (context, snapshot) {
  if(snapshot.connectionState==ConnectionState.waiting){
    return const Center(child: CircularProgressIndicator(
      backgroundColor: AppColor.customPurple,
    )
    );
  }
  return  SafeArea(
    child: Padding(
      padding: EdgeInsets.all(
          10.sp
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child:
              Stack(
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius:BorderRadius.circular(20.r),
                        child: CachedNetworkImage(
                          imageUrl: widget.data!.image,
                          placeholder: (context, url) {
                            return Image.asset("assets/Images/Animation - 1711669824617.gif");
                          },
                          errorWidget: (context, url, error) {
                            return Image.asset("assets/Images/Animation - 1715076571938.gif",fit: BoxFit.contain,);
                          },
                          height: 300.h,
                          fit: BoxFit.cover,

                        )
                    ),
                  ),
                  BlocBuilder<FavCubit,FavState>(
                 builder: (context, state) =>  Positioned(
                      child: GestureDetector(
                        onTap: () async{
                          if(BlocProvider.of<FavCubit>(context).favstate==false){
                            if(favlist.any((element) => element.name==widget.data!.name)){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added before")));
                              return;
                            }
                            id=await BlocProvider.of<FavCubit>(context).addFavourites(
                                FavModel(Uid:FirebaseAuth.instance.currentUser!.uid
                                    , name: widget.data!.name
                                    , image: widget.data!.image
                                    ,  price: widget.data!.price,
                                    size: widget.data!.size)
                            );
                          }
                          else if(BlocProvider.of<FavCubit>(context).favstate==true)
                            await BlocProvider.of<FavCubit>(context).removeFavourites(id);

                        },
                        child:
                        Icon(
                          BlocProvider.of<FavCubit>(context).favstate   ==
                              false
                              ?
                          Icons.favorite_border:Icons.favorite,
                          size: 30.h,
                          color: Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:Colors.black,
                        ),
                      )
                      ,right: 5.w,
                      top: 5.h,),
                  )
                ],
              )
          ),
          SliverToBoxAdapter(
            child: DetailsWidget(
              data: widget.data!,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130.h,
            ),
          ),
          SliverToBoxAdapter(
            child: BlocConsumer<FavCubit, FavState>(
              listener: (context, state) {
                if(state is CartInsertSuccess){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added To Cart")));
                }
                if(state is CartInsertFailed){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errormsg)));
                }
              },
              builder: (context, state) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 30.sp
                ),
                child: CustomButtonCore(
                    color:BlocProvider.of<FavCubit>(context).cartstate==false?
                    AppColor.main:AppColor.customblue ,
                    text:BlocProvider.of<FavCubit>(context).cartstate==false?
                    "Addtocart".tr():"Removefromcart".tr(),
                    touch: () async {

                      if (BlocProvider
                          .of<FavCubit>(context)
                          .cartstate == false)
                        cartid = await BlocProvider.of<FavCubit>(context).insertDataCart(
                            Cart(
                              image: widget.data!.image,
                              name: widget.data!.name,
                              price: widget.data!.price * BlocProvider
                                  .of<FavCubit>(context)
                                  .counter,
                              size: widget.data!.size[BlocProvider
                                  .of<FavCubit>(context)
                                  .selectedindex],
                              Quantitiy: BlocProvider
                                  .of<FavCubit>(context)
                                  .counter,
                            ));
                      else {
                        await BlocProvider.of<FavCubit>(context).deleteDataCart(
                            cartid);
                      }
                    }
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
},
            future: BlocProvider.of<FavCubit>(context).getFavData(),)
      );
  }
  }