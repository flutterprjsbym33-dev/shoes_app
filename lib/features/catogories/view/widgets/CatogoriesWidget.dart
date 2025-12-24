import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shoe/core/utils/appColor.dart';
import 'package:shoe/core/utils/catmodel.dart';
import 'package:shoe/core/utils/snackbar.dart';
import 'package:shoe/features/catogories/view/bloc/Catotitle_check_cubit.dart';
import 'package:shoe/features/catogories/view/bloc/FetchCatogoriesCubit.dart';
import 'package:shoe/features/catogories/view/bloc/GetCategoriesState.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../products/view/shoe_cubit/shoe_cubit.dart';

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
    context.read<FetchCatogoriesCubit>().getAllCato();

  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return  BlocConsumer<FetchCatogoriesCubit,
                      FetchCategoriesMainState>(
                    builder: (context, state) {
                      if (state is FetchCategoriesLoadingState) {
                        return ListView.separated(
                            separatorBuilder: (_, __) => const SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: constraints.maxHeight,
                                width: constraints.maxWidth * 0.2,
                                child: Shimmer(
                                  duration: Duration(seconds: 3),
                                  interval: Duration(seconds: 5),
                                  color: Colors.white,
                                  colorOpacity: 0,
                                  enabled: true,
                                  direction: ShimmerDirection.fromLTRB(),
                                  child: Container(
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            });
                      }

                      if (state is FetchCategoriesSuccessState) {
                        return ListView.builder(
                          itemCount: state.catoList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            bool isSelected = index == context.watch<IsCatSelected>().state;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<IsCatSelected>().onSelected(index);
                                  context.read<FetchShoeCubit>().getShoesFormBrand(cato[index].title.toLowerCase());
                                },
                                child: Container(
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth * 0.2,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        color: index ==
                                            context
                                                .watch<IsCatSelected>()
                                                .state
                                            ? AppColors.blue
                                            : Colors.grey.shade200,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl:
                                              state.catoList[index].cat_image,
                                              height:isSelected ? constraints.maxHeight * 0.7 : constraints.maxHeight * 0.85 ,
                                              color:isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                              placeholder: (context, url) => Shimmer(
                                                duration: Duration(seconds: 3),
                                                interval: Duration(seconds: 5),
                                                color: Colors.white,
                                                colorOpacity: 0,
                                                enabled: true,
                                                direction:
                                                ShimmerDirection.fromLTRB(),
                                                child: Container(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                  Icon(Icons.error),
                                            ),
                                           isSelected
                                                ? Container(

                                              width: constraints.maxWidth,
                                              height:
                                              constraints.maxHeight * 0.25,
                                              child: FittedBox(
                                                child: Text(
                                                  state.catoList[index]
                                                      .cat_title,
                                                  style: TextStyle(
                                                      color: isSelected
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            )
                                                : SizedBox()
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return ListView.separated(
                            separatorBuilder: (_, __) => const SizedBox(width: 10),
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: constraints.maxHeight,
                                width: constraints.maxWidth * 0.2,
                                child: Shimmer(
                                  duration: Duration(seconds: 3),
                                  interval: Duration(seconds: 5),
                                  color: Colors.white,
                                  colorOpacity: 0,
                                  enabled: true,
                                  direction: ShimmerDirection.fromLTRB(),
                                  child: Container(
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            });
                      }
                    },
                    listener: (context, state) {
                      if (state is FetchCategoriesErrorState) {
                        ShowSnacBar(
                            context: context,
                            discrip: state.errMsg,
                            type: SnackBarType.Error);
                      }
                    },
                  );
                },
              
            
          
      
    );
  }
}
