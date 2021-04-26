//
//  LoginFormControllerViewController.swift
//  VK GeekBrains
//
//  Created by Евгений Дегтярев on 02.04.2021.
//

import UIKit

class LoginFormControllerViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
 
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
    }
    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue) {
        self.userNameTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    
    // Когда клавиатура появляется
       @objc func keyboardWasShown(notification: Notification) {
           
           // Получаем размер клавиатуры
           let info = notification.userInfo! as NSDictionary
           let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
           let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
           
           // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
           self.scrollView?.contentInset = contentInsets
           scrollView?.scrollIndicatorInsets = contentInsets
       }
       
       //Когда клавиатура исчезает
       @objc func keyboardWillBeHidden(notification: Notification) {
           // Устанавливаем отступ внизу UIScrollView, равный 0
           let contentInsets = UIEdgeInsets.zero
           scrollView?.contentInset = contentInsets
       }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
            
            // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            // Второе — когда она пропадает
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
   
    
    private func checkUserInfo() -> Bool {
        guard
            let username = userNameTextField.text,
            let password = passwordTextField.text,
            username == "",
            password == ""
        else {
            presentError()
            return false}
        return true
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "goInside" else {
            return false
        }
       return checkUserInfo()
    }
    
    
    private func presentError(with message: String = "Введены неверные данные пользователя") {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
        } 
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
    
    @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }
    override func viewDidLoad() {
            super.viewDidLoad()
         
            // Жест нажатия
            let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            // Присваиваем его UIScrollVIew
            scrollView?.addGestureRecognizer(hideKeyboardGesture)
        }

    
}

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = .white {
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var endColor: UIColor = .black {
        didSet {
            self.updateColors()
        }
    }
    
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
            self.updateLocations()
        }
    }
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updateLocations()
        }
    }
    
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            self.updateStartPoint()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            self.updateEndPoint()
        }
    }
    
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }

    func updateLocations() {
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }
    
    func updateColors() {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }

    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }

    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }



}
