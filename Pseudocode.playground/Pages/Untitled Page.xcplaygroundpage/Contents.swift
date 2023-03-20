import Foundation
import SwiftUI
import UIKit

let goal: String =
"""
{
  "users": [
    {
      "name": "Bob",
      "uuid": "sdajdasjdasd"
    },
    {
      "name": "Jack",
      "uuid": "sasdadasd"
    },
    {
      "name": "Mary",
      "uuid": "asdasdasdasda"
    }
  ],
  "date": "2022-11-14T15:47:47Z",
  "daypart": "fullday"
}
"""

struct User: Codable {
    let name: String
    let uuid: String
}
let group: [User] = [User(name: "Bob", uuid: "sdajdasjdasd"), User(name: "Jack", uuid: "sasdadasd"),User(name: "Mary", uuid: "asdasdasdasda")]
let date = Date()
let daypart = "fullday"

var encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
encoder.dateEncodingStrategy = .iso8601

let groupJSON = try encoder.encode(group)

let payload: [String : Any] = [
    "date" : date.ISO8601Format().description,
        "daypart": daypart,
        "users" : String(data: groupJSON, encoding: .utf8)!
]
print(payload)
//print(String(data: groupJSON, encoding: .utf8)!)
func postReservationForGroup(
    group: [User],
    workspaceUuid: String,
    date: Date,
    dayPart: String
) async throws {
    let endpoint = Endpoint.postReservationGroup

    guard var url = URL(string: endpoint.url) else {
        throw Endpoint.Error.urlError
    }
    url.appendPathComponent(workspaceUuid + "/reserveringen/groepsreservering")

    var payload: [String: String]

    payload = [
        "date": date.startOfDay.ISO8601Format(),
        "dayPart": dayPart,
        "users" : group
    ]

    return try await withCheckedThrowingContinuation { continuation in
        DeskieSessionManager.shared.session.request(
            url,
            method: endpoint.httpMethod,
            parameters: payload,
            encoding: JSONEncoding.default
        ).responseString { dataResponse in

            if let data = dataResponse.response {
                Logger.Deskie.info("POST STATUSCODE: \(data.statusCode)")
                continuation.resume()
                return
            }

            if let err = dataResponse.error {
                continuation.resume(throwing: err)
                return
            }
            fatalError("should not get here")
        }
    }
}
