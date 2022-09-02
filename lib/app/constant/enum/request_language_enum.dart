import 'package:getx_architecture/app/constant/resources/app_images.dart';
import 'package:getx_architecture/app/data_models/view_object/setup_vo.dart';

class LanguageEnums<String> {
  final String languageType;
  final String languageCode;

  const LanguageEnums(this.languageType, this.languageCode);

  static const LanguageEnums ENGLISH = LanguageEnums('English', "en");
  static const LanguageEnums MYANMAR = LanguageEnums("Myanmar", "my");
  static const LanguageEnums CHINESE = LanguageEnums("Chinese", "ch");
}

extension LanguageNameExtension on LanguageEnums {
  SetUpVo get languageData {
    switch (this) {
      case LanguageEnums.ENGLISH:
        return SetUpVo(name: "English", image: AppImages.icEnglishFlag);
      case LanguageEnums.MYANMAR:
        return SetUpVo(name: "Myanmar", image: AppImages.icMyanmarFlag);
      case LanguageEnums.CHINESE:
        return SetUpVo(name: "Chinese", image: AppImages.icChineseFlag);
      default:
        return SetUpVo(name: "English", image: AppImages.icEnglishFlag);
    }
  }
}
