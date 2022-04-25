//
//  Coordinator.swift
//  NY-TimesNews
//
//  Created by Yahia Mosaad on 26/01/2022.
//

import Foundation

protocol Coordinator: AnyObject{
    associatedtype T


    var dependencies: T { get }

    func start()
    func finish()
}
