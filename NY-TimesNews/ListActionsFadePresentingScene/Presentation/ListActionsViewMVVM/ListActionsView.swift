//
//  
//  ListActionsView.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//


import Foundation


class ListActionsView: UIStackView, MVVM {
    typealias ViewModelType = ListActionsViewModel
    
    
    var viewModel: ViewModelType?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    
    class func instance(withModel viewModel: ViewModelType) -> ListActionsView {
        let nibName = "ListActionsView"
        let view = Bundle.main.loadNibNamed(nibName, owner: nil)!.first as! ListActionsView
        
        viewModel.view = view
        view.viewModel = viewModel
        view.tableView.delegate = view.viewModel
        view.tableView.dataSource = view.viewModel
        view.viewModel?.setupTableView()
        
        return view
    }
}


class ListActionsViewModel: NSObject, ViewModel {
    typealias UseCasesType = ListActionsViewUseCases?
    typealias ActionsType = ListActionsViewActions?
    typealias ViewType = ListActionsView
    
    
    var view: ListActionsView?
    let useCases: UseCasesType
    let actions: ActionsType
    let dataSource: [StandardCellModel]
    let backgroundColor: UIColor
    let presentingViewControllerHeight: CGFloat
    let tableViewTopMargin = 300.0
    
    
    init(useCases: UseCasesType,
         actions: ActionsType,
         dataSource: [StandardCellModel],
         backgroundColor: UIColor,
         presentingViewControllerHeight: CGFloat)
    {
        self.useCases = useCases
        self.actions = actions
        self.view = nil
        self.dataSource = dataSource
        self.backgroundColor = backgroundColor
        self.presentingViewControllerHeight = presentingViewControllerHeight
    }
    
    func setupTableView() {
        let rowHeight = 65.0
        let bottomMargin = 64.0
        let actualHeight = (CGFloat(dataSource.count) * rowHeight) + bottomMargin
        let maxHeight = presentingViewControllerHeight - tableViewTopMargin
        let height = min(actualHeight, maxHeight)
        let shouldScroll = maxHeight <= actualHeight
        view?.tableViewHeight.constant = height
        
        view?.tableView.isScrollEnabled = shouldScroll
        
        view?.tableView.backgroundColor = backgroundColor
        
        registerCells(inTableView: view!.tableView)
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
        model.actions?.cellSelected(indexPath.row, model)
        
    }
}


struct ListActionsViewUseCases {
}


struct ListActionsViewActions {
}

