//
//  Usecase.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

protocol Usecase {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) async -> Result<Output, Error>
}
