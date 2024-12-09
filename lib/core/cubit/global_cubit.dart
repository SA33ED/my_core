import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/logs.dart';
import '../databases/cache/cache_helper.dart';
import '../services/service_locator.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  // final SignInRepo signInRepo;
  static GlobalCubit get(context) => BlocProvider.of(context);

  //! Language
  String language = sl<CacheHelper>().getCachedLanguage();
  changeLanguage() {
    printRed("Change Lang");
    sl<CacheHelper>().getCachedLanguage() == "en"
        ? sl<CacheHelper>().cacheLanguage("ar")
        : sl<CacheHelper>().cacheLanguage("en");
    language = sl<CacheHelper>().getCachedLanguage();
    emit(GlobalInitial());
  }

  //! Theme
  String appTheme = sl<CacheHelper>().getCachedTheme();
  changeTheme(String theme) {
    appTheme = theme;
    sl<CacheHelper>().cacheTheme(theme);
    emit(GlobalInitial());
  }

  // // //! Get User Profile
  // UserModel? user;
  // getUserProfile() async {
  //   emit(GlobalLoading());
  //   if (sl<CacheHelper>().getData(key: AppConstants.token) != null) {
  //     final response = await signInRepo.getUserProfile();
  //     response.fold(
  //       (fail) {
  //         emit(FaildToGetProfile());
  //       },
  //       (model) {
  //         sl<CacheHelper>().saveData(
  //           key: "userModel",
  //           value: jsonEncode(
  //             model.toJson(),
  //           ),
  //         );
  //         user = sl<CacheHelper>().getData(key: "userModel") != null
  //             ? UserModel.fromJson(
  //                 jsonDecode(
  //                   sl<CacheHelper>().getData(key: "userModel"),
  //                 ),
  //               )
  //             : null;
  //         emit(GlobalInitial());
  //       },
  //     );
  //   }
  // }
}
