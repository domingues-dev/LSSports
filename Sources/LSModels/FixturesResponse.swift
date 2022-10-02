//
//  FixturesResponse.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation

public struct FixturesResponse: Codable {
  public let response: [Fixture]
  
  public init(
    response: [Fixture]
  ) {
    self.response = response
  }
}
public struct Fixture: Codable {
  public let id: Int?
  public let referee: String?
  public let timezone: String?
  public let date: Date?
  public let timestamp: Int64?
  public let periods: Periods?
  public let venue: Venue?
  public let status: Status?
  public let league: League? // check
  public let teams: Teams?
  public let goals: Goals?
  public let score: Score?
  
  public init(
    id: Int?,
    referee: String?,
    timezone: String?,
    date: Date?,
    timestamp: Int64?,
    periods: Periods?,
    venue: Venue?,
    status: Status?,
    league: League?, // check
    teams: Teams?,
    goals: Goals?,
    score: Score?
  ) {
    self.id = id
    self.referee = referee
    self.timezone = timezone
    self.date = date
    self.timestamp = timestamp
    self.periods = periods
    self.venue = venue
    self.status = status
    self.league = league
    self.teams = teams
    self.goals = goals
    self.score = score
  }
  
}

public struct Periods: Codable {
  public let first: Int64?
  public let second: Int64?
  
  public init(
    first: Int64?,
    second: Int64?
  ) {
    self.first = first
    self.second = second
  }
}

public struct Venue: Codable {
  public let id: Int?
  public let name: String?
  public let city: String?
  
  public init(
    id: Int?,
    name: String?,
    city: String?
  ) {
    self.id = id
    self.name = name
    self.city = city
  }
}

public struct Status: Codable {
  public let long: String?
  public let short: String?
  public let elapsed: Int?
  
  public init(
    long: String?,
    short: String?,
    elapsed: Int?
  ) {
    self.long = long
    self.short = short
    self.elapsed = elapsed
  }
}

public struct Teams: Codable {
  public let home: Team?
  public let away: Team?
  
  public init(
    home: Team?,
    away: Team?
  ) {
    self.home = home
    self.away = away
  }
}

public struct Team: Codable {
  public let id: Int?
  public let name: String?
  public let logo: String?
  public let winner: Bool?
  
  public init(
    id: Int?,
    name: String?,
    logo: String?,
    winner: Bool?
  ) {
    self.id = id
    self.name = name
    self.logo = logo
    self.winner = winner
  }
}

public struct Goals: Codable {
  public let home: Int?
  public let away: Int?
  
  public init(
    home: Int?,
    away: Int?
  ) {
    self.home = home
    self.away = away
  }
}

public struct Score: Codable {
  public let halftime: Goals?
  public let fulltime: Goals?
  public let extratime: Goals?
  public let penalty: Goals?
  
  public init(
    halftime: Goals?,
    fulltime: Goals?,
    extratime: Goals?,
    penalty: Goals?
  ) {
    self.halftime = halftime
    self.fulltime = fulltime
    self.extratime = extratime
    self.penalty = penalty
  }
}
