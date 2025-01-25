import 'dart:developer';
import 'dart:io';

String basePath = Directory.current.path;

String appColorsContent = '''
static const Color primaryColor = Color(0xFF0A0E21);
''';

String appAssetsContent = '''
static const String logo = "assets/images/logo.png";
''';

String themeContent = '''
  ThemeData lightTheme = ThemeData();

  ThemeData darkTheme = ThemeData();
''';

String apiConstantsContent = '''
static const String baseUrl = "https://api.example.com";   
''';

String endpointsContent = '''
static const String login = "login";   
''';

String appRouterContent = '''
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Scaffold());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
''';

String apiResultsContent = '''
import '../errors/global_error_handler.dart';
sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success({required T data}) {
    return SuccessRequest(data: data);
  }

  factory ApiResult.failure({required GlobalErrorHandler exception}) {
    return FailureRequest(exception: exception);
  }
}

class SuccessRequest<T> extends ApiResult<T> {
  final T data;

  const SuccessRequest({required this.data});
}

class FailureRequest extends ApiResult<Never> {
  final GlobalErrorHandler exception;

  const FailureRequest({required this.exception});
}
''';

String routesNameContent = '''
  static const String login = '/login';
  static const String splash = '/';
  static const String layout = '/layout';
''';

String contextExtensionContent = '''
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // theme
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  // routes
  void goBack({Object? arguments}) => Navigator.of(this).pop(arguments);

  Future<void> goToNamed(String route, {Object? arguments}) async =>
      await Navigator.of(this).pushNamed(
        route,
        arguments: arguments,
      );

  Future<void> goBackUntil(String backRouteName) async => Navigator.of(
        this,
      ).popUntil(
        (route) => route.settings.name == backRouteName,
      );

  void goBackUntilAndPush({
    Object? arguments,
    required String newRouteName,
    required String backRouteName,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        newRouteName,
        (route) => route.settings.name == backRouteName,
        arguments: arguments,
      );

  void removeAllAndPush(
    String pushRoute, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        pushRoute,
        (route) => false,
        arguments: arguments,
      );
}
''';

String stringExtensionContent = '''
extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "\${this[0].toUpperCase()}\${substring(1).toLowerCase()}";
  }

  String capitalizeEachWord() {
    return split(" ").map((e) => e.capitalizeFirstLetter()).toString();
  }
}
''';

String paddingExtensionContent = '''
import 'package:flutter/material.dart';

extension PaddingToWidget on Widget {
  Widget setHorizontalPadding({double padding = 16}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget setVerticalPadding({double padding = 16}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }
}
''';

String numberExtensionContent = '''
import 'package:flutter/material.dart';

extension NumberExtension on double {
  Widget get spaceVertical => SizedBox(height: toDouble());
  Widget get spaceHorizontal => SizedBox(width: toDouble());
}

extension NumberExtensionWithInt on int {
  Widget get spaceVertical => SizedBox(height: toDouble());
  Widget get spaceHorizontal => SizedBox(width: toDouble());
}
''';

String diClassContent = '''
import 'di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
''';

String blocObserverContent = '''
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- \${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange -- \${bloc.runtimeType}, \$change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- \${bloc.runtimeType}, \$error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- \${bloc.runtimeType}');
  }
}
''';

String regexServiceContent = '''
  static bool checkValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\\.[a-zA-Z]+",
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(email);
  }
''';

String globalErrorHandlerContent = '''
import 'package:dio/dio.dart';

class GlobalErrorHandler {
  int? statusCode;
  String? message;

  GlobalErrorHandler.fromDioException(DioException dioError) {
    statusCode = dioError.response?.statusCode;

    if (dioError.response?.data != null) {
      if (dioError.response?.data is Map<String, dynamic> &&
          dioError.response?.data['message'] != null) {
        message = dioError.response?.data['message'];
      } else {
        message = "An unexpected error occurred.";
      }
    } else {
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          message = "Connection timeout. Please try again.";
          break;
        case DioExceptionType.sendTimeout:
          message = "Request timeout. Please try again.";
          break;
        case DioExceptionType.receiveTimeout:
          message = "Response timeout. Please try again.";
          break;
        case DioExceptionType.cancel:
          message = "Request cancelled by the user.";
          break;
        case DioExceptionType.unknown:
          message = "An unexpected error occurred: \${dioError.message}";
          break;
        default:
          message = "An unexpected error occurred.";
      }
    }
  }

  GlobalErrorHandler.fromException(Exception exception) {
    statusCode = 500;
    message = exception.toString();
  }

  @override
  String toString() {
    return 'GlobalErrorHandler{statusCode: \$statusCode, message: \$message}';
  }
}

''';

