import 'package:shoe/features/banners/domain/entity/BannerEntity.dart';

abstract class FetchBannerMainState{}
class FetchBannerInitialState extends FetchBannerMainState{}
class FetchBannerLoadingState extends FetchBannerMainState{}
class FetchBannersSuccessState extends FetchBannerMainState
{
  List<BannerEntity> banners;
  FetchBannersSuccessState({required this.banners});
}
class FetchBannersErrorState extends FetchBannerMainState
{
   String errMSg;
   FetchBannersErrorState({required this.errMSg});
}
