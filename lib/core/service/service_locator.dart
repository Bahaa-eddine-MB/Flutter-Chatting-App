import 'package:chat_app/chat-app/data/datasource/chat_remote_data_source.dart';
import 'package:chat_app/chat-app/data/datasource/user_remote_datasource.dart';
import 'package:chat_app/chat-app/data/repository/chat_repository.dart';
import 'package:chat_app/chat-app/data/repository/user_repository.dart';
import 'package:chat_app/chat-app/domain/repository/base_chat_repository.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/chat-app/domain/usecases/chat_create_chat_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/chat_getmy_chats_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/chat_send_message.dart';
import 'package:chat_app/chat-app/domain/usecases/user_get_all.dart';
import 'package:chat_app/chat-app/domain/usecases/user_get_user_byId.dart';
import 'package:chat_app/chat-app/domain/usecases/user_isverified_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/user_login_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/user_logout_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/user_register_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/user_send_email_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/user_send_forgotpassword_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/user_update_password.dart';
import 'package:chat_app/chat-app/domain/usecases/user_update_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Getx
    // sl.registerFactory(() => RegisterController(sl()));

    /// Use Cases
    sl.registerLazySingleton(() => UserSendForgotPassword(sl()));
    sl.registerLazySingleton(() => UserLogin(sl()));
    sl.registerLazySingleton(() => UserUpdate(sl()));
    sl.registerLazySingleton(() => UserPasswordUpdate(sl()));
    sl.registerLazySingleton(() => UserSendEmail(sl()));
    sl.registerLazySingleton(() => UserVerified(sl()));
    sl.registerLazySingleton(() => UserRegister(sl()));
    sl.registerLazySingleton(() => UserLogOut(sl()));
    sl.registerLazySingleton(() => UserGetAll(sl()));
    sl.registerLazySingleton(() => GetUserByID(sl()));
    sl.registerLazySingleton(() => CreateChat(sl()));
    sl.registerLazySingleton(() => SendMessage(sl()));
    sl.registerLazySingleton(() => GetMyChats(sl()));

    /// Repository
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));
    sl.registerLazySingleton<BaseChatRepository>(() => ChatRepository(sl()));

    /// DATA SOURCE

    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    sl.registerLazySingleton<BaseChatRemoteDataSource>(
        () => RemoteChatDataSource());
  }
}
