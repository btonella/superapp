import 'package:app_core/src/enums/enums.dart';

const Map<Flavor, Map<Environment, Map<ApiName, String>>> apiUrls = {
  Flavor.base: {
    Environment.dev: {
      ApiName.auth: '',
      ApiName.portal: '',
    },
    Environment.hml: {
      ApiName.auth: '',
      ApiName.portal: '',
    },
    Environment.prod: {
      ApiName.auth: '',
      ApiName.portal: '',
    },
  },
  Flavor.partner: {
    Environment.dev: {
      ApiName.auth: '',
      ApiName.portal: '',
    },
    Environment.hml: {
      ApiName.auth: '',
      ApiName.portal: '',
    },
    Environment.prod: {
      ApiName.auth: '',
      ApiName.portal: '',
    },
  },
};
