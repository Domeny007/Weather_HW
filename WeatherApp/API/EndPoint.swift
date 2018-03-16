import Foundation

protocol EndPoint{
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}
extension EndPoint {
    var urlComponent: URLComponents {
        var component = URLComponents(string: baseURL)
        component?.path = path
        component?.queryItems = queryItems
        
        return component!
    }
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
    
}
enum WeatherEndPoint: EndPoint {
    case forecast(city: String, state: String)
    
    var baseURL: String {
        return "http://api.wunderground.com"
    }
    var path: String {
        switch self {
        case .forecast(let city,let state):
            return "/api/b72be8b94893c726/forecast/q/\(state)/\(city).json"
        }
    }
    var queryItems: [URLQueryItem] {
        return []
    }
}
