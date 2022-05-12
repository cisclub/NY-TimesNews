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
        
        view.viewModel = viewModel
        view.tableView.delegate = view.viewModel
        view.tableView.dataSource = view.viewModel
        view.viewModel?.setupTableView()
        view.bind()
        
        return view
    }
    
    func bind() {
        viewModel?.tableViewHeight.bind({[weak self] newValue in
            self?.tableViewHeight.constant = newValue
        })
        
        viewModel?.tableViewShouldScroll.bind({ [weak self] shouldScroll in
            self?.tableView.isScrollEnabled = shouldScroll
        })
        viewModel?.tableViewBackgroundColor.bind({ [weak self] color in
            self?.tableView.backgroundColor = color
        })
        viewModel?.registeredCellIdentifiers.bind({ [weak self] identifiers in
            for identifier in identifiers {
                self?.tableView.register(UINib(nibName: identifier,
                                               bundle: nil),
                                         forCellReuseIdentifier: identifier)
            }
        })
    }
}


class ListActionsViewModel: NSObject, ViewModel {
    typealias UseCasesType = ListActionsViewUseCases?
    typealias ActionsType = ListActionsViewActions?
    
    
    let useCases: UseCasesType
    let actions: ActionsType
    let dataSource: [StandardCellModel]
    let backgroundColor: UIColor
    let presentingViewControllerHeight: CGFloat
    let tableViewTopMargin = 300.0
    var tableViewHeight = Observable<CGFloat>(0.0)
    var tableViewShouldScroll = Observable<Bool>(false)
    var tableViewBackgroundColor = Observable<UIColor>(.white)
    var registeredCellIdentifiers = Observable<[String]>([])
    
    
    init(useCases: UseCasesType,
         actions: ActionsType,
         dataSource: [StandardCellModel],
         backgroundColor: UIColor,
         presentingViewControllerHeight: CGFloat)
    {
        self.useCases = useCases
        self.actions = actions
        self.backgroundColor = backgroundColor
        self.presentingViewControllerHeight = presentingViewControllerHeight
        
        var identifiers = [String]()
        for model in dataSource {
            identifiers.append(model.reusableIdentifier())
        }
        registeredCellIdentifiers.value = identifiers
        
        
        self.dataSource = dataSource
    }
    
    func setupTableView() {
        let rowHeight = 65.0
        let bottomMargin = 64.0
        let actualHeight = (CGFloat(dataSource.count) * rowHeight) + bottomMargin
        let maxHeight = presentingViewControllerHeight - tableViewTopMargin
        let height = min(actualHeight, maxHeight)
        let shouldScroll = maxHeight <= actualHeight
        tableViewHeight.value = height
        tableViewShouldScroll.value = shouldScroll
        
        tableViewBackgroundColor.value = backgroundColor
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

