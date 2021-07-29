//
//  Coordinator.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import UIKit

protocol Coordinator {
    var childs: [Coordinator] { get set }
    
    func start()
}
