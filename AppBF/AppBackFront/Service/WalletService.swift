//
//  WalletService.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 21/12/22.
//

import Foundation
import Alamofire

protocol WalletServiceDelegate: GenericService {
    func getHome(completion: @escaping completion<WalletData?>)
    func getHomefromJson(completion: @escaping completion<WalletData?>)
}

class WalletService: WalletServiceDelegate {
    
    
    func getHome(completion: @escaping completion<WalletData?>) {
        
        let url: String = "https://run.mocky.io/v3/d1823d68-3355-4d53-8800-2a847b0af2e1"
        
        AF.request( url, method: .get).validate(statusCode: 200...299).responseDecodable(of: WalletData.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getHomefromJson(completion: @escaping completion<WalletData?>) {
        if let url = Bundle.main.url(forResource: "walletData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let menu: WalletData = try JSONDecoder().decode(WalletData.self, from: data)
                completion(menu, nil)
                print("SUCCESS -> \(#function)")
            }catch {
                completion(nil,Error.fileDecodingFailed(name: "data", error))
                print("ERROR -> \(#function)")
            }
        }
    }
}
