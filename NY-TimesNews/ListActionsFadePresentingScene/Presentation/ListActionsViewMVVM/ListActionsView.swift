//
//  
//  ListActionsView.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//


import Foundation


class ListActionsView: UIView, MVVM {
    typealias ViewModelType = ListActionsViewModel
    
    
    var viewModel: ViewModelType?
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var tableViewHeight: NSLayoutConstraint!
    
    
    class func instance(withModel viewModel: ViewModelType) -> ListActionsView {
        let nibName = "ListActionsView"
        let view = Bundle.main.loadNibNamed(nibName, owner: nil)!.first as! ListActionsView
        view.viewModel = viewModel
        
        view.tableView.delegate = view.viewModel
        view.tableView.dataSource = view.viewModel
        view.viewModel?.registerCells(inTableView: view.tableView)
        view.tableView.backgroundColor = view.viewModel?.backgroundColor
        view.tableView.isScrollEnabled = false
        if let model = view.viewModel {
            view.tableViewHeight.constant = model.tableViewHeight
        }
        
        return view
    }
}


class ListActionsViewModel: NSObject, ViewModel {
    typealias UseCasesType = ListActionsViewUseCases?
    typealias ActionsType = ListActionsViewActions?
    typealias ViewType = UIViewController
    
    
    var view: UIViewController?
    let useCases: UseCasesType
    let actions: ActionsType
    let dataSource: [StandardCellModel]
    let backgroundColor: UIColor
    let tableViewHeight: CGFloat
    
    
    init(useCases: UseCasesType,
         actions: ActionsType,
         dataSource: [StandardCellModel],
         backgroundColor: UIColor,
         tableViewHeight: CGFloat)
    {
        self.useCases = useCases
        self.actions = actions
        self.view = nil
        self.dataSource = dataSource
        self.backgroundColor = backgroundColor
        self.tableViewHeight = tableViewHeight
    }
    
    func registerCells(inTableView tableView: UITableView) {
        for cellModel in dataSource {
            tableView.register(UINib(nibName: cellModel.reusableIdentifier(),
                                     bundle: nil),
                               forCellReuseIdentifier: cellModel.reusableIdentifier())
        }
    }
}

extension ListActionsViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        let id = model.reusableIdentifier()
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as! StandardCell
        if model !== cell.viewModel {
            cell.viewModel = model
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        model.actions?.cellSelected(indexPath.row)
        
    }
}


struct ListActionsViewUseCases {
}


struct ListActionsViewActions {
}

