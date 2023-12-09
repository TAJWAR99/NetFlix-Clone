//
//  Extensions.swift
//  Netflix_Clone
//
//  Created by Sihan on 30/11/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased()+self.lowercased().dropFirst()
    }
}
