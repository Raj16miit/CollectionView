//
//  DateReadFile.swift
//  Demo
//
//  Created by Rajkumar on 19/01/23.
//

import Foundation

func loadJson(fileName: String) -> Welcome? {
   let decoder = JSONDecoder()
   guard
        let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
        let data = try? Data(contentsOf: url),
        let person = try? decoder.decode(Welcome.self, from: data)
   else {
        return nil
   }

   return person
}
