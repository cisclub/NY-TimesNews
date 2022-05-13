//
//  
//  LoginEntryField.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 12/05/2022.
//
//


import Foundation


class LoginEntryField: UIStackView, MVVM {
    typealias ViewModelType = LoginEntryFieldModel
    
    
    @IBOutlet private var textField: CustomTextField!
    @IBOutlet private var button: BaseButton!
    @IBOutlet private var bodyLabel: BaseLabel!
    var viewModel: ViewModelType?
    
    
    class func instance(withModel viewModel: ViewModelType) -> LoginEntryField {
        let nibName = "LoginEntryField"
        let view = Bundle.main.loadNibNamed(nibName, owner: nil)!.first as! LoginEntryField
        view.viewModel = viewModel
        view.bind()
        
        return view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupViews()
        setupCallbacks()
    }
    
    func setupCallbacks() {
        textField.infoButtonCallBack = { [unowned self] in
            self.viewModel?.infoButtonTapped()
        }
        
        textField.infoButtonCallBack = { [unowned self] in
            self.viewModel?.infoButtonTapped()
        }
        textField.textChangedCallback = { [unowned self] in
            self.viewModel?.textChangedTo(textField.text)
        }
    }
    
    func setupViews() {
        textField.showInfoButton = true
        
        textField.placeholder = Strings.loginNumberPlaceholder
        textField.titleLabelFont = .smallRegular
        textField.inactiveTitleLabelColor = .appDarkText
        textField.showTitleWhenActive = false
        textField.title = Strings.enterEtisalatNumber
        textField.entryType = .phoneNumber
        
        button.type = .custom(textColor: .appDisableButtonText,
                              bgColor: .appDisableButtonBg,
                              cornerRadius: 24,
                              borderColor: nil,
                              margin: 0.0)
        button.setTitle(Strings.login, for: .normal)
        button.titleLabel?.font = .h4
        
        bodyLabel.type = .subtitle
        bodyLabel.text = Strings.UAEPassSubtitle
        bodyLabel.textAlignment = .center
        
        textField.validationErrorMessage = Strings.enterValidEtisalatNumber
    }
    
    func bind() {
        viewModel!.textColor.bind({ [unowned self] color in
            self.textField.textFieldTextColor = color
        })
        viewModel!.hasError.bind({ [unowned self] hasError in
            if let hasError = hasError {
                hasError ? self.textField.showErrorButon() : self.textField.hideErrorButton()
            }
        })
    }
}


class LoginEntryFieldModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = LoginEntryFieldActions
    
    
    let useCases: UseCasesType
    let actions: ActionsType
    var textColor = Observable<UIColor>(.appDarkText)
    var hasError = Observable<Bool?>(nil)
    var errorMessage = Strings.enterValidEtisalatNumber
    let maxStringLength = 10
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
    }
    
    func textChangedTo(_ text: String) {
        let isValidMobileNumber = ValidationMock.isValidMobileNumber(text)
        let isValidLandlineNumber = ValidationMock.isValidLandlineNumber(text)
        let isValidAlShamilNumber = ValidationMock.isValidAlShamilNumber(text)
        if isValidMobileNumber || isValidLandlineNumber || isValidAlShamilNumber {
            textColor.value = .appDarkText
            hasError.value = false
        } else {
            textColor.value = .appRed
            hasError.value = true
        }
    }
    
    func infoButtonTapped() {
        actions.infoButtonTapped()
    }
}


struct LoginEntryFieldActions {
    let infoButtonTapped: () -> ()
}

