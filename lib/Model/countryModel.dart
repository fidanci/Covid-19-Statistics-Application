class Country {

  String countryName;
  String countryCode;
  String slug;
  var newConfirmed;
  var totalConfirmed;
  var newDeaths;
  var totalDeaths;
  var newRecovered;
  var totalRecovered;
  var date;

  Country(String country, String countryCode,
      String slug,
      var newConfirmed, var totalConfirmed,
      var newDeaths, var totalDeaths,
      var newRecovered, var totalRecovered,
      var date){

    this.countryName = country;
    this.countryCode = countryCode;
    this.slug = slug;
    this.newConfirmed = newConfirmed;
    this.totalConfirmed = totalConfirmed;
    this.newDeaths = newDeaths;
    this.totalDeaths = totalDeaths;
    this.newRecovered = newRecovered;
    this.totalRecovered = totalRecovered;
    this.date = date;

  }

  Country.fromJson(Map json) {
    this.countryName = json['Country'];
    this.countryCode = json['CountryCode'];
    this.slug = json['Slug'];
    this.newConfirmed = json['NewConfirmed'];
    this.totalConfirmed = json['TotalConfirmed'];
    this.newDeaths = json['NewDeaths'];
    this.totalDeaths = json['TotalDeaths'];
    this.newRecovered = json['NewRecovered'];
    this.totalRecovered = json['TotalRecovered'];
    this.date = json['Date'];
  }

}