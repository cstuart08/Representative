//
//  RepresentativeController.swift
//  Representative
//
//  Created by Apps on 8/14/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        
        guard let baseURL = URL(string: "https://whoismyrepresentative.com/getall_reps_bystate.php") else {
            completion([])
            return
        }
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let urlQueryItems = URLQueryItem(name: "state", value: state)
        let outputItem = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [urlQueryItems, outputItem]
        
        guard let passedURL = components?.url else {
            completion([])
            return
        }
        
        print(passedURL)
        URLSession.shared.dataTask(with: passedURL) { (data, _, error) in
            if let error = error {
                print("error in URLSession \(error)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("error in guard data = data")
                completion([])
                return
            }
            
            guard let incorrect = String(data: data, encoding: .ascii) else { completion([]); return}
            guard let correctData = incorrect.data(using: .utf8) else { completion([]); return}
            
            do {
                let decoder = JSONDecoder()
                let representativeObjects = try decoder.decode([String: [Representative]].self, from: correctData)
                guard let resultsArray = representativeObjects["results"] else { completion([]); return }
                print("success")
                completion(resultsArray)
            } catch {
                print("error in RepresentativeController URLSessions catch")
                completion([])
            }
            
            
        }.resume()
        
        
    }
    

}
