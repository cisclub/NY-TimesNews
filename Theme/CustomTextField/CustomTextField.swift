//
//  CustomTextField.swift
//  EtisalatUI
//
//  Created by Asad Ali on 09/05/2022.
//

import UIKit


@IBDesignable
class CustomTextField: UIView {
    
    enum `EntryType` {
        case password
        case phoneNumber
        case text
        case email
        case decimal
    }
    
    
    // MARK: - Outlets
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var viewSeparator: UIView!
    @IBOutlet private weak var viewSeparatorHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var lblPlaceHolder: UILabel!
    @IBOutlet private weak var stackActions: UIStackView!
    @IBOutlet private weak var btnClearText: BaseButton!
    @IBOutlet private weak var btnInfo: BaseButton!
    @IBOutlet private weak var btnCorrect: BaseButton!
    @IBOutlet private weak var btnShowPassword: BaseButton!
    @IBOutlet private weak var validationLabel: BaseLabel!
    
    
    // MARK: - Private Variables
    private var placeHolderString: String = ""
    private var view: UIView!
    private var allowedCharacters: String?
    private var charactersLimit = 500
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomTextField.tapGestureRecognized(_:)))
    private let phoneNumberString = "0123456789 "
    private let decimalsOnlyString = "0123456789."
    private var bottomLineHeight = 1.0 {
        didSet {
            viewSeparatorHeightConstraint.constant = bottomLineHeight
        }
    }
    
    
    // MARK: - Public Properties
    public var textChangedCallback: (() -> Void)?
    public var textFieldDidEndEditingCallback: (() -> Void)?
    public var textFieldShouldChangeCharsInRnage: ((_ range: NSRange, _ replacement: String) -> (Bool))?
    public var infoButtonCallBack: (() -> Void)?
    public var clearTextButtonCallBack: (() -> Void)?
    public var showPasswordButtonCallBack: (() -> Void)?
    
    /// user can select textFieldType
    public var entryType: EntryType = .text { didSet { self.setupTextFieldOnTypeChanges() } }
    ///
    var textFieldTextColor: UIColor = .appDarkText
    
    /// Sets the color of the title text when textfield is first responder / not
    var activeTitleLabelColor: UIColor = .appActive
    var inactiveTitleLabelColor: UIColor = .appGray
    
    /// Sets the text size of title label
    var titleLabelFont: UIFont = .regular
    
    
    // MARK: - IBInspectable Properties
    @IBInspectable var title: String? {
        
        get {
            
            return lblPlaceHolder.text
            
        } set(newText) {
            
            lblPlaceHolder.text = newText
        }
    }
    
    /**
     The instance of the `View`  has filed name TextField.
     User can set view  text to filed
     
     */
    
    @IBInspectable var text: String {
        
        get {
            
            let returnText = textField.text ?? ""
            return entryType == .phoneNumber ? returnText.planPhoneNumberString : returnText
            
        } set(newText) {

            textField.text = entryType == .phoneNumber ? newText.formattedPhoneNumber : newText
            
            if newText.count == 0 {
                btnClearText.isHidden = true
            }
        }
    }
    
    
    @IBInspectable var placeholder: String? {
        
        get {
            return placeHolderString
            
        } set(newText) {
            
            placeHolderString = newText ?? ""
            textField.attributedPlaceholder = placeHolderString.styled(as: .regular)
        }
    }
    
    @IBInspectable var showTitleWhenActive: Bool = true { didSet {
        changeTitleLabelColorIfNeeded()
    }}
    
    func showErrorButon() {
        if text.count > 0 {
            btnClearText.isHidden = false
        }
        viewSeparator.backgroundColor = UIColor.appRed
        bottomLineHeight = 2.0
    }
    
    func hideErrorButton() {
        btnClearText.isHidden = true
        viewSeparator.backgroundColor = UIColor.appActive
    }
    
    
    /**
     The textLimit of the `View` instance filed of textfield.
     User can set  textLimit to textField
     
     */
    @IBInspectable var textLimit: Int {
        
        get {
            
            return charactersLimit
            
        } set(newVal) {
            
            charactersLimit = newVal
        }
    }

    @IBInspectable var showInfoButton: Bool {
        
        get {
            
            return !(btnInfo.isHidden)
            
        } set(newVal) {
            
            btnInfo.isHidden = !newVal
        }
    }

    
    /**
     
     This message will be displayed when validation failed.
     Default message will be shown if not set
     
     */
    @IBInspectable var validationErrorMessage = "" {
        didSet {
            validationLabel.text = validationErrorMessage
        }
    }
    
    /**
     The isSecureTextEntry of the `View` instance.
     User can set  bool value for SecureTextEntry
     
     
     */
    
    @IBInspectable var isSecureTextEntry: Bool {
        get {
            return textField.isSecureTextEntry
        } set(newVal) {
            textField.isSecureTextEntry = newVal
        }
    }
    
    
    // MARK: - Public Getters
    /**
     
     The perimeter of the `isValid` instance.
     
     - Returns: isCompulsory behaviour.
     
     */
    var validationMessageIsHidden = true {
        didSet {
            if validationMessageIsHidden {
                validationLabel.isHidden = true
            } else {
                validationLabel.isHidden = false
            }
        }
    }
    
    public var rawText: String {
        
        return textField.text ?? ""
    }
    
    
    // MARK: - Private Methods
    private func setup() {
        
        view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
        
        textField.delegate = self
        textField.textColor = textFieldTextColor
        
        showInfoButton = false
        
        textField.addTarget(self, action: #selector(CustomTextField.textFieldTextDidChange(_:)), for: UIControl.Event.editingChanged)
        
        lblPlaceHolder.isHidden = true
        lblPlaceHolder.font = titleLabelFont
        
        validationLabel.textColor = .appRed
        validationLabel.font = .smallRegular
        validationLabel.isHidden = true
        
        addGestureRecognizer(tapGestureRecognizer)
        
        btnInfo.isHidden = true
        btnInfo.setImage(UIImage(named: "iconInfoprorata"), for: .normal)
        btnCorrect.isHidden = true
        btnClearText.isHidden = true
        btnShowPassword.isHidden = true
        btnInfo.tapHandler = { [weak self] (button: BaseButton) in
            self?.infoButtonCallBack?()
        }
        
        btnClearText.tapHandler = { [weak self] (button: BaseButton) in
            self?.text.removeAll()
            self?.viewSeparator.backgroundColor = UIColor.appLigtGray
            self?.bottomLineHeight = 1.0
            self?.clearTextButtonCallBack?()
        }
        
        btnShowPassword.tapHandler = { [weak self] (button: BaseButton) in
            self?.showPasswordButtonCallBack?()
            self?.textField.isSecureTextEntry.toggle()
        }
        
        btnCorrect.isEnabled = false
    }
    
    private func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: CustomTextField.self), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    @objc private func textFieldTextDidChange(_ textField: UITextField) {
        
        checkTextLength(textField)
        
        if entryType == .phoneNumber {
            text = text.formattedPhoneNumber
        } else if entryType == .password {
            btnShowPassword.isHidden = text.count == 0
        }
        
        textChangedCallback?()
    }
    
    private func checkTextLength(_ textField: UITextField) {
        
        guard let prospectiveText = textField.text, prospectiveText.count > textLimit else {
            return
        }
        
        let selection = textField.selectedTextRange
        text = String(prospectiveText[..<prospectiveText.index(prospectiveText.startIndex, offsetBy: textLimit)])
        textField.selectedTextRange = selection
    }
    
    private func setupTextFieldOnTypeChanges() {
        
        switch entryType {
        case .phoneNumber:
            allowedCharacters = phoneNumberString
            textField.keyboardType = .numberPad
            
        case .decimal:
            allowedCharacters = decimalsOnlyString
            textField.keyboardType = .decimalPad
            
        case .email:
            textField.keyboardType = .emailAddress
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
            
        case .text:
            textField.keyboardType = .default
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            
        case .password:
            textField.isSecureTextEntry = true
            textField.keyboardType = .default
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
        }
    }
    
    private func changeTitleLabelColorIfNeeded() {
        
        lblPlaceHolder.textColor = textField.isFirstResponder ? activeTitleLabelColor:inactiveTitleLabelColor
        viewSeparator.backgroundColor = textField.isFirstResponder ? UIColor.appActive:UIColor.appLigtGray
        bottomLineHeight = textField.isFirstResponder ? 2.0 : 1.0
        
        if showTitleWhenActive {
            lblPlaceHolder.isHidden = text.count == 0 && !textField.isFirstResponder
            textField.attributedPlaceholder = textField.isFirstResponder ? "".styled(as: .regular):placeHolderString.styled(as: .regular)
        } else {
            lblPlaceHolder.isHidden = false
        }
    }
    
    @objc private func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        
        textField.becomeFirstResponder()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        setup()
    }
    
    @discardableResult
    override func resignFirstResponder() -> Bool {
        
        return textField.resignFirstResponder()
    }
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        
        return textField.becomeFirstResponder()
    }

    override var intrinsicContentSize: CGSize {
        
        return CGSize(width: view.frame.width, height: 64)
    }
}


