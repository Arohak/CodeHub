//
//  Strings.swift
//  App
//
//  Created by Stefano Mondino on 02/12/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation

public protocol Translation: CustomStringConvertible {
    var key: String { get }
}

public extension Translation where Self: RawRepresentable, RawValue == String {
    var key: String { rawValue }
    var description: String { Vocabulary.translation(for: self) }
    func format(with arguments: String) -> String {
        String(format: description, arguments)
    }

    func format(with arguments: [String]) -> String {
        String(format: description, arguments)
    }
}

private class Vocabulary {
    private static var dictionary: [String: Any] = {
        do {
            let bundle = Bundle(for: Vocabulary.self)
            guard let json = bundle.url(forResource: "Translations", withExtension: "json") else { return [:] }
            let data = try Data(contentsOf: json)
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
        } catch {
            return [:]
        }
    }()

    static func translation(for string: Translation) -> String {
        dictionary.valueForKeyPath(keyPath: string.key) as? String ?? string.key
    }
}

private extension Dictionary {
    func valueForKeyPath(keyPath: String, withDelimiter delimiter: String = ".") -> Any? {
        let keys = keyPath.components(separatedBy: delimiter)

        guard let key = keys.first as? Key,
              let value = self[key]
        else {
            return nil
        }
        if let string = value as? String {
            return string
        }
        if let dictionary = value as? Dictionary {
            return dictionary.valueForKeyPath(keyPath: keys.dropFirst().joined(separator: delimiter), withDelimiter: delimiter)
        }
        return nil
    }
}
