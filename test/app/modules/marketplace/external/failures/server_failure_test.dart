import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta_marketplace/app/modules/marketplace/external/failures/server_failure.dart';

void main() {
  group('fromQueryResponse', () {
    group('should return null when', () {
      test('not contains "errors" parameter', () {
        final mockResponse = {
          "data": {"viewer": null}
        };
        final response = ServerFailure.fromQueryResponse(mockResponse);
        expect(response, null);
      });
      test('"errors" parameter is null', () {
        final mockResponse = {
          "data": {"viewer": null},
          "errors": null
        };
        final response = ServerFailure.fromQueryResponse(mockResponse);
        expect(response, null);
      });
      test('"errors" parameter is a empty list', () {
        final mockResponse = {
          "data": {"viewer": null},
          "errors": []
        };
        final response = ServerFailure.fromQueryResponse(mockResponse);
        expect(response, null);
      });
    });
    test('should return correct message in ServerFailure when "errors" parameter contains at least 1 message', () {
      final mockResponse = {
        "data": {"viewer": null},
        "errors": [
          {"message": "Unauthorized"}
        ]
      };
      final response = ServerFailure.fromQueryResponse(mockResponse);
      expect(response, isA<ServerFailure>());
      expect(response?.message, "Unauthorized");
    });
    test('should return correct response in ServerFailure when "errors" parameter contains at least 1 message', () {
      final mockResponse = {
        "data": {"viewer": null},
        "errors": [
          {
            "message": "Unauthorized",
            "locations": [
              {"line": 2, "column": 3}
            ],
            "path": ["viewer"]
          }
        ]
      };
      final failure = ServerFailure.fromQueryResponse(mockResponse);
      expect(failure?.response, mockResponse);
    });
  });
  group('fromMutationResponse -', () {
    group('should return null when', () {
      test('"success" parameter is true and not contains "errorMessage"', () {
        final mockResponse = {
          "data": {
            "purchase": {"success": true}
          }
        };
        final response = ServerFailure.fromMutationResponse(mockResponse);
        expect(response, null);
      });
      test('"success" parameter is true and "errorMessage" parameter is null', () {
        final mockResponse = {
          "data": {
            "purchase": {"success": true, "errorMessage": null}
          }
        };
        final response = ServerFailure.fromMutationResponse(mockResponse);
        expect(response, null);
      });
      test('"success" parameter is true and "errorMessage" parameter contains a error message', () {
        final mockResponse = {
          "data": {
            "purchase": {"success": true, "errorMessage": "Offer expired"}
          }
        };
        final response = ServerFailure.fromMutationResponse(mockResponse);
        expect(response, null);
      });
    });

    test('should return correct message in ServerFailure when "success" parameter is false and "errorMessage" is valid', () {
      final mockResponse = {
        'success': false,
        'errorMessage': 'Offer expired',
        'customer': {'balance': 1000000}
      };
      final response = ServerFailure.fromMutationResponse(mockResponse);
      expect(response, isA<ServerFailure>());
      expect(response?.message, 'Offer expired');
    });
  });
}
