//
//  FinanceClient.swift
//  DollarDalla
//
//  Created by 이서준 on 3/27/24.
//

import Foundation
import ComposableArchitecture

// MARK: - API client interface

@DependencyClient
struct FinanceClient {
    var quote: @Sendable (_ ticker: String) async throws -> OptionChain
}

// TestDependencyKey Protocol
//extension FinanceClient: TestDependencyKey {
//    static let testValue: FinanceClient =  Self()
//}

extension DependencyValues {
    var financeClient: FinanceClient {
        get { self[FinanceClient.self] }
        set { self[FinanceClient.self] = newValue }
    }
}

// MARK: - Live API implementation

extension FinanceClient: DependencyKey {
    static var liveValue: Self {
        // DependencyClient 안에 Dependency를 두는 하나의 방법
        @Dependency(\.urlSession) var urlSession
        
        return FinanceClient(quote: { ticker in
            let baseURL = Bundle.main.apiBaseURL
            let endPoint = baseURL
                .appending("/finance/options/")
                .appending(ticker)
            var components = URLComponents(string: endPoint)!
            components.queryItems = []
            
            let (data, _) = try await urlSession.data(from: components.url!)
            return try JSONDecoder().decode(OptionChain.self, from: data)
        })
    }
}
