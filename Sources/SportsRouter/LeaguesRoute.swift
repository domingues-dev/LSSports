//
//  LeaguesRoute.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation
import SwiftUI
import URLRouting
import LSModels

public enum LeaguesRoute: Equatable {
  case withOptions(LeagueSearchOptions)
  case fetch
  case search(String)
}

let leaguesRouter = OneOf {
  Route(.case(LeaguesRoute.fetch))
  Route(.case(LeaguesRoute.search)) {
    Query {
      Field("search", .string, default: "")
    }
  }
  Route(.case(LeaguesRoute.withOptions)) {
    Parse(.memberwise(LeagueSearchOptions.init)) {
      Query {
        Field("code", .string, default: "")
        Field("type") { LeagueType.parser() }
      }
    }
  }
}
