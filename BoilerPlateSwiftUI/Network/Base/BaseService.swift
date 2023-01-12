//
//  BaseService.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 10.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class BaseService: BaseServiceProtocol {
    var session: URLSessionProtocol = URLSession.shared
    var decoder: JSONDecoder = JSONDecoder()
}
