import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<ItemsRecord> paginatePurchases(
  List<ItemsRecord> data,
  int page,
  int pageSize,
) {
  int startIndex = (page - 1) * pageSize;
  int endIndex = startIndex + pageSize;

  // Check if endIndex exceeds the length of the data list
  if (endIndex > data.length) {
    endIndex = data.length;
  }

  // Return a sublist of the data list
  return data.sublist(startIndex, endIndex);
}

double calculateTotalAndTax(List<OrderStruct> orders) {
  return calculateTax(orders) + calculateTotal(orders);
}

double calculateTax(List<OrderStruct> orders) {
  double tax = 0.22;

  return tax * calculateTotal(orders);
}

double calculateTotal(List<OrderStruct> orders) {
  double total = 0;

  for (OrderStruct order in orders) {
    if (order.plan.onSale) {
      total += order.plan.discountPrice * order.quantity;
    } else {
      total += order.plan.price * order.quantity;
    }
  }

  return total;
}

List<ItemsRecord> filterItemsByPrice(
  List<ItemsRecord> items,
  String order,
) {
  if (order == 'Highest') {
    items.sort((a, b) => a.plan.price.compareTo(b.plan.price));
  } else if (order == 'Lowest') {
    items.sort((a, b) => b.plan.price.compareTo(a.plan.price));
  }

  return items;
}

List<ItemsRecord> filterItemsByCategory(
  List<ItemsRecord> items,
  DocumentReference category,
) {
  List<ItemsRecord> filtered = [];

  for (ItemsRecord data in items) {
    data.product?.get().then((product) {
      DocumentReference productCategory = product.get('category');
      if (category == productCategory) {
        filtered.add(data);
      }
    });
  }

  return filtered;
}

List<ProductsRecord> paginateProducts(
  List<ProductsRecord> data,
  int page,
  int pageSize,
) {
  if (data.isEmpty) {
    return [];
  }

  int startIndex = (page - 1) * pageSize;
  List<ProductsRecord> paginatedList = [];

  for (int i = 0; i < pageSize; i++) {
    int currentIndex = (startIndex + i) % data.length;
    paginatedList.add(data[currentIndex]);
  }

  return paginatedList;
}

List<ItemsRecord> filterItemsByDate(
  List<ItemsRecord> items,
  DateTime date,
) {
  List<ItemsRecord> filtered = [];

  for (ItemsRecord data in items) {
    data.parent?.get().then((parent) {
      Timestamp purchaseTimeRaw = parent.get('purchase_time');
      DateTime purchaseTime = purchaseTimeRaw.toDate();

      if ((purchaseTime.day == date.day) &&
          (purchaseTime.month == date.month) &&
          (purchaseTime.year == date.year)) {
        filtered.add(data);
      }
    });
  }

  return filtered;
}

String truncateText(String text) {
  // truncate text to 100 characters
  if (text.length <= 100) {
    return text;
  } else {
    return text.substring(0, 100) + '...';
  }
}