Map<String, List<String>> folderStructure = {
  'lib': [
    'core',
    'features',
  ],
  'assets': [
    'images',
    'fonts',
    'icons',
    "translations",
  ],
  'lib/core': [
    "models",
    "services",
    "utils",
    "extensions",
    "errors",
    "cubit",
    "widgets",
    "theme",
    "constants",
    "routing",
    "di",
    "api",
    
  ],
};

Map<String, Map<String, String>> files = {
  "lib/core/theme": {
    "app_colors.dart": createClassStaticWithNoConstructor(
      'AppColors',
      content: appColorsContent,
    ),
    "app_assets.dart": createClassStaticWithNoConstructor(
      'AppAssets',
      content: appAssetsContent,
      addMaterialImport: false,
    ),
    "app_theme.dart": createClassStaticWithNoConstructor(
      'AppTheme',
      content: themeContent,
    ),
    "app_font_styles.dart": createClassStaticWithNoConstructor(
      'AppFontStyles',
    ),
  },
  "lib/core/constants": {
    "app_constants.dart": createClassStaticWithNoConstructor(
      'AppConstants',
      addMaterialImport: false,
    ),
    "translation_keys.dart": createClassStaticWithNoConstructor(
      'TranslationKeys',
      addMaterialImport: false,
    ),
  },
  "lib/core/api": {
    "api_constants.dart": createClassStaticWithNoConstructor(
      'ApiConstants',
      content: apiConstantsContent,
      addMaterialImport: false,
    ),
    "endpoints.dart": createClassStaticWithNoConstructor(
      'Endpoints',
      content: endpointsContent,
      addMaterialImport: false,
    ),
    "api_result.dart": apiResultsContent,
  },
  "lib/core/routing": {
    "app_router.dart": createClassStaticWithNoConstructor(
      'AppRouter',
      content: appRouterContent,
    ),
    "routes.dart": createClassStaticWithNoConstructor(
      'Routes',
      addMaterialImport: false,
      content: routesNameContent,
    ),
  },
  "lib/core/extensions": {
    "context_extension.dart": contextExtensionContent,
    "string_extension.dart": stringExtensionContent,
    "padding_extension.dart": paddingExtensionContent,
    "number_extension.dart": numberExtensionContent,
  },
  "lib/core/di": {
    "di.dart": diClassContent,
  },
  "lib/core/services": {
    "regex_service.dart": createClassStaticWithNoConstructor(
      "RegexService",
      content: regexServiceContent,
      addMaterialImport: false,
    ),
  },
  "assets/translations": {
    "ar.json": "{}",
    "en.json": "{}",
  },
  "lib/core/cubit": {"app_bloc_observer.dart": blocObserverContent},
  "lib/core/errors": {  
    "global_error_handler.dart": globalErrorHandlerContent
  }
};

List<String> packages = [
  "flutter_bloc",
  "easy_localization",
  "dio",
  "bot_toast",
  "flutter_svg",
  "fluttertoast",
  "pretty_dio_logger",
  "lottie",
  "shared_preferences",
  "injectable",
  "get_it",
  "page_transition",
  "animate_do",
  "skeletonizer",
  "cached_network_image",
  "toastification",
  "intl",
  "flutter_secure_storage",
];

List<String> devDependencies = [
  'build_runner',
  'injectable_generator',
  'flutter_gen_runner',
  'flutter_launcher_icons'
];

void createFolder(String path) {
  final directory = Directory(path);

  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  } else {}
}

