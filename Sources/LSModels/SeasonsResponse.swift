//
//  SeasonsResponse.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation

public struct Season: Codable {
  public let year: Int?
  public let start: String?
  public let end: String?
  public let current: Bool?
  public let coverage: Coverage?
  
  public init(
    year: Int?,
    start: String?,
    end: String?,
    current: Bool?,
    coverage: Coverage?
  ) {
    self.year = year
    self.start = start
    self.end = end
    self.current = current
    self.coverage = coverage
  }
}

public struct Coverage: Codable {
  public let fixtures: CoverageFixtures?
  public let standings: Bool?
  public let players: Bool?
  public let topScorers: Bool?
  public let predictions: Bool?
  public let odds: Bool?
  
  public init(
    fixtures: CoverageFixtures?,
    standings: Bool?,
    players: Bool?,
    topScorers: Bool?,
    predictions: Bool?,
    odds: Bool?
  ) {
    self.fixtures = fixtures
    self.standings = standings
    self.players = players
    self.topScorers = topScorers
    self.predictions = predictions
    self.odds = odds
  }
  
  enum CodingKeys: String, CodingKey {
    case fixtures
    case standings
    case players
    case topScorers = "top_scorers"
    case predictions
    case odds
  }
}

public struct CoverageFixtures: Codable {
  public let events: Bool?
  public let lineups: Bool?
  public let statisticsFixtures: Bool?
  public let statisticsPlayers: Bool?
  
  public init(
    events: Bool?,
    lineups: Bool?,
    statisticsFixtures: Bool?,
    statisticsPlayers: Bool?
  ) {
    self.events = events
    self.lineups = lineups
    self.statisticsFixtures = statisticsFixtures
    self.statisticsPlayers = statisticsPlayers
  }
  
  enum CodingKeys: String, CodingKey {
    case events
    case lineups
    case statisticsFixtures = "statistics_fixtures"
    case statisticsPlayers = "statistics_players"
  }
}
