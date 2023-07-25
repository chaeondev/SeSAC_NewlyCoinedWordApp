//
//  ViewController.swift
//  NewlyCoinedWordApp
//
//  Created by ChaewonMac on 2023/07/25.
//


import UIKit

class NewlyCoinedViewController: UIViewController {

    
    @IBOutlet var searchBackgroundView: UIView!
    @IBOutlet var wordTextField: UITextField!
    
    @IBOutlet var searchButton: UIButton!
    
    
    
    @IBOutlet var wordFirstButton: UIButton!
    @IBOutlet var wordSecondButton: UIButton!
    @IBOutlet var wordThirdButton: UIButton!
    @IBOutlet var wordFourthButton: UIButton!
    
    @IBOutlet var resultImageView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    // for wordButtonClicked function
    let newlyCoinedWordDict: [String: String] = ["알잘딱깔센": "알아서 잘 딱 깔끔하고 센스있게", "만반잘부": "만나서 반가워 잘 부탁해", "꾸안꾸": "꾸민듯 안 꾸민듯", "별다줄": "별 걸 다 줄인다", "이생망": "이번생은 망했다", "사바사": "사람바이사람", "소확행": "소소하지만 확실한 행복"]
    
    // for AlertMessageAndDelete function
    let typeAgainMessage = "다시 한번 입력해주시길 바랍니다."
    let noSearchMessage = "해당 검색기에 존재하지 않는 신조어입니다."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundView()
        
        setButtons(name: wordFirstButton)
        setButtons(name: wordSecondButton)
        setButtons(name: wordThirdButton)
        setButtons(name: wordFourthButton)
        
        setResultLabel()
       
        
    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        wordTextFieldClicked(wordTextField)
    }
    
    @IBAction func wordButtonClicked(_ sender: UIButton) {
        
        wordTextField.text = sender.currentTitle
        wordTextFieldClicked(wordTextField)
        
        
        let buttonTitleArray = [wordFirstButton.titleLabel?.text, wordSecondButton.titleLabel?.text, wordThirdButton.titleLabel?.text, wordFourthButton.titleLabel?.text]
        
        let newlyCoinedWordArray = Array(newlyCoinedWordDict.keys)
        
        var randomWord = newlyCoinedWordArray.randomElement()!
        
        while true {
            if buttonTitleArray.contains(randomWord) {
                randomWord = newlyCoinedWordArray.randomElement()!
            } else {
                break
            }
        }
        
        switch sender.tag {
        case 0,1,2,3:
            sender.setTitle(randomWord, for: .normal)
        default: break
        }
        
        
    }
    
    @IBAction func wordTextFieldClicked(_ sender: UITextField) {

        if let value = wordTextField.text {
            if value.count <= 1 {
                AlertMessageAndDelete(alertMessage: typeAgainMessage)
            } else if newlyCoinedWordDict[value] == nil {
                AlertMessageAndDelete(alertMessage: noSearchMessage)
            } else {
                resultLabel.text = newlyCoinedWordDict[value]
            }
            
        }
        
    }
    
    
    
    func setBackgroundView() {
        searchBackgroundView.layer.borderColor = UIColor.black.cgColor
        searchBackgroundView.layer.borderWidth = 4.0
    }
    
    func setButtons(name: UIButton) {
        name.layer.borderColor = UIColor.black.cgColor
        name.layer.cornerRadius = 10
        name.layer.borderWidth = 1
        name.setTitleColor(.black, for: .normal)
        name.titleLabel?.font = .systemFont(ofSize: 15)
        name.sizeToFit()

        let padding: CGFloat = 10
        name.contentEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
    }
    
    func setResultLabel() {
        resultLabel.text = "신조어 검색기"
        resultLabel.numberOfLines = 0
        resultLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func AlertMessageAndDelete(alertMessage: String) {
        let alert = UIAlertController(title: "신조어 검색기", message: alertMessage, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: true)
        wordTextField.text = ""

    }
    
    

}

