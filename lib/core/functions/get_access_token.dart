import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

const String firebasemessagingScope =
    'https://www.googleapis.com/auth/firebase.messaging';

// Future<String> getAccessToken() async {
//   final clint = await clientViaServiceAccount(
//     ServiceAccountCredentials.fromJson(
//       {
//         "type": "service_account",
//         "project_id": "mutamaruna2",
//         "private_key_id": "59388d8a486c3511536f80cb81c84a03a2d3f0b5",
//         "private_key":
//             "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDRBlVmQUVZWjmB\n5qrpXJU9QN0Q1E6hjtwUKpN1nhf6xiIM6eAz6j1ZzWuzgxh0e6OyLhQtX5Dg6rQX\nm+GNTO0ITXcZWDb19RST7Hcjphh7S9LheFoFiVTPGL06iYxsWWjbICgGhzfQCoZQ\nrZ5PqPFwnuI+qPErb2ePnVLFvChnGrkr0cGVG8aDuQ+LdnM/2Aju5awz2z1mBxa6\nVXAhsHgDhwhL72cj6w5SNSgM+mjErhYePl8+QQwGjeBaSvvEPSHNJrn0pe9hTsZz\nXDYwtdWhDqomckFRUM/0hzmJFUEoVUmeZxUtZrPlJeyYk5eSS+SLkX2NgV+5cub1\nyx++NYyBAgMBAAECggEAEzBAW7xAzqFhQRysJb/swixEfwlQB89fdbx42ZkAFr9+\nNbt5bEEKWizPWjHkZ1RIV6plcMrinm5jxpapTJLtkzY+6WudoNOoWXIH3kgFQrnx\nuIAXZ4W1bIBjzE4ycjawN3MXj/RCBxrh1kf+wTPydV/CLkIzel5mRLSKrWggbC9I\n9ciD2CRcTxVrxQLVpB2pFklrGRLa5ld9bx7IVTBu7aJvnJY6tqccF65YGrRtcTg/\nY+GdkZHfWNQ9o4Ru8tcaPk72hNpRQxuF048S9roLj9/ocUKAwp+iMPRwSB5NCJwo\nn0VeBDTIXBehi6fVYYD6FCapMNBcRQKY4wUyepr/LwKBgQD41IEE4qC9lYGEQQDa\nw5JtJvTTqg25D2n3OzjhhvUR4g4Za9MnrzE9QOWfSYJhaPs0c7TZZg/k0RiuQnd7\nrw7nNyCV2PzzhwXoSxVsEbzUrgVcYLj6qnf1FbxXcU24PJipLnirvLBytHHPtyLE\nE3KgrxIr5d1LO+ODlHsIUhzG5wKBgQDXDDSN6gOIRFj6fPrlvTAQlgCs7ZQbsU/S\nUA25ymui36+KixVCz0t4p8hP0uneLN4THicIMRrfaY7O/CKXaQ0CiqMV0q73QY+c\nnMkcF2GU+rwwEZ7B3rieHcnBBz2WGTP1tmrncZJOAOF816V4AlVSzu4s7QOXQ5B9\ni0XtE0fsVwKBgQDSdbJ2dlSsZXK5cN2PKtGDfuqeyHt45h+jW7Tdk+9eY8u3Fqrv\nKs/D1kshMeSUDV5DXAY/xoJ076InadJzi3pYeBkYhQJV3ANUGYWR9WK4pEOmgayT\nX3G8mtjFQPESfjZFCihIYX0AV7zXijdejnBqlgkRlgdZJdtmJET3obPzSwKBgBb8\nUf29PqVpEM2tYDAAOcv8DJRvTH5tRGfpcJ4kOb8OA7heR2Z9u8ZowKtvktnRl+cZ\nOPjSLtokcUREhPoEG4TjBq2FeHgrRMtror9i7GY9KrJEn+B/CuKzsmX0fSu3A+vG\nlMSqSgYWaAOtFR2vuikAv0qEBvc7HI2evlmpzu0/AoGBAI62xIXLI7ZbltisILnw\nppxg9uXYFJIeudmz8IzUqePKbvNkQ/7L51TW61WnWxXK3bT7GXJdng5zZjX5coih\n3zCYeIpyzBIRAlMBvsp/S/guUgIIyk4ijSFG6CHtP5R5MH7cDx77AXgb8FxB1oYn\nqHyV0netmQ154iOgIjiwSYUk\n-----END PRIVATE KEY-----\n",
//         "client_email":
//             "firebase-adminsdk-w1tuk@mutamaruna2.iam.gserviceaccount.com",
//         "client_id": "114341972435269200463",
//         "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//         "token_uri": "https://oauth2.googleapis.com/token",
//         "auth_provider_x509_cert_url":
//             "https://www.googleapis.com/oauth2/v1/certs",
//         "client_x509_cert_url":
//             "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-w1tuk%40mutamaruna2.iam.gserviceaccount.com",
//         "universe_domain": "googleapis.com"
//       },
//     ),
//     [firebasemessagingScope],
//   );

