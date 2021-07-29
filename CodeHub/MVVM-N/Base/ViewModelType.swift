//
//  ViewModelType.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
