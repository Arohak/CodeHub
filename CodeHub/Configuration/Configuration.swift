//
//  Configuration.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 27.07.21.
//

import Foundation

public enum Configuration: String {
    case debug
    case release
        
    static let current: Configuration = {
        guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("No Configuration Found")
        }
        
        guard let configuration = Configuration(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Configuration")
        }
        
        return configuration
    }()
}

extension Configuration {
    enum App {
        static var baseUrl: URL {
            switch current {
            case .debug:    return URL(string: "https://my.debugUrl.com")!
            case .release:  return URL(string: "https://my.releaseUrl.com")!
            }
        }
        
        static let bundleIdentifier = "com.public.SwiftHub"
    }
}

extension Configuration {
    enum Mixpanel {
        static let apiKey: String = {
            switch Configuration.current {
            case .debug:    return "7e428bc407e3612f6d3a4c8f50fd4643"
            case .release:  return "9812ndc407e3612f6d3a4c8f50fd4643"
            }
        }()

        static let appId: String = {
            switch Configuration.current {
            case .debug:    return "7e428bc407e3612f6d3a4c8f50fd4643"
            case .release:  return "9812ndc407e3612f6d3a4c8f50fd4643"
            }
        }()
    }
    
    enum AdMob {
        static let apiKey: String = {
            switch Configuration.current {
            case .debug:    return "7e428bc407e3612f6d3a4c8f50fd4643"
            case .release:  return "9812ndc407e3612f6d3a4c8f50fd4643"
            }
        }()
        
        static let appId: String = {
            switch Configuration.current {
            case .debug:    return "7e428bc407e3612f6d3a4c8f50fd4643"
            case .release:  return "9812ndc407e3612f6d3a4c8f50fd4643"
            }
        }()
    }
}

extension Configuration {
    enum Keys {
        case mixpanel
        case adMob
        
        var api: String {
            switch Configuration.current {
            case .debug:
                switch self {
                case .mixpanel: return "7e428bc407e3612f6d3a4c8f50fd4643"
                case .adMob:    return "7e428bc407e3612f6d3a4c8f50fd4643"
                }
            case .release:
                switch self {
                case .mixpanel: return "7e428bc407e3612f6d3a4c8f50fd4643"
                case .adMob:    return "7e428bc407e3612f6d3a4c8f50fd4643"
                }
            }
        }
        
        var appId: String {
            switch Configuration.current {
            case .debug:
                switch self {
                case .mixpanel: return "7e428bc407e3612f6d3a4c8f50fd4643"
                case .adMob:    return "7e428bc407e3612f6d3a4c8f50fd4643"
                }
            case .release:
                switch self {
                case .mixpanel: return "7e428bc407e3612f6d3a4c8f50fd4643"
                case .adMob:    return "7e428bc407e3612f6d3a4c8f50fd4643"
                }
            }
        }
    }
}
