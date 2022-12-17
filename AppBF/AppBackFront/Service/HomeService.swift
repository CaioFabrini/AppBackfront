//
//  HomeService.swift
//  AppBackFront
//
//  Created by Barbara Brigolin on 03/12/22.
//

import Foundation
import Alamofire

protocol HomeServiceDelegate: GenericService {
    func getHome(completion: @escaping completion<NFTHomeData?>)
    func getHomefromJson(completion: @escaping completion<NFTHomeData?>)
}

class HomeService: HomeServiceDelegate {
    
    func getHome(completion: @escaping completion<NFTHomeData?>) {
        
        let url: String = "https://run.mocky.io/v3/43a9a9d0-51c3-49e0-8ebb-abd7497659f6"
        
        AF.request( url, method: .get).validate().responseDecodable(of: NFTHomeData.self) { response in
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
    
    func getHomefromJson(completion: @escaping completion<NFTHomeData?>) {
        if let url = Bundle.main.url(forResource: "homeData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let menu: NFTHomeData = try JSONDecoder().decode(NFTHomeData.self, from: data)
                completion(menu, nil)
                print("SUCCESS -> \(#function)")
            }catch {
                completion(nil,Error.fileDecodingFailed(name: "data", error))
                print("ERROR -> \(#function)")
            }
        }
    }
}

