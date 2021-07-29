//
//  SignedInViewControllerState.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 11.07.21.
//

import Foundation

public struct SignedInViewControllerState: Equatable {
  public internal(set) var viewState: SignInViewState
  public internal(set) var errorsToPresent: [String]
}
