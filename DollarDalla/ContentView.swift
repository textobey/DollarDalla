//
//  ContentView.swift
//  DollarDalla
//
//  Created by 이서준 on 3/26/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Finance {
    @ObservableState
    struct State {
        var result: [QuoteResult] = []
    }
    
    enum Action {
        case fetchQuote(String)
        case quoteReponse(Result<OptionChain, Error>)
    }
    
    @Dependency(\.financeClient) var financeClient
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchQuote(let ticker):
                return .run { send in
                    await send(.quoteReponse(
                        Result { try await self.financeClient.quote(ticker: ticker) }
                    ))
                }
            case .quoteReponse(.failure):
                state.result = []
                return .none
            case let .quoteReponse(.success(response)):
                state.result = response.optionChain?.result ?? []
                return .none
            }
        }
    }
}

struct ContentView: View {
    let store: StoreOf<Finance>
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            store.send(.fetchQuote("AAPL"))
        }
    }
}

#Preview {
    ContentView(
        store: Store(initialState: Finance.State()) {
            Finance()
        }
    )
}
