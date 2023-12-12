//
//  ViewController.swift
//  Counter
//
//  Created by Gleb on 10.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var counterMinus: UIButton!
    @IBOutlet private weak var counterPlus: UIButton!
    @IBOutlet private weak var counterReset: UIButton!
    @IBOutlet private weak var counterHistoryView: UITextView!
    
    // Перечисление вариантов сообщений для истории изменений
    private enum CounterHistoryViewText {
        case plus
        case minus
        case belowZero
        case reset
    }
    
    // Переменная счетчика
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabelTextUpdate(value: count)
        counterHistoryView.insertText("История изменений:" + "\n")
    }
    
    // Обновление значения счетчика
    private func counterLabelTextUpdate(value: Int) {
        counterLabel.text = "Значение счётчика: \(String(value))"
    }
    
    // Функция записи изменений в историю
    private func addMessageToHistoryView(message: CounterHistoryViewText) {
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
    private func scrollToBottom() {
        let range = NSMakeRange((counterHistoryView.text as NSString).length - 1, 1);
        counterHistoryView.scrollRangeToVisible(range);
    }
    
    @IBAction private func counterPlusTouch(_ sender: Any) {
        count += 1
        counterLabelTextUpdate(value: count)
        addMessageToHistoryView(message: .plus)
        scrollToBottom()
    }
    
    @IBAction private func counterMinusTouch(_ sender: Any) {
        if count > 0 {
            count -= 1
            counterLabelTextUpdate(value: count)
            addMessageToHistoryView(message: .minus)
        } else {
            addMessageToHistoryView(message: .belowZero)
        }
        scrollToBottom()
    }
    
    @IBAction private func counterResetTouch(_ sender: Any) {
        count = 0
        counterLabelTextUpdate(value: count)
        addMessageToHistoryView(message: .reset)
        scrollToBottom()
    }
    
}
