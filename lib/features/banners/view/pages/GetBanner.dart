import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shoe/features/banners/view/bloc/FetchBannerMainBloc.dart';
import 'package:shoe/features/banners/view/bloc/FetchBannerMainSatate.dart';

class GetBanners extends StatelessWidget {
  const GetBanners({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<FetchBannersMainBloc,FetchBannerMainState>(
        builder: (context,state)
        {
          if(state is FetchBannerLoadingState)
            {
              return SizedBox(
                height: height*0.22,
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h) ,
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
                        color: Colors.deepPurple,
                      ),
                    ),
                ),
                ),
                
              );

            }
          if(state is FetchBannersSuccessState)
            {

              return SizedBox(
                height: height*0.22,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h) ,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ListView.builder(
                      itemCount: state.banners.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                        return ClipRRect(
                          child: Image.network(state.banners[index].imageUrl),
                        );
                        }
                    ),
                  ),
                ),

              );

            }
          else{
            return SizedBox(
              height: height*0.22,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h) ,
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
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),

            );
          }

        }
    );
  }
}
