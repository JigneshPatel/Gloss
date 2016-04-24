//
//  Alamofire+Gloss.swift
//  Gloss
//
// Copyright (c) 2016 Harlan Kellaway
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Alamofire
import Foundation

/**
 Alamofire network request manager used for requests.
 
 :parameter: Alamofire network request manager used for requests.
 */
public private(set) var GlossAlamofireNetworkRequestManager: NetworkRequestManager = {
    return AlamofireNetworkRequestManager()
}()

/**
 Convenience function for making a network request.
 
 :parameter: method     Method.
 :parameter: urlString  URL string.
 :parameter: parameters Parameters.
 :parameter: headers    Headers.
 :parameter: completion Function called on completion.
 */
public func request<T: Decodable>(
    method: HTTPMethod,
    _ URLString: URLStringConvertible,
      parameters: [String: AnyObject]? = nil,
      headers: [String: String]? = nil,
      completion: Alamofire.Result<T, NSError> -> ())
{
    let requestCompletion: Gloss.Result<T> -> () = {
        result in
        
        switch result {
        case Gloss.Result.Success(let value):
            completion(Alamofire.Result.Success(value))
        case Gloss.Result.Failure(let error):
            completion(Alamofire.Result.Failure(error as NSError))
        }
    }
    
    request(method, URLString.URLString, completion: requestCompletion)
}

/**
 Convenience function for making a network request.
 
 :parameter: method     Method.
 :parameter: urlString  URL string.
 :parameter: parameters Parameters.
 :parameter: headers    Headers.
 :parameter: completion Function called on completion.
 */
public func request<T: Decodable>(
    method: HTTPMethod,
    _ URLString: URLStringConvertible,
      parameters: [String: AnyObject]? = nil,
      headers: [String: String]? = nil,
      completion: Alamofire.Result<[T], NSError> -> ())
{
    let requestCompletion: Gloss.Result<[T]> -> () = {
        result in
        
        switch result {
        case Gloss.Result.Success(let value):
            completion(Alamofire.Result.Success(value))
        case Gloss.Result.Failure(let error):
            completion(Alamofire.Result.Failure(error as NSError))
        }
    }
    
    request(method, URLString.URLString, completion: requestCompletion)
}

/**
 Convenience function for making a network request.
 
 :parameter: method     Method.
 :parameter: urlString  URL string.
 :parameter: parameters Parameters.
 :parameter: headers    Headers.
 :parameter: completion Function called on completion.
 */
public func request<T: Decodable>(
    method: HTTPMethod,
    _ URLString: String,
      parameters: [String: AnyObject]? = nil,
      headers: [String: String]? = nil,
      completion: Gloss.Result<T> -> ())
{
    GlossAlamofireNetworkRequestManager.request(method, URLString: URLString, parameters: parameters, headers: headers, completion: completion)
}

/**
 Convenience function for making a network request.
 
 :parameter: method     Method.
 :parameter: urlString  URL string.
 :parameter: parameters Parameters.
 :parameter: headers    Headers.
 :parameter: completion Function called on completion.
 */
public func request<T: Decodable>(
    method: HTTPMethod,
    _ URLString: String,
      parameters: [String: AnyObject]? = nil,
      headers: [String: String]? = nil,
      completion: Gloss.Result<[T]> -> ())
{
    GlossAlamofireNetworkRequestManager.request(method, URLString: URLString, parameters: parameters, headers: headers, completion: completion)
}