//   final accessToken = clint.credentials.accessToken.data;

//   return accessToken;
// }

Future<String?> getAccessToken() async {
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "mutamaruna2",
    "private_key_id": "59388d8a486c3511536f80cb81c84a03a2d3f0b5",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDRBlVmQUVZWjmB\n5qrpXJU9QN0Q1E6hjtwUKpN1nhf6xiIM6eAz6j1ZzWuzgxh0e6OyLhQtX5Dg6rQX\nm+GNTO0ITXcZWDb19RST7Hcjphh7S9LheFoFiVTPGL06iYxsWWjbICgGhzfQCoZQ\nrZ5PqPFwnuI+qPErb2ePnVLFvChnGrkr0cGVG8aDuQ+LdnM/2Aju5awz2z1mBxa6\nVXAhsHgDhwhL72cj6w5SNSgM+mjErhYePl8+QQwGjeBaSvvEPSHNJrn0pe9hTsZz\nXDYwtdWhDqomckFRUM/0hzmJFUEoVUmeZxUtZrPlJeyYk5eSS+SLkX2NgV+5cub1\nyx++NYyBAgMBAAECggEAEzBAW7xAzqFhQRysJb/swixEfwlQB89fdbx42ZkAFr9+\nNbt5bEEKWizPWjHkZ1RIV6plcMrinm5jxpapTJLtkzY+6WudoNOoWXIH3kgFQrnx\nuIAXZ4W1bIBjzE4ycjawN3MXj/RCBxrh1kf+wTPydV/CLkIzel5mRLSKrWggbC9I\n9ciD2CRcTxVrxQLVpB2pFklrGRLa5ld9bx7IVTBu7aJvnJY6tqccF65YGrRtcTg/\nY+GdkZHfWNQ9o4Ru8tcaPk72hNpRQxuF048S9roLj9/ocUKAwp+iMPRwSB5NCJwo\nn0VeBDTIXBehi6fVYYD6FCapMNBcRQKY4wUyepr/LwKBgQD41IEE4qC9lYGEQQDa\nw5JtJvTTqg25D2n3OzjhhvUR4g4Za9MnrzE9QOWfSYJhaPs0c7TZZg/k0RiuQnd7\nrw7nNyCV2PzzhwXoSxVsEbzUrgVcYLj6qnf1FbxXcU24PJipLnirvLBytHHPtyLE\nE3KgrxIr5d1LO+ODlHsIUhzG5wKBgQDXDDSN6gOIRFj6fPrlvTAQlgCs7ZQbsU/S\nUA25ymui36+KixVCz0t4p8hP0uneLN4THicIMRrfaY7O/CKXaQ0CiqMV0q73QY+c\nnMkcF2GU+rwwEZ7B3rieHcnBBz2WGTP1tmrncZJOAOF816V4AlVSzu4s7QOXQ5B9\ni0XtE0fsVwKBgQDSdbJ2dlSsZXK5cN2PKtGDfuqeyHt45h+jW7Tdk+9eY8u3Fqrv\nKs/D1kshMeSUDV5DXAY/xoJ076InadJzi3pYeBkYhQJV3ANUGYWR9WK4pEOmgayT\nX3G8mtjFQPESfjZFCihIYX0AV7zXijdejnBqlgkRlgdZJdtmJET3obPzSwKBgBb8\nUf29PqVpEM2tYDAAOcv8DJRvTH5tRGfpcJ4kOb8OA7heR2Z9u8ZowKtvktnRl+cZ\nOPjSLtokcUREhPoEG4TjBq2FeHgrRMtror9i7GY9KrJEn+B/CuKzsmX0fSu3A+vG\nlMSqSgYWaAOtFR2vuikAv0qEBvc7HI2evlmpzu0/AoGBAI62xIXLI7ZbltisILnw\nppxg9uXYFJIeudmz8IzUqePKbvNkQ/7L51TW61WnWxXK3bT7GXJdng5zZjX5coih\n3zCYeIpyzBIRAlMBvsp/S/guUgIIyk4ijSFG6CHtP5R5MH7cDx77AXgb8FxB1oYn\nqHyV0netmQ154iOgIjiwSYUk\n-----END PRIVATE KEY-----\n",
    "client_email":
        "firebase-adminsdk-w1tuk@mutamaruna2.iam.gserviceaccount.com",
    "client_id": "114341972435269200463",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-w1tuk%40mutamaruna2.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  };

  List<String> scopes = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/firebase.database",
    "https://www.googleapis.com/auth/firebase.messaging"
  ];

  try {
    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();
    return credentials.accessToken.data;
  } catch (e) {
    return null;
  }
}
