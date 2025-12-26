import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shoe/core/utils/snackbar.dart';
import 'package:shoe/features/banners/view/bloc/FetchBannerMainBloc.dart';
import 'package:shoe/features/banners/view/bloc/FetchBannerMainSatate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/FetchBannerEvent.dart';

class GetBanners extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _GetBanners();
  }

}

class _GetBanners extends State<GetBanners> {
   _GetBanners();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchBannersMainBloc>().add(FetchBannerEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<FetchBannersMainBloc,FetchBannerMainState>(
      listener: (context,state){
        if(state is FetchBannersErrorState)
          {
            ShowSnacBar(context: context, discrip: state.errMSg, type: SnackBarType.Error);
          }
      },
        builder: (context,state)
        {
          if(state is FetchBannerLoadingState)
            {
              return SizedBox(
                height: double.infinity,
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
                        color: Colors.grey.shade200,
                      ),
                    ),
                ),
                ),
                
              );

            }
          if(state is FetchBannersSuccessState)
            {

              return SizedBox(

                width: double.infinity,
                child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: PageView.builder(
                      itemCount: state.banners.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                        return
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: AnotherCarousel(images: state.banners.map((i)=>CachedNetworkImage(
                              imageUrl: i.imageUrl,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Shimmer(
                                duration: Duration(seconds: 3), //Default value
                                interval: Duration(seconds: 5), //Default value: Duration(seconds: 0)
                                color: Colors.white, //Default value
                                colorOpacity: 0, //Default value
                                enabled: true, //Default value
                                direction: ShimmerDirection.fromLTRB(),  //Default Value
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            )).toList(),
                              dotSize: 0,
                              autoplay: true,
                              dotColor: Colors.transparent,
                              dotBgColor: Colors.transparent,)
                          );

                        }
                    ),
                  ),


              );

            }
          else{
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h) ,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Shimmer(
                    duration: Duration(seconds: 3), //Default value
                    interval: Duration(seconds: 5), //Default value: Duration(seconds: 0)
                    color:  Colors.white, //Default value
                    colorOpacity: 0, //Default value
                    enabled: true, //Default value
                    direction: ShimmerDirection.fromLTRB(),  //Default Value
                    child: Container(
                      color: Colors.grey.shade400,
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
