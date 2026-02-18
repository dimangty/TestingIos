//
//  CacheServiceTests.swift
//  TestingTaskTests
//
//  Created by Igor Kislyuk on 26.01.2026.
//

import Testing
import Foundation
@testable import TestingTask

extension Article {
    static var empty: Article {
        Article(author: nil, title: nil, description: nil, url: nil, urlToImage: nil, publishedAt: Date())
    }
}

struct CacheServiceTests {

    let sut: ICacheService

    init() {
        sut = CacheService(cacheExpirationInterval: 1)
    }

    @Test
    func getCachedNews() async throws {
        // given
        let expected = NewsSource(status: "s", totalResults: 1, articles: [])
        sut.cacheNews(expected)

        // when
        let res = sut.getCachedNews()

        // then
        #expect(res == expected)
    }

    @Test("clearCache")
    func clearCache() async throws {
        //given
        let expected = NewsSource(status: "s", totalResults: 1, articles: [])
        sut.cacheNews(expected)

        // when
        let res = sut.getCachedNews()
        #expect(res == expected)
        sut.clearCache()

        // then
        #expect(sut.getCachedNews() == nil)
    }
}
