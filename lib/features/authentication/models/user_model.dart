
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waflo_admin/utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Helper function to get the full name

  String get fullName => '$firstName $lastName';

  // Helper function to format the phone number
  String get formattedPhoneNumber =>
      TFortmatters.formatPhoneNumber(phoneNumber);

  // Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static function to generate a username from the full name;
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUserName";
    return userNameWithPrefix;
  }

  // Static function to create on empty user model
  static UserModel empty() => UserModel(
    id: '', 
    firstName: '', 
    lastName: '', 
    username: '', 
    email: '', 
    phoneNumber: '', 
    profilePicture: '',
  );

  //Convert the user model to JSON stucture for staring data in Firebase
  Map<dynamic, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  // Factory  method to create  a user model from a firebase snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    }
    throw Exception('Invalid document snapshot'); // Add this line
  }

}
