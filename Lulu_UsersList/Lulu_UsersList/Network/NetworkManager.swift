//
//  NetworkManager.swift
//  Lulu_UsersList
//
//  Created by E5000416 on 28/04/21.
//

import Foundation
import UIKit
import Alamofire

class NetworkManager {
    static let sharedInstance = NetworkManager()
    static let usersList = "https://reqres.in/api/users?"
    func getUsers(_ completion: ((Users?) -> Void)?) {
        Alamofire.request(NetworkManager.usersList, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print(value)
                guard let data = response.data else {
                    if let closure = completion {
                        closure(nil)
                    }
                    return
                }
                do{
                    let contacts = try JSONDecoder().decode(Users.self, from: data)
                    if let closure = completion {
                        closure(contacts)
                    }
                    
                } catch {
                    print("Error:", error.localizedDescription)
                    if let closure = completion {
                        closure(nil)
                    }

                }
            case .failure(let error):
                print(error.localizedDescription)
                if let closure = completion {
                    closure(nil)
                }
            }
        }
    }
    
    
    /// Downloads data for provided URL
    /// - Parameters:
    ///   - url: URL of the image
    ///   - completion: Closure for returning the image
    /// - Returns: returns UIImage object for the provided URL
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let img = UIImage(data: data)
            completion(img)
        }.resume()
    }
}
