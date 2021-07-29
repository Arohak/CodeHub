//
//  URL+Ext.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 11/11/20.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: StaticString) {
        self.init(string: "\(value)")!
    }
}
