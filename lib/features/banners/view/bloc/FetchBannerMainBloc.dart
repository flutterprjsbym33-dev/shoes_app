import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/features/banners/view/bloc/FetchBannerEvent.dart';
import 'package:shoe/features/banners/view/bloc/FetchBannerMainSatate.dart';
import 'package:dart_either/dart_either.dart';
import '../../domain/usecases/getbanner.dart';

class FetchBannersMainBloc extends Bloc<FetchBannerMainEvent,FetchBannerMainState> {
  GetBanner getBanner;

  FetchBannersMainBloc({required this.getBanner}) :super(FetchBannerInitialState()) {

  }


  Future<void> fetchBanners(FetchBannerEvent event,Emitter<FetchBannerMainState> emit)async
  {
    emit(FetchBannerLoadingState());
    final result = await getBanner.call();
    result.fold(
        ifLeft: (failure)=>emit(FetchBannersErrorState(errMSg: failure.message)),
        ifRight: (sucess)=>emit(FetchBannersSuccessState(banners: sucess)));

  }

}