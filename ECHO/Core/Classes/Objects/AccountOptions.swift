//
//  AccountOptions.swift
//  ECHO
//
//  Created by Vladimir Sharaev on 17.08.2018.
//  Copyright © 2018 PixelPlex. All rights reserved.
//

struct AccountOptions: ECHOCodable, Decodable {
    
    enum AccountOptionsCodingKeys: String, CodingKey {
        case memo = "memo_key"
        case committee = "num_committee"
        case witness = "num_witness"
        case votes
        case votingAccount = "voting_account"
        case extensions
    }
    
    let memo: Address
    var votingAccount: Account
    var witnessCount: Int = 0
    var committeeCount: Int = 0
    var votes: [Vote] = [Vote]()
    
    private var extensions = Extensions()
    
    init(memo: Address, votingAccount: Account) {
        self.memo = memo
        self.votingAccount = votingAccount
    }
    
    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: AccountOptionsCodingKeys.self)
        
        let memoString = try values.decode(String.self, forKey: .memo)
        memo = Address(memoString)
        
        let voitingAccountIdString = try values.decode(String.self, forKey: .votingAccount)
        votingAccount = Account(voitingAccountIdString)
        
        witnessCount = try values.decode(Int.self, forKey: .witness)
        committeeCount = try values.decode(Int.self, forKey: .committee)
    }
    
    // MARK: ECHOCodable
    
    func toJSON() -> Any? {
        
        var votesArray = [Any]()
        votes.forEach {
            if let voteJSON: Any = $0.toJSON() {
                votesArray.append(voteJSON)
            }
        }
        
        let dictionary: [AnyHashable: Any?] = [AccountOptionsCodingKeys.memo.rawValue: memo.addressString,
                                               AccountOptionsCodingKeys.committee.rawValue: committeeCount,
                                               AccountOptionsCodingKeys.witness.rawValue: witnessCount,
                                               AccountOptionsCodingKeys.votingAccount.rawValue: votingAccount.id,
                                               AccountOptionsCodingKeys.votes.rawValue: votesArray,
                                               AccountOptionsCodingKeys.extensions.rawValue: extensions.toJSON()]
        
        return dictionary
    }
    
    func toData() -> Data? {
        
        var data = Data()
        data.append(1)
        data.append(optional: memo.toData())
        
        data.append(optional: votingAccount.toData())
        
        data.append(Data.fromInt16(witnessCount))
        
        data.append(Data.fromInt16(committeeCount))

        let votesData = Data.fromArray(votes) {
            return $0.toData()
        }
        data.append(votesData)
        
        data.append(optional: extensions.toData())
        
        return data
    }
}