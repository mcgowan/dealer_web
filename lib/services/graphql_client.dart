// Copyright (c) 2019, Hansen Technologies.
// A library to manage communication with the ICX GraphQL API.

import 'dart:convert';
import 'package:http/http.dart';

/// Represents the ICX authentication header.
class AuthorizationHeader {
  final String username;
  final String dsn;
  String token;
  final String client;

  /// Constructs a new instance of the ICXAuthorizationHeader.
  AuthorizationHeader({this.username, this.dsn, this.token, this.client});

  /// Returns the JSON representation of this instance.
  dynamic toJson() =>
      {'username': username, 'dsn': dsn, 'token': token, 'client': client};
}

/// Manages communication with the ICX GraphQL API.
///
/// This class handles authentication and allows execution of both queries and mutation.
/// The custom ICX authentication header is managed by this class with each request.
class GraphQLClient {
  /// The url of the GraphQL API endpoint.
  final String url;

  /// The name of the client application using this class.
  ///
  /// This name shows up in GraphQL API requests so that the originating client can be easily identified.
  final String client;

  /// The name of the default DSN for this client.
  ///
  /// This dsn will be used when you authenticate without supplying a dsn.
  final String dsn;

  /// The current authorization header.
  ///
  /// The header is null when the client is not authenticated.
  AuthorizationHeader authorizationHeader;

  /// Indicates whether the client is authenticated or not.
  bool get isAuthenticated => authorizationHeader != null;

  /// Constructs a new instance of the ICXAuthorizationHeader.
  GraphQLClient({this.url, this.client, this.dsn});

  /// Authenticate the client for the given user, proof and dsn.
  Future<bool> authenticate(String user, String proof, String dsn) async {
    const String query = """
      mutation auth(\$user: String!, \$proof: String!, \$dsn: String!) {
        authenticate(username: \$user, proof: \$proof, dsns: [\$dsn]) {
          authenticated
          failureReason
          licenseWillExpireWarning
          userName
          token
          dsns {
            isValid
            name
          }
        }
      }
    """;

    authorizationHeader = null;
    Object variables = {"user": user, "proof": proof, "dsn": dsn};

    var value = await executeQuery(query, variables);

    var authResult = value['data']['authenticate'];
    bool authenticated = authResult['authenticated'];
    String token = authResult['token'];

    if (authenticated) {
      authorizationHeader = AuthorizationHeader(
        username: user,
        dsn: dsn,
        token: token,
        client: client,
      );
    }

    return authenticated;
  }

  /// Execute a query.
  ///
  /// Allows execution of queries and mutations - both authenticated and not authenticated.
  Future<dynamic> executeQuery(String query, Object variables) async {
    const String icxAuthorizationHeaderName = "X-ICC-Authorization";

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    if (authorizationHeader != null) {
      String icxAuthorizationHeaderString =
          jsonEncode(authorizationHeader.toJson());
      headers[icxAuthorizationHeaderName] = icxAuthorizationHeaderString;
    }

    Object request = {
      "query": query,
      "variables": variables,
      "operationName": null
    };

    String requestString = jsonEncode(request);
    print("Request: $requestString");

    Response response = await post(url, headers: headers, body: requestString);
    print("Response: ${response.body}");

    // Refresh token if returned
    var icxAuthorizationHeaderString =
        response.headers[icxAuthorizationHeaderName.toLowerCase()];
    if (icxAuthorizationHeaderString != null && authorizationHeader != null) {
      var json = jsonDecode(icxAuthorizationHeaderString);
      authorizationHeader.token = json['Token'];
    }

    return jsonDecode(response.body);
  }
}
