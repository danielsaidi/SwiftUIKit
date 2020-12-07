//
//  Color+Demo.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

extension UIColor {
    
    static var accent: UIColor {
        UIColor(named: "AccentColor") ?? .black
    }
}
#endif