extension CustomTextField: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        changeTitleLabelColorIfNeeded()
        textFieldDidEndEditingCallback?()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        changeTitleLabelColorIfNeeded()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Override default behaviour
        if let textFieldShouldChangeCharsInRnage = textFieldShouldChangeCharsInRnage {
            return textFieldShouldChangeCharsInRnage(range, string)
        }
        
        let currentText = textField.text ?? ""
        
        if range.length + range.location > currentText.count {
            return false
        }
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        if entryType == .decimal && string != "" {
            let charcount = prospectiveText.components(separatedBy: ".")
            
            if charcount.count > 1 && (charcount.last!.count >= 3) {
                return false
            }
            if let _ = Double(prospectiveText) { } else {
                if prospectiveText.count > 1 && string == "." { return false }
            }
        }
        
        guard let allowedChar = allowedCharacters, prospectiveText.count > 0 else {
            return true
        }
        
        if entryType == .decimal {
            
            let isNumeric = prospectiveText.isEmpty || (Double(prospectiveText) != nil)
            let numberOfDots = prospectiveText.components(separatedBy: ".").count - 1

            let numberOfDecimalDigits: Int
            if let dotIndex = prospectiveText.firstIndex(of: ".") { numberOfDecimalDigits = prospectiveText.distance(from: dotIndex, to: prospectiveText.endIndex) - 1 }
            else { numberOfDecimalDigits = 0 }

            return isNumeric && numberOfDots <= 1 && numberOfDecimalDigits <= 2
        }
        else { return prospectiveText.rangeOfCharacter(from: CharacterSet(charactersIn: allowedChar).inverted) == nil }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
}



