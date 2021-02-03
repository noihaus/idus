//
//  DataModel.swift
//  idus
//
//  Created by ksYoo on 2021/02/01.
//

import Foundation

// MARK: - DataModel
struct DataModel: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let screenshotUrls: [String]
    let ipadScreenshotUrls, appletvScreenshotUrls: [String]
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let artistViewUrl: String
    let supportedDevices: [String]
    let advisories: [String]
    let isGameCenterEnabled: Bool
    let features: [String]
    let kind, trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes, contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let averageUserRating: Double
    let trackViewUrl: String
    let trackContentRating: String
    let trackId: Int
    let trackName: String
    let releaseDate: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let minimumOsVersion: String
    let genreIds: [String]
    let formattedPrice, primaryGenreName, sellerName: String
    let currentVersionReleaseDate: String
    let releaseNotes: String
    let primaryGenreId: Int
    let currency, description: String
    let artistId: Int
    let artistName: String
    let genres: [String]
    let price: Int
    let bundleId, version, wrapperType: String
    let userRatingCount: Int
}
