import Foundation

enum Either<V,E : Error> {
    case value(V)
    case error(E)
}
enum APIError: Error {
    case apiError
    case badResponse
    case jsonDecoder
    case unknown(String)
    
}

protocol APIClient {
    var session: URLSession { get }
    func fetch<V: Codable>(with request: URLRequest, completion: @escaping (Either<V, APIError>) -> Void)
}

extension APIClient {
    func fetch<V: Codable>(with request: URLRequest, completion: @escaping (Either<V, APIError>) -> Void) {
        let task = session.dataTask(with: request) { (data, responce, error) in
            guard error == nil else {
                completion(.error(.apiError));
                return
            }
            guard let responce = responce as? HTTPURLResponse, 200..<300 ~= responce.statusCode else {
                completion(.error(.badResponse))
                return
            }
            guard let value = try? JSONDecoder().decode(V.self, from: data!) else {
                completion(.error(.jsonDecoder))
                return
            }
            completion(.value(value))
        }
        task.resume()
    }
}
