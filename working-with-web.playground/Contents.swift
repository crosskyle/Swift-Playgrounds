//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct PropertyKey {
    static let title = "title"
    static let description = "explanation"
    static let url = "url"
    static let copyright = "copyright"
}

struct PhotoInfo {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    init?(json: [String: Any]) {
        guard let title = json[PropertyKey.title] as? String,
            let description = json[PropertyKey.description] as? String,
            let urlString = json[PropertyKey.url] as? String,
            let url = URL(string: urlString) else { return nil }
        
        self.title = title
        self.description = description
        self.url = url
        self.copyright = json[PropertyKey.copyright] as? String
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}


func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    let query: [String: String] = [
        "api_key": "VkS9fHPGnPIyv88e67sdUi2GZxulh8x4VnZXQK7A",
        ]
    
    let url = baseURL.withQueries(query)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if let data = data,
            let rawJSON = try? JSONSerialization.jsonObject(with: data),
            let json = rawJSON as? [String: String],
            let photoInfo = PhotoInfo(json: json) {
            
                completion(photoInfo)
        }
        else {
            print("Operation not successful")
            completion(nil)
        }
    }
    
    task.resume()
}

fetchPhotoInfo(completion: { (fetchedInfo) in
    if let info = fetchedInfo {
        print(info)
    }
})

