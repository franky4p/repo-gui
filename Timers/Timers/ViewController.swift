//
//  ViewController.swift
//  Timers
//
//  Created by Pavel Khlebnikov on 02.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    weak var fieldNameTimer: UITextField!
    weak var fieldValueTimer: UITextField!
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    private var data = [MyTimer]()
    var mainTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.tableView)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
                    
        self.updateLayout(with: self.view.frame.size)
    }

    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
        
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.nameTimer.text = self.data[indexPath.row].name
        cell.myTimer = self.data[indexPath.row]
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 320
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.data[indexPath.row].timeUntilFire == nil {
            self.data[indexPath.row].timeUntilFire = self.data[indexPath.row].timer?.fireDate.timeIntervalSinceNow
            self.data[indexPath.row].timer?.invalidate()
        } else {
            let timer = startMyTimer(self.data[indexPath.row], timeInterval: self.data[indexPath.row].timeUntilFire ?? 0)
            self.data[indexPath.row].timer = timer
            self.data[indexPath.row].timeUntilFire = nil
            //self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let labelMainHeading = FactoryUI.createLabel(headerView, withX: 5, withY: 5, hight: headerView.frame.height + 10, text: "Мульти таймер")
        labelMainHeading.textAlignment = .center
        labelMainHeading.textColor = .black
        headerView.addSubview(labelMainHeading)
        
        let labelHeadingAddTimer = FactoryUI.createLabel(headerView, withX: 5, withY: 65, hight: headerView.frame.height - 10, text: "Добавление таймеров")
        headerView.addSubview(labelHeadingAddTimer)
        
        let fieldNameTimer = FactoryUI.createTextField(headerView, hightY: 115, text: "Название таймера")
        self.fieldNameTimer = fieldNameTimer
        headerView.addSubview(fieldNameTimer)
        
        let fieldValueTimer = FactoryUI.createTextField(headerView, hightY: 165, text: "Время в секундах")
        self.fieldValueTimer = fieldValueTimer
        headerView.addSubview(fieldValueTimer)
        
        let button = FactoryUI.createButton(headerView, hightY: 230)
        button.addTarget(self, action: #selector(addTimer), for: .touchUpInside)
        headerView.addSubview(button)
        
        let labelTimers = FactoryUI.createLabel(headerView, withX: 5, withY: 280, hight: headerView.frame.height - 10, text: "Таймеры")
        labelTimers.layer.borderWidth = 1
        headerView.addSubview(labelTimers)
        
        return headerView
    }
    
    @objc func addTimer() {
        createTimer()
        let valueTimer = Double(self.fieldValueTimer.text ?? "0") ?? 0
        let timeInterval: TimeInterval = valueTimer
        
        let NewTimer = MyTimer(name: self.fieldNameTimer.text ?? "Timer")
        let timer = startMyTimer(NewTimer, timeInterval: timeInterval)
        NewTimer.timer = timer
        
        updateData(NewTimer)
    }
    
    func startMyTimer(_ newTimer: MyTimer, timeInterval: TimeInterval) -> Timer {
        let timer: Timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) {[weak self] timer in
            newTimer.completed = true
            self?.deleteExpiredTimer()
        }
        timer.tolerance = 0.1
        
        return timer
    }
    
    func deleteExpiredTimer() {
        let index = self.data.firstIndex(where: {timer in timer.completed})
        if let index = index {
            self.data.remove(at: index)
            self.tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        }
    }
    
    func updateData(_ newTimer: MyTimer) {
        self.data.append(newTimer)
        self.data.sort(by: {let first = Int(($0.timer?.fireDate.timeIntervalSince(Date())) ?? 0)
                        let second = Int($1.timer?.fireDate.timeIntervalSince(Date()) ?? 0)
                        return first > second })
        
        self.tableView.reloadData()
    }
}

