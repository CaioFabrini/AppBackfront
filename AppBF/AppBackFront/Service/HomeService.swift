//
//  HomeService.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 03/12/22.
//

import Foundation
import Alamofire

protocol HomeServiceDelegate: GenericService {
    func getHome(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate {
    
    func getHome(completion: @escaping completion<NFTData?>) {
        let url: String = "https://api.blockspan.com/v1/nfts?chain=eth-main&page_size=100"
        let headers: HTTPHeaders? = ["X-API-KEY":"8xtCpoK5cBUtLMzoBmh4MOo6w3ky5A44"]
        
        AF.request( url, method: .get, headers: headers).validate().responseDecodable(of: NFTData.self) { response in
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
}

