//
//  ContractLog.swift
//  ECHO
//
//  Created by Vladimir Sharaev on 19/11/2018.
//  Copyright © 2018 PixelPlex. All rights reserved.
//

/**
    Represents Contract Log object from blockchain
 */
public struct ContractLog: Decodable {
    
    private enum ContractLogCodingKeys: String, CodingKey {
        case address
        case calledMethodsHashes = "log"
        case data
    }
    
    public let address: String
    public let calledMethodsHashes: [String]
    public let data: String
    
    public init(address: String, calledMethodsHashes: [String], data: String) {
        
        self.address = address
        self.calledMethodsHashes = calledMethodsHashes
        self.data = data
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: ContractLogCodingKeys.self)
        address = try values.decode(String.self, forKey: .address)
        calledMethodsHashes = try values.decode([String].self, forKey: .calledMethodsHashes)
        data = try values.decode(String.self, forKey: .data)
    }
}
