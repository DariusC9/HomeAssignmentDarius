//
//  String extensions.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 10.12.2023.
//

import Foundation

extension String {
    func getInitials() -> String {
        let components = self.components(separatedBy: " ")
        let initialsCaracters = components.compactMap { $0.first }
        let initialsString = String(initialsCaracters)
        let initialsUppercased = initialsString.uppercased()
        return initialsUppercased
    }
    
    func getFirstName() -> String {
        let components = self.components(separatedBy: " ")
        if let firstName = components.first {
            return firstName
        } else {
            return self
        }
    }
    
    func getLastName() -> String {
        let components = self.components(separatedBy: " ")
        if components.count > 1 {
            let lastNameComponents = Array(components.suffix(from: 1))
            return lastNameComponents.joined(separator: " ")
        } else {
            return ""
        }
    }
    
    func formatPhoneNumber() -> String {
        let cleanPhoneNumber = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        var formattedNumber = ""
        
        var index = cleanPhoneNumber.startIndex
        
        for _ in 0..<4 {
            guard index < cleanPhoneNumber.endIndex else { break }
            formattedNumber.append(cleanPhoneNumber[index])
            index = cleanPhoneNumber.index(after: index)
        }
        
        formattedNumber += " "
        
        for _ in 0..<3 {
            guard index < cleanPhoneNumber.endIndex else { break }
            formattedNumber.append(cleanPhoneNumber[index])
            index = cleanPhoneNumber.index(after: index)
        }
        
        formattedNumber += " "
        
        for _ in 0..<3 {
            guard index < cleanPhoneNumber.endIndex else { break }
            formattedNumber.append(cleanPhoneNumber[index])
            index = cleanPhoneNumber.index(after: index)
        }
        
        return formattedNumber
    }
}
