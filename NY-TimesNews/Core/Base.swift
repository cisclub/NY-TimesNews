//
//  Base.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 26/04/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    associatedtype InputType
    associatedtype UseCaseType
    associatedtype ActionsType
    associatedtype ViewModelType: ViewModel<UseCaseType, ActionsType>

    
    var input: InputType { get }
    var viewModel: ViewModelType { get }

    
    init(input: InputType, viewModel: ViewModelType)
    
    func start()
}


protocol UseCase {
    associatedtype InputType
    associatedtype OutputType
    associatedtype RepoType
    
    var repo: RepoType? { get }

    func execute(_ input: InputType?, finishHandler:(OutputType) -> ())
}


protocol Repository {
    associatedtype Input
    associatedtype Output
    
    
    var network : HTTPClient { get }
    
    func execute(input: Input, finishHandler: (Output) -> ())
}

class ViewModel<UseCaseType, ActionsType> {
    let viewController: UIViewController? = nil
    let actions: ActionsType?
    let useCases: UseCaseType?
    
    init(actions: ActionsType?, useCases: UseCaseType?) {
        self.actions = actions
        self.useCases = useCases
    }
}

protocol BasicViewController {
    associatedtype UseCaseType
    associatedtype ActionsType
    associatedtype ViewModelType: ViewModel<UseCaseType, ActionsType>
    
    static func instanceFromStoryboard<T>(withViewModel viewModel: ViewModelType) -> T where T: BaseViewController<UseCaseType, ActionsType, ViewModelType>
}

class BaseViewController<U, A, VM: ViewModel<U, A>>: UIViewController, BasicViewController {
    static func instanceFromStoryboard<T>(withViewModel viewModel: VM) -> T where T : BaseViewController<U, A, VM> {
        let storyboard = UIStoryboard(name: "\(Self.self)Storyboard", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! T
        viewController._viewModel = viewModel
        
        return viewController
    }
    
    typealias UseCaseType = U
    typealias ActionsType = A
    typealias ViewModelType = VM
    
    
    private var _viewModel: VM?
    var viewModel: VM {
        get {
            return _viewModel!
        }
    }
}
