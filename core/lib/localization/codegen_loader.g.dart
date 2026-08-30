// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "appName": "FI",
  "mainPage": {
    "authorizationScreen": {
      "email": "Email",
      "password": "Password",
      "login": "Login",
      "error": "Error",
      "invalidCredentials": "Invalid email or password",
      "unknownError": "An error occurred. Please try again later."
    },
    "homeScreen": {
      "exercises": "Exercises",
      "trainings": "Trainings",
      "info": "Knowledge",
      "account": "Account",
      "language": "Language",
      "aboutApp": "About App",
      "logOut": "Log Out",
      "listLanguage": "App Language",
      "error": "Error",
      "somethingWentWrong": "Something went wrong",
      "retry": "Retry",
      "loadingError": "Loading error"
    }
  }
};
static const Map<String,dynamic> _es = {
  "appName": "FI",
  "mainPage": {
    "authorizationScreen": {
      "email": "Correo electrónico",
      "password": "Contraseña",
      "login": "Iniciar sesión",
      "error": "Error",
      "invalidCredentials": "Correo o contraseña incorrectos",
      "unknownError": "Ocurrió un error. Inténtelo más tarde."
    },
    "homeScreen": {
      "exercises": "Ejercicios",
      "trainings": "Entrenamientos",
      "info": "Conocimiento",
      "account": "Cuenta",
      "language": "Idioma",
      "aboutApp": "Acerca de la App",
      "logOut": "Cerrar sesión",
      "listLanguage": "Idioma de la App",
      "error": "Error",
      "somethingWentWrong": "Algo salió mal",
      "retry": "Reintentar",
      "loadingError": "Error de carga"
    }
  }
};
static const Map<String,dynamic> _ja = {
  "appName": "FI",
  "mainPage": {
    "authorizationScreen": {
      "email": "メールアドレス",
      "password": "パスワード",
      "login": "ログイン",
      "error": "エラー",
      "invalidCredentials": "メールアドレスまたはパスワードが無効です",
      "unknownError": "エラーが発生しました。後でもう一度お試しください。"
    },
    "homeScreen": {
      "exercises": "エクササイズ",
      "trainings": "トレーニング",
      "info": "知識",
      "account": "アカウント",
      "language": "言語",
      "aboutApp": "アプリについて",
      "logOut": "ログアウト",
      "listLanguage": "アプリの言語",
      "error": "エラー",
      "somethingWentWrong": "問題が発生しました",
      "retry": "再試行",
      "loadingError": "読み込みエラー"
    }
  }
};
static const Map<String,dynamic> _ru = {
  "appName": "FI",
  "mainPage": {
    "authorizationScreen": {
      "email": "Электронная почта",
      "password": "Пароль",
      "login": "Войти",
      "error": "Ошибка",
      "invalidCredentials": "Неверный email или пароль",
      "unknownError": "Произошла ошибка. Попробуйте позже."
    },
    "homeScreen": {
      "exercises": "Упражнения",
      "trainings": "Тренировки",
      "info": "Знания",
      "account": "Аккаунт",
      "language": "Язык",
      "aboutApp": "О приложении",
      "logOut": "Выйти",
      "listLanguage": "Язык приложения",
      "error": "Ошибка",
      "somethingWentWrong": "Что-то пошло не так",
      "retry": "Повторить",
      "loadingError": "Ошибка загрузки"
    }
  }
};
static const Map<String,dynamic> _zh = {
  "appName": "FI",
  "mainPage": {
    "authorizationScreen": {
      "email": "电子邮箱",
      "password": "密码",
      "login": "登录",
      "error": "错误",
      "invalidCredentials": "邮箱或密码错误",
      "unknownError": "发生错误，请稍后重试。"
    },
    "homeScreen": {
      "exercises": "练习",
      "trainings": "训练",
      "info": "知识",
      "account": "账户",
      "language": "语言",
      "aboutApp": "关于应用",
      "logOut": "退出登录",
      "listLanguage": "应用语言",
      "error": "错误",
      "somethingWentWrong": "出错了",
      "retry": "重试",
      "loadingError": "加载错误"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "es": _es, "ja": _ja, "ru": _ru, "zh": _zh};
}
