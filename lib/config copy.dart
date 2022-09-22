// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class Config {
  // ---------------------------------------------------
  //                     AWS
  // ---------------------------------------------------
  // static const DEBUG = bool.fromEnvironment('debug', defaultValue: false);
  // static const BASE_URL = String.fromEnvironment('BASE_URL', defaultValue: 'http://gondolacruzverde.deepview.digital');
  // static const API_URL = String.fromEnvironment('IMAGE_BASE_URL', defaultValue: 'http://gondolacruzverde.deepview.digital/api/v1');
  // static const LOG_FILE = String.fromEnvironment('log_file', defaultValue: 'logs_AWS.txt');
  // static const USE_FULL_URL = bool.fromEnvironment('use_full_url', defaultValue: true);


  // ---------------------------------------------------
  //                       DEVELOP
  // ---------------------------------------------------
  static const DEBUG = bool.fromEnvironment('debug', defaultValue: true);
  static const BASE_URL = String.fromEnvironment('BASE_URL', defaultValue: 'http://181.212.21.115');
  static const API_URL = String.fromEnvironment('IMAGE_BASE_URL', defaultValue: 'http://181.212.21.115/api/v1');
  static const LOG_FILE = String.fromEnvironment('log_file', defaultValue: 'logs_dev.txt');
  static const USE_FULL_URL = bool.fromEnvironment('use_full_url', defaultValue: true);

  // ---------------------------------------------------
  //                       CONFIG
  // ---------------------------------------------------
  static const APP_VERSION = '3.8.4';
  static const MOCK = bool.fromEnvironment('mock', defaultValue: false);
}
