//
//  MockNetwork.swift
//  SevenAppsCaseStudyTests
//
//  Created by Ahmet Yasin Atakan on 21.01.2025.
//

import Foundation
#if DEVELOPMENT
@testable import SevenAppsCaseStudyDev
#elseif PRODUCTION
@testable import SevenAppsCaseStudyProd
#endif

final class MockNetwork: Networkable {
    var mockResult: Result<[UsersModel], NetworkingError>?
    
    func request() async -> URLRequest {
            return URLRequest(url: URL(string: "https://sevenapps.com")!)
        }
 
    func fetch<T: Decodable>(requestModel model: T.Type) async -> Result<T, NetworkingError> {
        guard let result = mockResult as? Result<T, NetworkingError> else {
            return .failure(.unknownError)
        }
        return result
    }
}
