//
//  OptionChain.swift
//  DollarDalla
//
//  Created by 이서준 on 3/27/24.
//

import Foundation

struct OptionChain: Sendable, Decodable {
    var optionChain: OptionChainData?
}

struct OptionChainData: Sendable, Decodable {
    var result: [QuoteResult]?
    //var error: JSONNull?
}

struct QuoteResult: Sendable, Decodable {
    var underlyingSymbol: String?
    var expirationDates: [Int]?
    var strikes: [CGFloat]?
    var hasMiniOptions: Bool?
    var quote: Quote?
    var options: [Option]?
}

struct Quote: Sendable, Decodable {
    var language: String?
    var region: String?
    var quoteType: String?
    var triggerable: Bool?
    var quoteSourceName: String?
    var forwardPE: CGFloat?
    var priceToBook: CGFloat?
    var sourceInterval: Int?
    var exchangeTimezoneName: String?
    var exchangeTimezoneShortName: String?
    var fiftyTwoWeekHighChangePercent: CGFloat?
    var fiftyTwoWeekLow: CGFloat?
    var fiftyTwoWeekHigh: CGFloat?
    var dividendDate: Int?
    var earningsTimestamp: Int?
    var earningsTimestampStart: Int?
    var gmtOffSetMilliseconds: Int?
    var currency: String?
    var epsCurrentYear: CGFloat?
    var epsTrailingTwelveMonths: CGFloat?
    var epsForward: CGFloat?
    var sharesOutstanding: Int?
    var bookValue: CGFloat?
    var fiftyDayAverage: CGFloat?
    var fiftyDayAverageChange:CGFloat?
    var fiftyDayAverageChangePercent: CGFloat?
    var twoHundredDayAverage: CGFloat?
    var twoHundredDayAverageChange: CGFloat?
    var twoHundredDayAverageChangePercent: CGFloat?
    var marketCap: Int?
    var postMarketChangePercent: CGFloat?
    var postMarketTime: Int?
    var exchangeDataDelayedBy: Int?
    var bid: CGFloat?
    var ask: CGFloat?
    var bidSize: Int?
    var askSize: Int?
    var messageBoardId: String?
    var fullExchangeName: String?
    var longName: String?
    var financialCurrency: String?
    var averageDailyVolume3Month: Int?
    var averageDailyVolume10Day: Int?
    var earningsTimestampEnd: Int?
    var trailingAnnualDividendRate: CGFloat?
    var trailingPE: CGFloat?
    var trailingAnnualDividendYield: CGFloat?
    var esgPopulated: Bool?
    var tradeable: Bool?
    var priceEpsCurrentYear: CGFloat?
    var postMarketPrice: CGFloat?
    var postMarketChange: CGFloat?
    var regularMarketChangePercent: CGFloat?
    var fiftyTwoWeekLowChange: CGFloat?
    var fiftyTwoWeekLowChangePercent: CGFloat?
    var fiftyTwoWeekHighChange: CGFloat?
    var priceHint: Int?
    var exchange: String?
    var regularMarketPrice: CGFloat?
    var regularMarketTime: Int?
    var regularMarketChange: CGFloat?
    var regularMarketOpen: Int?
    var regularMarketDayHigh: CGFloat?
    var regularMarketDayLow: CGFloat?
    var regularMarketVolume: Int?
    var symbol: String?
    var market: String?
    var marketState: String?
    var shortName: String?
    var fiftyTwoWeekRange: String?
}

struct Option: Sendable, Decodable {
    var expirationDate: Int?
    var hasMiniOptions: Bool?
    var calls: [Call]?
}

struct Call: Sendable, Decodable {
    var contractSymbol: String?
    var strike: CGFloat?
    var currency: String?
    var lastPrice: CGFloat?
    var change: CGFloat?
    var percentChange: CGFloat?
    var volume: Int?
    var openInterest: Int?
    var bid: CGFloat?
    var ask: CGFloat?
    var contractSize: String?
    var expiration: Int?
    var lastTradeDate: Int?
    var impliedVolatility: CGFloat?
    var inTheMoney: Bool?
}
