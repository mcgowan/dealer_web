import 'package:test/test.dart';
import '../../lib/services/graphql_client.dart';

void main() {
  group("GraphQLClient", () {
    const String url = "http://172.16.77.59/asm/all/graphql/csr/api";
    const String clientName = "dealernet";
    const String testDsn = "tnor";
    const String defaultDsn = "z-baseline";
    const String testUsername = "ibsadmin";
    const String testPassword = "testpw";
    
    const Object getCustomerVariables = {"customerId": 25641940};
    const String getCustomerQuery = """
      query getCustomer(\$customerId: Int!){
        customer(id: \$customerId) {
          defaultAddress {
            firstName
            surname
          }
        }
      }
    """;
    const String getDsnsQuery = """
      {
        global {
          dsns {
            name
          }
        }
      }
    """;

    GraphQLClient createClient() {
      return GraphQLClient(url: url, client: clientName);
    }

    GraphQLClient createClientWithDsn() {
      return GraphQLClient(url: url, client: clientName, defaultDsn: defaultDsn);
    }

    test('should set url and client after construction', () {
      final client = createClient();

      expect(client.url, url);
      expect(client.client, clientName);
      expect(client.isAuthenticated, false);
    });

    test('should authenticate', () async {
      final client = createClient();

      bool authenticated = await client.authenticate(testUsername, testPassword, testDsn);

      expect(authenticated, true);
      expect(client.isAuthenticated, true);
    });

    test('should execute unauthenticated query when not authenticated',
        () async {
      final client = createClient();

      String query = """
        {
          global {
            dsns {
              name
            }
          }
        }
      """;
      var result = await client.executeQuery(getDsnsQuery, {});

      dynamic dsns = result['data']['global']['dsns'];
      expect(dsns[0]['name'], "gil");
    });

    test(
        'should return error when trying to execute authenticated query when not authenticated',
        () async {
      final client = createClient();

      var result = await client.executeQuery(getCustomerQuery, getCustomerVariables);

      expect(result['data'], null);
      expect(
          result['message'], "Authorization has been denied for this request.");
    });

    test('should execute authenticated query when authenticated', () async {
      final client = createClient();

      bool authenticated = await client.authenticate(testUsername, testPassword, testDsn);

      var result = await client.executeQuery(getCustomerQuery, getCustomerVariables);

      dynamic address = result['data']['customer']['defaultAddress'];
      expect(address['firstName'], "MIKE");
    });

    test('should refresh the token after each authenticated query', () async {
      final client = createClient();

      bool authenticated = await client.authenticate(testUsername, testPassword, testDsn);
      String firstToken = client.authorizationHeader.token;

      var result = await client.executeQuery(getCustomerQuery, getCustomerVariables);
      String secondToken = client.authorizationHeader.token;
      expect(result['data'] != null, true);

      var result2 = await client.executeQuery(getCustomerQuery, getCustomerVariables);
      String thirdToken = client.authorizationHeader.token;
      expect(result2['data'] != null, true);

      expect(secondToken != firstToken, true);
      expect(thirdToken != secondToken, true);
      expect(thirdToken != firstToken, true);
    });

    test('should get a fresh token when re-authenticating', () async {
      final client = createClient();

      await client.authenticate(testUsername, testPassword, testDsn);
      String firstToken = client.authorizationHeader.token;

      await client.authenticate(testUsername, testPassword, testDsn);
      String secondToken = client.authorizationHeader.token;

      await client.authenticate(testUsername, testPassword, testDsn);
      String thirdToken = client.authorizationHeader.token;

      expect(secondToken != firstToken, true);
      expect(thirdToken != secondToken, true);
      expect(thirdToken != firstToken, true);
    });

    test('should allow authentication with default dsn if one is set', () async {
      final client = createClientWithDsn();

      bool authenticated = await client.authenticate(testUsername, testPassword);

      expect(authenticated, true);
    });
  });
}
