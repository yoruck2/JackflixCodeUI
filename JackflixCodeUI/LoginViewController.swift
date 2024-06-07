//
//  LoginViewController.swift
//  JackflixCodeUI
//
//  Created by dopamint on 6/5/24.
//

import UIKit
//
//class SignUpTextField: UITextField {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        backgroundColor = .gray
//        textColor = .white
//        layer.cornerRadius = 10
//        textAlignment = .center
//    }
//
//    init(_ text: String) {
//        placeholder = text
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

// TODO: 시도 해볼것들: 국가 텍스트 필드에 pickerView 적용 / 더 다양한 입력 제한 조건 (공백금지 등) / -


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    lazy var mainTitleLabel = {
        let view = UILabel()
        view.text = "JACKFLIX"
        view.textColor = UIColor(named: "keyColor")
        view.font = UIFont(name: "Futura Bold", size: 40)
        return view
    }()
    
    let accountTextField = UITextField()
    let passwordTextField = UITextField()
    let nicknameTextField = UITextField()
    let nationTextField = UITextField()
    let recommendationCodeTextField = UITextField()
    
    lazy var signUptextFieldStackView = {
        let textFields = [accountTextField,
                          passwordTextField,
                          nicknameTextField,
                          nationTextField,
                          recommendationCodeTextField
        ]
        
        textFields.forEach { textField in
            textField.backgroundColor = .gray
            textField.textColor = .white
            textField.layer.cornerRadius = 5
            textField.textAlignment = .center
            textField.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        }
        
        let stackView = UIStackView(arrangedSubviews: textFields)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 23
        return stackView
    }()
    
    lazy var signUpButton = {
        let view = UIButton()
        view.setTitle("회원가입", for: .normal)
        view.backgroundColor = .white
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var addtionalInfoLabel = {
        let view = UILabel()
        view.text = "추가 정보 입력"
        view.textColor = .white
        return view
    }()
    
    
    lazy var addtionalInfoSwitch = {
        let view = UISwitch()
        view.onTintColor = UIColor(named: "keyColor")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        configureUI()
        hideKeyboardWhenTappedAround()
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    func configureHierachy() {
        view.addSubview(mainTitleLabel)
        view.addSubview(signUptextFieldStackView)
        view.addSubview(signUpButton)
        view.addSubview(addtionalInfoLabel)
        view.addSubview(addtionalInfoSwitch)
    }
    
    func configureUI() {
        passwordTextField.placeholder = "비밀번호"
        nicknameTextField.placeholder = "닉네임"
        nationTextField.placeholder = "국가"
        recommendationCodeTextField.placeholder = "추천 코드 입력"
    }
    
    @objc
    func signUpButtonTapped() {
        if accountTextField.text?.isEmpty ?? true ||
            nicknameTextField.text?.isEmpty ?? true ||
            passwordTextField.text?.isEmpty ?? true {
            showMessageAlert(title: "가입 실패",
                             message: "필수 항목이 누락되었습니다",
                             actionList: [
                                UIAlertAction(title: "확인",style: .default)
                             ])
        }
        
        showMessageAlert(message: "가입 완료!",
                         actionList: [
                            UIAlertAction(title: "확인",style: .default)
                         ])
    }
    
    func showMessageAlert(title: String? = nil,
                          message: String,
                          actionList: [UIAlertAction],
                          completion: (() -> ())? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actionList {
            alertViewController.addAction(action)
        }
        // 버튼이 여러개인 경우 actionList(버튼 동작)를 배열로 받아 for문으로 반복 해 추가
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
    // TODO: 리턴 키를 누르면 다음 텍스트필드로 커서가 넘어가는 기능 왜안될까..-
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == accountTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            nicknameTextField.becomeFirstResponder()
        } else if textField == nicknameTextField {
            textField.becomeFirstResponder()
        } else if textField == recommendationCodeTextField {
            textField.resignFirstResponder()
            view.endEditing(true)
        }
        return true
    }
}

// MARK: constraints -
extension LoginViewController {
    
    func configureLayout() {
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.centerX.equalToSuperview()
        }
        
        signUptextFieldStackView.snp.makeConstraints { make in
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.4)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(45)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signUptextFieldStackView.snp.bottom).offset(23)
            make.width.equalTo(accountTextField).multipliedBy(1)
            make.height.equalTo(accountTextField).multipliedBy(1.2)
            make.centerX.equalToSuperview()
        }
        
        addtionalInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(28)
            make.leading.equalTo(signUpButton)
        }
        
        addtionalInfoSwitch.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(25)
            make.trailing.equalTo(signUpButton)
        }
    }
}



// MARK: dismiss keyboard -
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