List<String> generateCountryCodes() {
  return [
    "+1", // USA, Canada, etc.
    "+7", // Russia, Kazakhstan
    "+20", // Egypt
    "+27", // South Africa
    "+30", // Greece
    "+31", // Netherlands
    "+32", // Belgium
    "+33", // France
    "+34", // Spain
    "+36", // Hungary
    "+39", // Italy
    "+40", // Romania
    "+41", // Switzerland
    "+44", // United Kingdom
    "+45", // Denmark
    "+46", // Sweden
    "+47", // Norway
    "+48", // Poland
    "+49", // Germany
    "+51", // Peru
    "+52", // Mexico
    "+53", // Cuba
    "+54", // Argentina
    "+55", // Brazil
    "+56", // Chile
    "+57", // Colombia
    "+58", // Venezuela
    "+60", // Malaysia
    "+61", // Australia
    "+62", // Indonesia
    "+63", // Philippines
    "+64", // New Zealand
    "+65", // Singapore
    "+66", // Thailand
    "+81", // Japan
    "+82", // South Korea
    "+84", // Vietnam
    "+86", // China
    "+90", // Turkey
    "+91", // India
    "+92", // Pakistan
    "+93", // Afghanistan
    "+94", // Sri Lanka
    "+95", // Myanmar
    "+98", // Iran
    "+211", // South Sudan
    "+212", // Morocco
    "+213", // Algeria
    "+216", // Tunisia
    "+218", // Libya
    "+220", // Gambia
    "+221", // Senegal
    "+222", // Mauritania
    "+223", // Mali
    "+224", // Guinea
    "+225", // Ivory Coast
    "+226", // Burkina Faso
    "+227", // Niger
    "+228", // Togo
    "+229", // Benin
    "+230", // Mauritius
    "+231", // Liberia
    "+232", // Sierra Leone
    "+233", // Ghana
    "+234", // Nigeria
    "+235", // Chad
    "+236", // Central African Republic
    "+237", // Cameroon
    "+238", // Cape Verde
    "+239", // Sao Tome and Principe
    "+240", // Equatorial Guinea
    "+241", // Gabon
    "+242", // Republic of the Congo
    "+243", // Democratic Republic of the Congo
    "+244", // Angola
    "+245", // Guinea-Bissau
    "+246", // Diego Garcia
    "+247", // Ascension Island
    "+248", // Seychelles
    "+249", // Sudan
    "+250", // Rwanda
    "+251", // Ethiopia
    "+252", // Somalia
    "+253", // Djibouti
    "+254", // Kenya
    "+255", // Tanzania
    "+256", // Uganda
    "+257", // Burundi
    "+258", // Mozambique
    "+260", // Zambia
    "+261", // Madagascar
    "+262", // Reunion
    "+263", // Zimbabwe
    "+264", // Namibia
    "+265", // Malawi
    "+266", // Lesotho
    "+267", // Botswana
    "+268", // Eswatini
    "+269", // Comoros
    "+290", // Saint Helena
    "+291", // Eritrea
    "+297", // Aruba
    "+298", // Faroe Islands
    "+299", // Greenland
    "+350", // Gibraltar
    "+351", // Portugal
    "+352", // Luxembourg
    "+353", // Ireland
    "+354", // Iceland
    "+355", // Albania
    "+356", // Malta
    "+357", // Cyprus
    "+358", // Finland
    "+359", // Bulgaria
    "+370", // Lithuania
    "+371", // Latvia
    "+372", // Estonia
    "+373", // Moldova
    "+374", // Armenia
    "+375", // Belarus
    "+376", // Andorra
    "+377", // Monaco
    "+378", // San Marino
    "+379", // Vatican City
    "+380", // Ukraine
    "+381", // Serbia
    "+382", // Montenegro
    "+383", // Kosovo
    "+385", // Croatia
    "+386", // Slovenia
    "+387", // Bosnia and Herzegovina
    "+389", // North Macedonia
    "+420", // Czech Republic
    "+421", // Slovakia
    "+423", // Liechtenstein
    "+500", // Falkland Islands
    "+501", // Belize
    "+502", // Guatemala
    "+503", // El Salvador
    "+504", // Honduras
    "+505", // Nicaragua
    "+506", // Costa Rica
    "+507", // Panama
    "+508", // Saint Pierre and Miquelon
    "+509", // Haiti
    "+590", // Saint Barthélemy, Saint Martin
    "+591", // Bolivia
    "+592", // Guyana
    "+593", // Ecuador
    "+594", // French Guiana
    "+595", // Paraguay
    "+596", // Martinique
    "+597", // Suriname
    "+598", // Uruguay
    "+599", // Curaçao, Caribbean Netherlands
    "+670", // East Timor
    "+672", // Australian External Territories
    "+673", // Brunei
    "+674", // Nauru
    "+675", // Papua New Guinea
    "+676", // Tonga
    "+677", // Solomon Islands
    "+678", // Vanuatu
    "+679", // Fiji
    "+680", // Palau
    "+681", // Wallis and Futuna
    "+682", // Cook Islands
    "+683", // Niue
    "+685", // Samoa
    "+686", // Kiribati
    "+687", // New Caledonia
    "+688", // Tuvalu
    "+689", // French Polynesia
    "+690", // Tokelau
    "+691", // Micronesia
    "+692", // Marshall Islands
    "+850", // North Korea
    "+852", // Hong Kong
    "+853", // Macau
    "+855", // Cambodia
    "+856", // Laos
    "+880", // Bangladesh
    "+886", // Taiwan
    "+960", // Maldives
    "+961", // Lebanon
    "+962", // Jordan
    "+963", // Syria
    "+964", // Iraq
    "+965", // Kuwait
    "+966", // Saudi Arabia
    "+967", // Yemen
    "+968", // Oman
    "+970", // Palestine
    "+971", // United Arab Emirates
    "+972", // Israel
    "+973", // Bahrain
    "+974", // Qatar
    "+975", // Bhutan
    "+976", // Mongolia
    "+977", // Nepal
    "+992", // Tajikistan
    "+993", // Turkmenistan
    "+994", // Azerbaijan
    "+995", // Georgia
    "+996", // Kyrgyzstan
    "+998" // Uzbekistan
  ];
}

double getAverageReviews(List<int> reviewList) {
  // get the average reviews from this list of ints
  if (reviewList.isEmpty) {
    return 0.0;
  } else {
    final sum = reviewList.reduce((a, b) => a + b);
    return sum / reviewList.length;
  }
}

double getResponsivePadding(double screenWidth) {
  if (screenWidth < 500) {
    return 20.0;
  } else if (screenWidth < 1025) {
    return 30.0;
  } else {
    return 70.0;
  }
}

bool printSomething(bool something) {
  print('Something is ');
  print(something);
  return something;
}

List<String> generateCountryList() {
  return [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cabo Verde",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Comoros",
    "Congo, Democratic Republic of the",
    "Congo, Republic of the",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Korea, North",
    "Korea, South",
    "Kosovo",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar (Burma)",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Vatican City (Holy See)",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe"
  ];
}

String convertToTitleCase(String input) {
  List<String> words = input.split(' ');
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (word.isNotEmpty) {
      words[i] = word[0].toUpperCase() + word.substring(1);
    }
  }
  return words.join(' ');
}

List<String> filterTags(
  List<DocumentReference> existingTags,
  List<TagsRecord> tags,
) {
  // Initialize an empty list to store filtered tag names
  List<String> filteredTags = [];

  // Iterate over each document reference in existingTags
  for (DocumentReference reference in existingTags) {
    // Use where to filter tags that match the current reference
    Iterable<TagsRecord> matchingTags =
        tags.where((tag) => tag.reference == reference);

    // Extract tag names from matchingTags and add to filteredTags list
    filteredTags.addAll(matchingTags.map((tag) => tag.name));
  }

  return filteredTags;
}

dynamic convertToJson(String json) {
  json = json.replaceAll('{', '{"');
  json = json.replaceAll(': ', '": "');
  json = json.replaceAll(', ', '", "');
  json = json.replaceAll('}', '"}');

  json = json.replaceAll('"{', '{');
  json = json.replaceAll('}"', '}');
  json = json.replaceAll('\n', '\\n');
  json = json.replaceAll('""', '"null"');
  return json;
}
