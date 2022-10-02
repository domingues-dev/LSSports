
import Foundation
import SwiftUI
import URLRouting
import LSModels

public enum FootballRoute: Equatable {
  case countries
  case fixtures(FixturesRoute)
  case leagues(LeaguesRoute)
  case standings(StandingsRoute)
  case teams(TeamsRoute)
  case venues(VenuesRoute)
  
#if debug
  case status
#endif
}


public let router = OneOf {
  Route(.case(FootballRoute.countries)) {
    Path { "countries" }
  }
  Route(.case(FootballRoute.fixtures)) {
    Path { "fixtures" }
    fixturesRouter
  }
  Route(.case(FootballRoute.leagues)) {
    Path { "leagues" }
    leaguesRouter
  }
  Route(.case(FootballRoute.standings)) {
    Path { "standings" }
    standingsRouter
  }
  Route(.case(FootballRoute.teams)) {
    Path { "teams" }
    teamsRouter
  }
  Route(.case(FootballRoute.venues)) {
    Path { "venues" }
    venuesRouter
  }
  
#if debug
  Route(.case(FootballRoute.status)) {
    Path { "status" }
  }
#endif
  
}
  .baseURL(FootballRoute.baseUrl)
  .baseRequestData(.init(headers: ["x-apisports-key": [FootballRoute.apiKey]]))



public extension FootballRoute {
  
  static var resourceBundle: Bundle = .module
  
  static func testEndpoint(_ endpoint: String) {
    var semaphore = DispatchSemaphore (value: 0)
    
    var request = URLRequest(url: URL(string: "https://v3.football.api-sports.io/\(endpoint)")!,timeoutInterval: Double.infinity)
    request.addValue(FootballRoute.apiKey, forHTTPHeaderField: "x-apisports-key")
    //    request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
    
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
      print(String(data: data, encoding: .utf8)!)
      semaphore.signal()
    }
    
    task.resume()
    semaphore.wait()
  }
  
  static var apiKey: String {
    get {
      guard let filePath = resourceBundle.path(forResource: "APISportsConfig", ofType: "plist") else {
        fatalError("Couldn't find file 'APISportsConfig.plist'.")
      }
      let plist = NSDictionary(contentsOfFile: filePath)
      guard let value = plist?.object(forKey: "API_KEY") as? String else {
        fatalError("Couldn't find key 'API_KEY' in 'APISportsConfig.plist'.")
      }
      return value
    }
  }
  
  static var baseUrl: String {
    get {
      guard let filePath = resourceBundle.path(forResource: "APISportsConfig", ofType: "plist") else {
        fatalError("Couldn't find file 'APISportsConfig.plist'.")
      }
      // 2
      let plist = NSDictionary(contentsOfFile: filePath)
      guard let urlString = plist?.object(forKey: "BASE_URL") as? String
      else {
        fatalError("Couldn't find key 'BASE_URL' in 'APISportsConfig.plist'.")
      }
      
      return urlString
    }
  }
  
  static var countryFlagURLFormat: String {
    get {
      guard let filePath = resourceBundle.path(forResource: "APISportsConfig", ofType: "plist") else {
        fatalError("Couldn't find file 'APISportsConfig.plist'.")
      }
      // 2
      let plist = NSDictionary(contentsOfFile: filePath)
      guard let value = plist?.object(forKey: "COUNTRY_FLAG_URL_FORMAT") as? String
      else {
        fatalError("Couldn't find key 'COUNTRY_FLAG_URL_FORMAT' in 'APISportsConfig.plist'.")
      }
      return value
    }
  }
}
