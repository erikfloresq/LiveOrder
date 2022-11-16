//
//  DeviceToken.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import Foundation

struct DeviceToken {
    enum Failure: Error {
        case invalidHexString
    }
    var data: Data
    var hexString: String {
        let result = data.map { String(format: "%02x", $0) }.joined().uppercased()
        return result
    }

    init(data: Data) {
        self.data = data
    }

    init(hexString: String) throws {
        if hexString.count % 2 != 0 {
            throw Failure.invalidHexString
        }
        let length = 2
        let end = hexString.count/length
        let range = 0..<end
        let transformHex: (Int) -> String = {
            String(hexString.dropFirst($0 * length).prefix(length))
        }
        let transformByte: (String) throws -> UInt8 = {
            guard let value = UInt8($0, radix: 16) else {
                throw Failure.invalidHexString
            }
            return value
        }
        let bytes = try range.map(transformHex).map(transformByte)
        let data = Data(bytes)
        self.data = data
    }
}
