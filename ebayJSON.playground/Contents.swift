//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://restcountries-v1.p.mashape.com/all")!
var request = URLRequest(url: url)
request.httpMethod = "GET"
request.addValue("1IosQYQKu0mshuIZjcqiIXbiLGJSp1dBB9Yjsnfd2aISWLA7Yk", forHTTPHeaderField: "X-Mashape-Key")
request.addValue("application/json", forHTTPHeaderField: "Accept")

let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    if let data = data,
        let json = try? JSONSerialization.jsonObject(with: data),
        let dict = json as? [[String: Any]] {
        //print(dict)
    }
}
task.resume()