extension String {
    
    
    /**
     Initializes a format function that take Parameters and provide formate string with the provided parts and specifications.
     I m using NSRegularExpression pattern for format.
     - Parameters:
        - phoneNumber : The Number Which you want to formate
        - shouldRemoveLastDigit : (Option Variable) it use some case when you want to remove last string index
    
     
     - Returns: A beautiful, brand-new format string , custom-built just for you.
     
     */
    func cleanedString() ->  String {
        
        return removeLeadingAndTrailingSpaces()
    }
    
    func removeLeadingAndTrailingSpaces() ->  String {
        
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func replace(_ target: String, withString: String) -> String {
        
        return replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    public func formatFor(phoneNumber: String, shouldRemoveLastDigit: Bool = false) -> String {
        
        //Check empty string
        guard !phoneNumber.isEmpty else { return "" }
        
        var number = phoneNumber.replace("+71", withString: "").replace("+", withString: "")
        if number.first == "1" {
            number.removeFirst()
        }
        //Check empty string again
        guard !number.isEmpty else { return "" }
        
        // RegularExpression
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return "" }
        let r = NSString(string: number).range(of: number)
        number = regex.stringByReplacingMatches(in: number, options: .init(rawValue: 0), range: r, withTemplate: "")
        
        if number.count > 10 {
            let tenthDigitIndex = number.index(number.startIndex, offsetBy: 10)
            number = String(number[number.startIndex..<tenthDigitIndex])
        }
        
        if shouldRemoveLastDigit {
            let end = number.index(number.startIndex, offsetBy: number.count-1)
            number = String(number[number.startIndex..<end])
        }
        
        if number.count < 7 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d+)", with: "$1 $2", options: .regularExpression, range: range)
            
        } else {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "$1 $2 $3", options: .regularExpression, range: range)
        }
        
        return number
    }
    
    
    /**
     Initializes a new String Object with the provided Information and specifications after then it provider formated String.
     
        - Returns: A beautiful, brand-new format string.
     
     */
    
    public var formattedPhoneNumber: String {
        
        return formatFor(phoneNumber: cleanedString())
    }

    
    public var planPhoneNumberString: String {
        
        return self
            .replace("+", withString: "")
            .replace(" ", withString: "")
            .replace("-", withString: "")
            .replace("(", withString: "")
            .replace(")", withString: "")
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                            upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
