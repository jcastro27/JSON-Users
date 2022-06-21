//
//  APIHandler.swift
//  JSON1.2
//
//  Created by Joseph Castro on 6/21/22.
//

import Foundation
class APIHandler {
    
    static let shared = APIHandler.init()
    var delegate : DataPassingDelegate?
    private init() {}
    
    func getData() {
        
        guard let url = URL.init(string: strUrlTodos) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, errorRespose in
            print("2")

            
            if data != nil && errorRespose == nil {
                let j = JSONDecoder.init()
                
                do {
                    let arr = try j.decode([WelcomeElement].self, from: data!)
                    DispatchQueue.main.async {
                        self.delegate?.getServiceData(arr: arr, error: errorRespose)
                    }
                    
                } catch (let decodeError){
                    self.delegate?.getServiceData(arr: nil, error: decodeError)
                }
            } else {
                self.delegate?.getServiceData(arr: nil, error: errorRespose)

            }
        }.resume()
        
        print("1")
    }
}


protocol DataPassingDelegate {
    func getServiceData(arr: [WelcomeElement]?, error: Error?)
}

