//
//  DatabaseApiService.swift
//  ECHO
//
//  Created by Fedorenko Nikita on 18.07.2018.
//  Copyright © 2018 PixelPlex. All rights reserved.
//

/**
    Encapsulates logic, associated with blockchain database API
 
    [Graphene blockchain database API](https://dev-doc.myecho.app/classgraphene_1_1app_1_1database__api.html)
 */
protocol DatabaseApiService: BaseApiService {
    
/**
    Get the objects corresponding to the provided IDs.
     
    - Parameter objectsIds: IDs of the objects to retrieve
    - Parameter completion: Callback which returns current block data or error
 */
    func getObjects<T>(type: T.Type, objectsIds: [String], completion: @escaping Completion<[T]>) where T: Decodable
    
/**
     Retrieve the current global property object.
     
     - Parameter completion: Callback which returns [GlobalProperties](GlobalProperties) or error
 */
    func getGlobalProperties(completion: @escaping Completion<GlobalProperties>)
    
/**
     Retrieves base block information

     - Parameter completion: Callback which returns current block data or error
 */
    func getBlockData(completion: @escaping Completion<BlockData>)
    
/**
    Retrieves full signed block

     - Parameter blockNumber: Height of the block to be returned
     - Parameter completion: Callback which returns Block or error
 */
    func getBlock(blockNumber: Int, completion: @escaping Completion<Block>)
    
/**
     Retrieves blockchain chain id
     
     - Parameter completion: Callback which returns chain id string or error
 */
    func getChainId(completion: @escaping Completion<String>)
    
/**
     Fetch all objects relevant to the specified accounts and subscribe to updates.
     
     - Parameter nameOrIds: Each item must be the name or ID of an account to retrieve
     - Parameter shoudSubscribe: Flag for subscribe options, true if need to subscribe on changes
     - Parameter completion: Callback which returns accounts or error
 */
    func getFullAccount(nameOrIds: [String], shoudSubscribe: Bool, completion: @escaping Completion<[String: UserAccount]>)

/**
     Fetch all account id relevant to the specified keys.
     
     - Parameter keys: Public keys of account for search
     - Parameter completion: Callback which returns array of arrays of id for each key or error
 */
    func getKeyReferences(keys: [String], completion: @escaping Completion<[[String]]>)
/**
    Retrieves required fee by asset for ech operation

     - Parameter operations: Operations for getting fee
     - Parameter asset: Asset type for fee paying
     - Parameter completion: Callback which returns amounts or error
 */
    func getRequiredFees(operations: [BaseOperation], asset: Asset, completion: @escaping Completion<[FeeType]>)
    
/**
     Subscribes to listening chain objects

     - Parameter completion: Callback which returns status of subscription
 */
    func setSubscribeCallback(completion: @escaping Completion<Bool>)
    
/**
     Subscribes to listening chain objects
     
     - Parameter completion: Callback which returns status of subscription
 */
    func setBlockAppliedCallback(blockId: String, completion: @escaping Completion<Bool>)
    
/**
     Query list of assets by it's ids [assetIds]
     
     - Parameter assetIds: Assets Ids for getting information
     - Parameter completion: Callback which returns [[Asset](Asset)] or error
 */
    func getAssets(assetIds: [String], completion: @escaping Completion<[Asset]>)
    
/**
     Query list of assets by required asset symbol [lowerBound] with limit [limit]
     
     - Parameter lowerBound: Id of aseet used as lower bound
     - Parameter limit: Count of getting assets
     - Parameter completion: Callback which returns [[Asset](Asset)] or error
 */
    func listAssets(lowerBound: String, limit: Int, completion: @escaping Completion<[Asset]>)
    
/**
     Return result of contract operation call
     
     - Parameter contractResultId: Contract result id
     - Parameter completion: Callback which returns [ContractResultEnum](ContractResultEnum) or error
 */
    func getContractResult(contractResultId: String, completion: @escaping Completion<ContractResultEnum>)
    
/**
    Return list of contract logs
     
     - Parameter contractId: Contract id for fetching logs
     - Parameter fromBlockId: Number of the earliest block to retrieve
     - Parameter toBlockId: Number of the most recent block to retrieve
     - Parameter completion: Callback which returns an array of [ContractLog](ContractLog) result of call or error
 */
    func getContractLogs(contractId: String, fromBlock: Int, toBlock: Int, completion: @escaping Completion<[ContractLog]>)
    
/**
     Subscribes to listening contract logs
     
     - Parameter contractId: Contract id for fetching logs
     - Parameter fromBlockId: Number of the earliest block to retrieve
     - Parameter toBlockId: Number of the most recent block to retrieve
     - Parameter completion: Callback which returns an array of [ContractLog](ContractLog) result of call or error
 */
    func subscribeContractLogs(contractId: String, fromBlock: Int, toBlock: Int, completion: @escaping Completion<[ContractLog]>)
/**
     Returns contracts called by ids
     
     - Parameter contractIds: Contracts ids for call
     - Parameter completion: Callback which returns an [[ContractInfo](ContractInfo)] or error
 */
    func getContracts(contractIds: [String], completion: @escaping Completion<[ContractInfo]>)
    
/**
     Return full information about contract
     
     - Parameter contractId: Identifier for contract
     - Parameter completion: Callback which returns an [ContractStructEnum](ContractStructEnum) or error
 */
    func getContract(contractId: String, completion: @escaping Completion<ContractStructEnum>)
    
/**
     Calls contract method without changing state of blockchain
     
     - Parameter contract: Called contract
     - Parameter asset: Asset of contract
     - Parameter account: Account that call the contract
     - Parameter contractCode: Contract code for execute
     - Parameter completion: Callback which returns an [Bool](Bool) result of call or error
 */
    func callContractNoChangingState(contract: Contract,
                                     asset: Asset,
                                     account: Account,
                                     contractCode: String,
                                     completion: @escaping Completion<String>)
    
/**
     Subscribes to listening contracts changes
     
     - Parameter contractsIds: Contracts ids for subscribe
     - Parameter completion: Callback which [Bool](Bool) as result of call or error
 */
    func subscribeContracts(contractsIds: [String], completion: @escaping Completion<Bool>)
    
/**
     Get created ETH addresses
     
     - Parameter accountId: Accoint id
     - Parameter completion: Callback in which the information will return [EthAddress](EthAddress) object if it created or error
 */
    func getEthAddress(accountId: String,
                       completion: @escaping Completion<EthAddress?>)
    
/**
     Returns all approved deposits, for the given account id.
     
     - Parameter accountId: Accoint id
     - Parameter completion: Callback in which return Deposits objects or error.
 */
    func getAccountDeposits(accountId: String,
                            completion: @escaping Completion<[DepositEth]>)
    
/**
     Returns all approved withdrawals, for the given account id.
     
     - Parameter accountId: Accoint id
     - Parameter completion: Callback in which return Withdrawals objects or error.
 */
    func getAccountWithdrawals(accountId: String,
                               completion: @escaping Completion<[WithdrawalEth]>)
}
