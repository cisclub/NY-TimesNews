//
//  
//  LoginInfoActions.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 13/05/2022.
//
//


import Foundation


class LoginInfoActions: UIView, MVVM {
    typealias ViewModelType = LoginInfoActionsModel
    
    
    var viewModel: ViewModelType?
    let expandedHeight = 128.0
    let contractedHeight = 65.0
    @IBOutlet private weak var firstViewLengthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var secondViewLengthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var thirdViewLengthConstraint: NSLayoutConstraint!
    @IBOutlet private var separators: [UIView]!
    @IBOutlet private weak var firstLabel: BaseLabel!
    @IBOutlet private weak var secondLabel: BaseLabel!
    @IBOutlet private weak var thirdLabel: BaseLabel!
    
    
    class func instance(withModel viewModel: ViewModelType) -> LoginInfoActions {
        let nibName = "LoginInfoActions"
        let view = Bundle.main.loadNibNamed(nibName, owner: nil)!.first as! LoginInfoActions
        view.viewModel = viewModel
        view.bind()
        
        return view
    }
    
    func bind() {
        viewModel!.firstRowExpanded.bind({ [unowned self] expanded in
            if expanded {
                self.firstViewLengthConstraint.constant = self.expandedHeight
            } else {
                self.firstViewLengthConstraint.constant = self.contractedHeight
            }
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           options: .curveEaseOut) {
                self.superview?.layoutIfNeeded()
            } completion: { _ in
            }
        })
        viewModel!.secondRowExpanded.bind({ [unowned self] expanded in
            if expanded {
                self.secondViewLengthConstraint.constant = self.expandedHeight
            } else {
                self.secondViewLengthConstraint.constant = self.contractedHeight
            }
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           options: .curveEaseOut) {
                self.layoutIfNeeded()
            } completion: { _ in
            }
        })
        viewModel!.thirdRowExpanded.bind({ [unowned self] expanded in
            if expanded {
                self.thirdViewLengthConstraint.constant = self.expandedHeight
            } else {
                self.thirdViewLengthConstraint.constant = self.contractedHeight
            }
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           options: .curveEaseOut) {
                self.layoutIfNeeded()
            } completion: { _ in
            }
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for separator in separators {
            separator.backgroundColor = .separatorColor
        }
        
        firstLabel.type = .h4
        secondLabel.type = .h4
        thirdLabel.type = .h4
        
        firstLabel.text = Strings.loginInfoMobileNumber
        secondLabel.text = Strings.loginInfoElife
        thirdLabel.text = Strings.loginInfoInternet
    }
    
    @IBAction func firstButtonTapped() {
        viewModel?.firstButtonTapped()
    }
    
    @IBAction func secondButtonTapped() {
        viewModel?.secondButtonTapped()
    }
    
    @IBAction func thirdButtonTapped() {
        viewModel?.thirdButtonTapped()
    }
}


class LoginInfoActionsModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = Void?
    
    
    let useCases: UseCasesType
    let actions: ActionsType
    var firstRowExpanded = Observable<Bool>(false)
    var secondRowExpanded = Observable<Bool>(false)
    var thirdRowExpanded = Observable<Bool>(false)
    
    
    func firstButtonTapped() {
        secondRowExpanded.value = false
        thirdRowExpanded.value = false
        firstRowExpanded.value.toggle()
    }
    
    func secondButtonTapped() {
        secondRowExpanded.value.toggle()
        thirdRowExpanded.value = false
        firstRowExpanded.value = false
    }
    
    func thirdButtonTapped() {
        secondRowExpanded.value = false
        thirdRowExpanded.value.toggle()
        firstRowExpanded.value = false
    }
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
    }
}
