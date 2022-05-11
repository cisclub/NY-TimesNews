//
//  
//  StandardCell.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//


import Foundation


class StandardCell: UITableViewCell, MVVM {
    typealias ViewModelType = StandardCellModel
    
    
    enum State {
        case loading
        case normal
        case disabled
        case selected
    }
    
    
    var viewModel: ViewModelType? {
        willSet {
            viewModel?.state.removeBinding()
        }
        
        didSet {
            viewModel!.state.bind({ newState in
                self.state = newState
            })
        }
    }
    private var shimmerView: UIView? = nil
    var state: State = .normal {
        didSet {
            switch state {
            case .loading:
                updateUITOLoadingState()
            case .normal:
                updateUITONormalState()
            case .disabled:
                updateUITODisabledState()
            case .selected:
                updateUITOSelectedState()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    
    class func instance(withModel viewModel: ViewModelType) -> StandardCell {
        let nibName = "StandardCell"
        let cell = Bundle.main.loadNibNamed(nibName, owner: nil)!.first as! StandardCell
        cell.viewModel = viewModel
        
        return cell
    }
    
    class func identifier() -> String {
        return String(describing: Self.self)
    }
    
    /// Override this method to change how loading state should update UI
    func updateUITOLoadingState() {
        addShimmerView(toView:contentView)
    }
    
    func addShimmerView(toView view: UIView) {
        let whiteView = UIView(frame: view.bounds)
        whiteView.backgroundColor = .white
        let shimmer = UIView(frame: whiteView.bounds)
        shimmer.backgroundColor = .shimmerColor
        
        whiteView.addView(view: shimmer, withMargins: [0, 0, 0, 0])
        view.addView(view: whiteView, withMargins: [0, 0, 0, 0])
        
        shimmer.startShimmeringFromRight(toLeft: true)
        
        shimmerView = shimmer
    }
    
    func removeShimmer() {
        shimmerView?.removeFromSuperview()
        shimmerView = nil
    }
    
    /// Override this method to change how normal state should update UI
    func updateUITONormalState() {
        
    }
    
    /// Override this method to change how disabled state should update UI
    func updateUITODisabledState() {
        
    }
    
    /// Override this method to chnage how selcted state should update UI
    func updateUITOSelectedState() {
        
    }
}


class StandardCellModel: ViewModel {
    typealias UseCasesType = StandardCellUseCases?
    typealias ActionsType = StandardCellActions?
    typealias ViewType = StandardCell
    
    
    var view: StandardCell?
    let useCases: UseCasesType
    let actions: ActionsType
    var state: Observable<StandardCell.State> = Observable<StandardCell.State>(.normal)

    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
    }
    
    
    func reusableIdentifier() -> String {
        return String(describing: ViewType.self)
    }
}


struct StandardCellUseCases {
}


struct StandardCellActions {
    let cellSelected: (_ index: Int) -> ()
}

