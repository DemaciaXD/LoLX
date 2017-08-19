//
//  WGLolAPI.swift
//  LOLX
//
//  Created by V on 2017/8/14.
//  Copyright © 2017年 com.fengxian. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider setup

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

let LolProvider = MoyaProvider<LOLX>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum LOLX {
    case myHeros(String, String);
}

extension LOLX: TargetType {
    public var baseURL: URL { return URL(string: "http://115.28.43.55/lol/index.php/MyHeros/execute/target/")! }
    public var path: String {
        switch self {
        case .myHeros(let userName, let serverName):
            return "\(userName)/serverName/\(serverName)";
        }
    }
    public var method: Moya.Method {
        return .get
    }
    public var parameters: [String: Any]? {
        switch self {
        case .myHeros(_, _):
            return nil;
        }
    }
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    public var task: Task {
        return .request
    }
    public var validate: Bool {
        switch self {
        case .myHeros(_, _):
            return true
        }
    }
    public var sampleData: Data {
        switch self {
        case .myHeros:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!;
        }
    }
    public var headers: [String: String]? {
        return nil
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

//MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}





















