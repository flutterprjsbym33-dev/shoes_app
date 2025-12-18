import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shoe/core/utils/appColor.dart';
import 'package:shoe/core/utils/snackbar.dart';
import 'package:shoe/features/catogories/view/bloc/FetchCatogoriesCubit.dart';
import 'package:shoe/features/catogories/view/bloc/GetCategoriesState.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CatogoriesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatogoriesWidget();
  }
}


class _CatogoriesWidget extends State<CatogoriesWidget> {



   _CatogoriesWidget();


   @override
  void initState() {

    super.initState();
    context.read<FetchCatogoriesCubit>().getCategoriesUseCae;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 22.sp),),
        SizedBox(height: 5.h,),
        Expanded(
          child: BlocConsumer<FetchCatogoriesCubit,FetchCategoriesMainState>(
              builder: (context,state)
              {
                if(state is FetchCategoriesLoadingState)
                  {
                    return ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context,index) {
                        return Shimmer(
                          duration: Duration(seconds: 3), //Default value
                          interval: Duration(seconds: 5), //Default value: Duration(seconds: 0)
                          color: Colors.white, //Default value
                          colorOpacity: 0, //Default value
                          enabled: true, //Default value
                          direction: ShimmerDirection.fromLTRB(),  //Default Value
                          child: Container(
                            color: Colors.grey,
                          ),
                        );
                      }
                    );


                  }if(state is FetchCategoriesSuccessState)
                    {
                      return ListView.builder(
                        itemCount: state.catoList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: AnotherCarousel(
                                images: state.catoList.map((i)=> CachedNetworkImage(
                                  imageUrl: i.cat_image,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => Shimmer(
                                    duration: Duration(seconds: 3), //Default value
                                    interval: Duration(seconds: 5), //Default value: Duration(seconds: 0)
                                    color: Colors.white, //Default value
                                    colorOpacity: 0, //Default value
                                    enabled: true, //Default value
                                    direction: ShimmerDirection.fromLTRB(),  //Default Value
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                )).toList()),
                            );

                          },
                      );



                    }else {
                return  ListView.builder(
                  scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context,index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            width: 120.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Shimmer(
                                duration: Duration(seconds: 3), //Default value
                                interval: Duration(seconds: 5), //Default value: Duration(seconds: 0)
                                color: Colors.white, //Default value
                                colorOpacity: 0, //Default value
                                enabled: true, //Default value
                                direction: ShimmerDirection.fromLTRB(),  //Default Value
                                child: Container(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  );

                      }
                },
              listener: (context,state)
              {
                if(state is FetchCategoriesErrorState)
                {
                  ShowSnacBar(context: context, discrip: state.errMsg, type: SnackBarType.Error);
                }

              },
          ),
        ),
      ],
    );
  }
}
