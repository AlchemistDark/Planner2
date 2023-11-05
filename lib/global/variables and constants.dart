// Global variables are stored here.

import 'package:http/http.dart' as http;


/// Так как макет от дизайнера свёрстан не гибко,
/// некоторые вещи придётся пересчитывать используя ширину дизайнерского макета.
const int designerPageLayoutWidth = 375;

/// Токен доступа к бэкенду.
String? token;

/// Клиент для REST API. Он создаётся один на весь сеанс пользователя,
/// что бы не тратить время на его повторное создание.
final http.Client client = http.Client();
