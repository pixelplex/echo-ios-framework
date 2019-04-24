//
//  Block.swift
//  ECHO
//
//  Created by Vladimir Sharaev on 24.08.2018.
//  Copyright © 2018 PixelPlex. All rights reserved.
//

/**
    Represents block model in Graphene blockchain
 
    [Block model documentations](https://dev-doc.myecho.app/structgraphene_1_1chain_1_1signed__block.html)
 */
public struct Block: Decodable {
    
    enum BlockCodingKeys: String, CodingKey {
        case previous
        case timestamp
        case witness
        case transactionMerkleRoot = "transaction_merkle_root"
        case witnessSignature = "witness_signature"
        case transactions
        case round
    }
    
    public let previous: String
    public let timestamp: String
    public let witness: String
    public let transactionMerkleRoot: String
    public let witnessSignature: String
    public let transactions: [Transaction]
    public let round: Int
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: BlockCodingKeys.self)
        previous = try values.decode(String.self, forKey: .previous)
        timestamp = try values.decode(String.self, forKey: .timestamp)
        witness = try values.decode(String.self, forKey: .witness)
        transactionMerkleRoot = try values.decode(String.self, forKey: .transactionMerkleRoot)
        witnessSignature = try values.decode(String.self, forKey: .witnessSignature)
        transactions = try values.decode([Transaction].self, forKey: .transactions)
        round = try values.decode(Int.self, forKey: .round)
    }
}
