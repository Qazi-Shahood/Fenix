//
//  Globals+Fenix.swift
//  FenixAssignment
//
//  Created by Q.M.S on 01/04/2022.
//

import Foundation
import UIKit

func log(_ message: Any, _ file: String = #file, _ line: Int = #line, _ function: String = #function, isWriteToFile: Bool = false) {
    #if DEBUG || STAGING
    debugPrint("[\(file):\(line)] \(function)\n", message)
    #endif
}

let apiKey = "b952b40ac071812f86bb9f995ce07f52"
let posterBaseUrl = "https://image.tmdb.org/t/p/w220_and_h330_face"

let screenSize = UIScreen.main.bounds
