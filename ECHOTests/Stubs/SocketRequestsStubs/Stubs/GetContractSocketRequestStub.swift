//
//  GetContractSocketRequestStub.swift
//  ECHOTests
//
//  Created by Vladimir Sharaev on 10/04/2019.
//  Copyright © 2019 PixelPlex. All rights reserved.
//

struct GetContractSocketRequestStub: SocketRequestStub {
    
    var operationType = "get_contract"
    
    func createResponce(id: Int) -> String {
        return """
        {"id":\(id),"jsonrpc":"2.0","result":[0,{"code":"6080604052600436106053576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680635b34b966146058578063a87d942c14606c578063f5c5ad83146094575b600080fd5b348015606357600080fd5b50606a60a8565b005b348015607757600080fd5b50607e60ba565b6040518082815260200191505060405180910390f35b348015609f57600080fd5b5060a660c3565b005b60016000808282540192505081905550565b60008054905090565b600160008082825403925050819055505600a165627a7a7230582063e27ea8b308defeeb50719f281e50a9b53ffa155e56f3249856ef7eafeb09e90029","storage":[["290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563",["00","01"]]]}]}
        """
    }
}
