//
//  FixturesRoute.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation
import SwiftUI
import URLRouting
import LSModels

public enum FixturesRoute: Equatable {
  case events(Int)
  case fetch
  case h2h // request needed
  case lineUps
  case playerStatistics
  case rounds // request needed
  case statistics(Int)
  case statisticsRequest(FixtureStatisticsRequest)
}

let fixturesRouter = OneOf {
  Route(.case(FixturesRoute.events)) {
    Path { "events" }
    Query {
      Field("fixture") { Digits() }
    }
  }
  Route(.case(FixturesRoute.fetch))
  Route(.case(FixturesRoute.h2h)) {
    Path { "headtohead" }
  }
  Route(.case(FixturesRoute.lineUps)) {
    Path { "lineups" }
  }
  Route(.case(FixturesRoute.playerStatistics)) {
    Path { "players" }
  }
  Route(.case(FixturesRoute.rounds)) {
    Path { "rounds" }
  }
  Route(.case(FixturesRoute.statisticsRequest)) {
    Path { "statistics" }
    Parse(.memberwise(FixtureStatisticsRequest.init)) {
      Query {
        Field("fixture") { Digits() }
        Field("team") { Digits() }
      }
    }
  }
  Route(.case(FixturesRoute.statistics)) {
    Path { "statistics" }
    Query {
      Field("fixture", default: 1) { Digits() }
    }
  }
}

