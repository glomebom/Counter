//
//  ViewController.swift
//  Counter
//
//  Created by Gleb on 10.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterMinus: UIButton!
    @IBOutlet weak var counterPlus: UIButton!
    @IBOutlet weak var counterReset: UIButton!
    @IBOutlet weak var counterHistoryView: UITextView!
    
    // Перечисление вариантов сообщений для истории изменений
    enum counterHistoryViewText {
        case plus
        case minus
        case belowZero
        case reset
    }
    
    // Переменная счетчика
    var count: Int = 0
    
    @IBAction func counterPlusTouch(_ sender: Any) {
        
        count += 1
        
        counterLabesTextUpdate(value: count)
        
        addMessageToHistoyView(message: .plus)
        
        scrollToBotom()
    }
    
    @IBAction func counterMinusTouch(_ sender: Any) {
        
        if count > 0 {
            
            count -= 1
            counterLabesTextUpdate(value: count)
            addMessageToHistoyView(message: .minus)
            
        } else {
            
            addMessageToHistoyView(message: .belowZero)
            
        }

        scrollToBotom()
    }
    
    @IBAction func counterResetTouch(_ sender: Any) {
        
        count = 0
        
        counterLabesTextUpdate(value: count)
        
        addMessageToHistoyView(message: .reset)
        
        scrollToBotom()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabesTextUpdate(value: count)
        counterHistoryView.insertText("История изменений:" + "\n")
    }
    
    // Обновление значения счетчика
    func counterLabesTextUpdate(value: Int) {
        counterLabel.text = "Значение счётчика: \(String(value))"
    }
    
    // Функция записи изменений в историю
    func addMessageToHistoyView(message: counterHistoryViewText) {
        switch message {
            case .plus:
                counterHistoryView.insertText("[\(Date.now.formatted())]: значение изменено на +1" + "\n")
            case .minus:
                counterHistoryView.insertText("[\(Date.now.formatted())]: значение изменено на -1" + "\n")
            case .belowZero:
                counterHistoryView.insertText("[\(Date.now.formatted())]: попытка уменьшить значение счётчика ниже 0" + "\n")
            case .reset:
                counterHistoryView.insertText("[\(Date.now.formatted())]: значение сброшено" + "\n")
        }
    }
    
    // Прокрутка к низу counterHistoryView после добавления строки
    func scrollToBotom() {
        let range = NSMakeRange((counterHistoryView.text as NSString).length - 1, 1);
        counterHistoryView.scrollRangeToVisible(range);
    }
  
}
