/// First data model for [CelebrationsListScreen]
class UserCelebrationsList{

  final String userName;
  final String userRegion;
  final List<String> celebrationsList;

  UserCelebrationsList({
    required this.userName,
    required this.userRegion,
    required this.celebrationsList
  });

  // TODO добавить фром джосон
  // ToDO Здесь могут быть ошибки, если сервер возвращает null
  factory UserCelebrationsList.fromJson(Map<String, dynamic> json){
    return UserCelebrationsList(
      userName: json["username"] as String,
      userRegion: json["region"] as String,
      celebrationsList: (json["holidays"] as List<dynamic>)
          .map((dynamic e) {
        String result = e.toString();
        return result;
        // Celebrate celebrate = Celebrate.fromJson(e as Map<String, dynamic>);
        // if (celebrate.icon == "Null"){
        //   print("Пустое поле icon у праздника id ${celebrate.id}");
        // }
        // if (celebrate.day == 0)
        // {
        //   print("Поле day у праздника id ${celebrate.id} не содержит числа");
        // }
        // if (celebrate.month == 0){
        //   print("Поле day у праздника id ${celebrate.id} не содержит числа");
        // }
        // return celebrate;
      })
          .toList(),
      // peopleDates: (json["people_dates"] as List<dynamic>)
      //     .map((dynamic e) {
      //   if (e == null) {return ["null"];}
      //   List<String> result = [];
      //   for (var i in e){
      //     String str = i as String;
      //     result.add(str);
      //   }
      //   return result;
      // }).toList(),
      // peopleCount: (json["people_count"] as List<dynamic>)
      //     .map((dynamic e) => e as int)
      //     .toList(),
    );
  }
}

/// Second model for [CelebrationsListScreen]
class CelebrationsCategoriesList{

  final List<List<String>> categoriesList;

  CelebrationsCategoriesList({
    required this.categoriesList
  });

}