//
//  URLSession+Extentions.swift
//  TinyNetworking
//
//  Created by Joan Disho on 07.04.18.
//  Copyright © 2018 Joan Disho. All rights reserved.
//

import Foundation

public protocol TinyNetworkingSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    func loadData(
        with urlRequest: URLRequest,
        completionHandler: @escaping CompletionHandler
        ) -> URLSessionDataTask
}

extension URLSession: TinyNetworkingSession {
    public func loadData(
        with urlRequest: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
        ) -> URLSessionDataTask {
        let task = dataTask(with: urlRequest, completionHandler: completionHandler)
        task.resume()

        return task
    }
}
