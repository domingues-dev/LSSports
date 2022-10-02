//
//  LeaguesResponse.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation

public struct LeaguesResponse: Codable {
  public let response: [LeagueResponse?]
  public init(
    response: [LeagueResponse?]
  ) {
    self.response = response
  }
}

public struct LeagueResponse: Codable {
  public let league: League?
  public let country: Country?
  public let season: Season?
  public init(
    league: League?,
    country: Country?,
    season: Season?
  ) {
    self.league = league
    self.country = country
    self.season = season
  }
}

public struct League: Codable {
  public let id: Int?
  public let name: String?
  public let type: LeagueType?
  public let logo: String?
  
  public init(
    id: Int?,
    name: String?,
    type: LeagueType?,
    logo: String?
  ) {
    self.id = id
    self.name = name
    self.type = type
    self.logo = logo
  }
}

public enum LeagueType: String, Codable, CaseIterable, Equatable {
  case League
  case Cup
}

public struct LeagueSearchOptions: Decodable, Equatable {
  public var countryCode: String = ""
  public var type: LeagueType = .League
  
  public init(
    countryCode: String = "",
    type: LeagueType = .League
  ) {
    self.countryCode = countryCode
    self.type = type
  }
  
  enum CodingKeys: String, CodingKey {
    case countryCode = "code"
    case type
  }
}