void createFile(String path, String content) {
  final file = File(path);

  if (!file.existsSync()) {
    file.writeAsStringSync(content);
    log('Created file: $path');
  } else {
    log('File already exists: $path');
  }
}

String createClassStaticWithNoConstructor(
  String className, {
  String content = '',
  addMaterialImport = true,
}) {
  String import =
      addMaterialImport ? "import 'package:flutter/material.dart';" : '';
  return '''
$import
abstract class $className {
  $content
}
''';
}

void updatePubspec(
  String basePath,
  List<String> dependencies,
  List<String> devDependencies,
) {
  String pubspecPath = '$basePath/pubspec.yaml';
  final pubspecFile = File(pubspecPath);

  if (pubspecFile.existsSync()) {
    String pubspecContent = pubspecFile.readAsStringSync();

    // Check and add dependencies
    if (pubspecContent.contains('dependencies:')) {
      StringBuffer newDependencies = StringBuffer();
      for (String package in dependencies) {
        if (!pubspecContent.contains(package.split(':')[0])) {
          newDependencies.writeln('  $package:');
        }
      }
      pubspecContent = pubspecContent.replaceFirst(
        RegExp(r'dependencies:\n'),
        'dependencies:\n$newDependencies',
      );
    }

    // Check and add dev_dependencies
    if (pubspecContent.contains('dev_dependencies:')) {
      StringBuffer newDevDependencies = StringBuffer();
      for (String package in devDependencies) {
        if (!pubspecContent.contains(package.split(':')[0])) {
          newDevDependencies.writeln('  $package:');
        }
      }
      pubspecContent = pubspecContent.replaceFirst(
        RegExp(r'dev_dependencies:\n'),
        'dev_dependencies:\n$newDevDependencies',
      );
    } else {
      // Add dev_dependencies if not present
      StringBuffer newDevDependencies = StringBuffer();
      for (String package in devDependencies) {
        newDevDependencies.writeln('  $package');
      }
      pubspecContent += '\ndev_dependencies:\n$newDevDependencies';
    }

    // Add the assets to the flutter section
    if (pubspecContent.contains('uses-material-design: true')) {
      StringBuffer newAssets = StringBuffer();
      var assetsSubfolders = folderStructure["assets"];

      for (String subfolder in assetsSubfolders!) {
        newAssets.writeln('    - assets/$subfolder/');
      }

      pubspecContent = pubspecContent.replaceFirst(
        // RegExp(r'uses-material-design: true'),
        "uses-material-design: true",
        'uses-material-design: true\n  assets:\n$newAssets',
      );
    }

    // Write the updated content back to the pubspec.yaml file
    pubspecFile.writeAsStringSync(pubspecContent);
    log('pubspec.yaml updated with new dependencies and dev_dependencies.');
  } else {
    log('Error: pubspec.yaml not found.');
  }
}

Future<void> runPubGet() async {
  log('Running flutter pub get...');
  final result = await Process.run('flutter', ['pub', 'get']);
  if (result.exitCode == 0) {
    log('flutter pub get completed successfully.');
  } else {
    log('flutter pub get failed with error: ${result.stderr}');
  }
}

Future<void> runBuildRunner() async {
  log('Running dart run build_runner build...');
  final result = await Process.run('dart', ['run', 'build_runner', 'build']);
  if (result.exitCode == 0) {
    log('build_runner build completed successfully.');
  } else {
    log('build_runner build failed with error: ${result.stderr}');
  }
}

Future<void> main() async {
  folderStructure.forEach((parent, subfolders) {
    String parentPath = '$basePath/$parent';
    createFolder(parentPath);

    for (String subfolder in subfolders) {
      createFolder('$parentPath/$subfolder');
    }
  });

  files.forEach((parent, files) {
    String parentPath = '$basePath/$parent';
    files.forEach((subfolder, content) {
      String filePath = '$parentPath/$subfolder';
      createFile(filePath, content);
    });
  });

  updatePubspec(basePath, packages, devDependencies);

  await runPubGet();

  await runBuildRunner();
}
