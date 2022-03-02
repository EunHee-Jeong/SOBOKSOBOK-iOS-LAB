//
//  ViewController.swift
//  FSCalendarSample
//
//  Created by taehy.k on 2022/03/02.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    private var firstDate: Date?
    private var lastDate: Date?
    private var datesRange: [Date]?

    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dates = [
            self.gregorian.date(byAdding: .day, value: -1, to: Date()),
            Date(),
            self.gregorian.date(byAdding: .day, value: 1, to: Date())
        ]
        dates.forEach { (date) in
            self.calendar.select(date, scrollToDate: false)
        }
        
        setCalendar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = calendar.frame
        rectShape.position = calendar.center
        rectShape.path = UIBezierPath(roundedRect: calendar.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 30, height: 30)).cgPath
        calendar.layer.mask = rectShape
    }

    private func setCalendar() {
        calendar.delegate = self
        calendar.dataSource = self
        calendar.headerHeight = 0
        calendar.allowsMultipleSelection = true
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.placeholderType = .none
        calendar.firstWeekday = 2
        
        // header - 3월 2022 이 부분 의미
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
        calendar.appearance.weekdayTextColor = UIColor(red: 132/255, green: 140/255, blue: 146/255, alpha: 1.0)
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 18)
        
        calendar.weekdayHeight = 22
        calendar.rowHeight = 58
        
        calendar.today = nil
        calendar.register(DIYCalendarCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK:- FSCalendarDataSource
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        return cell
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        self.configure(cell: cell, for: date, at: position)
    }
    
    // MARK:- FSCalendarDelegate

    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition)   -> Bool {
        return monthPosition == .current
    }
    
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        return monthPosition == .current
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        /// nothing selected:
        if firstDate == nil {
            firstDate = date
            datesRange = [date]
            self.configureVisibleCells()
            return
        }

        /// only first date is selected:
        if let first = firstDate, lastDate == nil {
            if date <= first {
                calendar.deselect(first)
                firstDate = date
                datesRange = [first]

                self.configureVisibleCells()
                return
            }

            let range = datesRange(from: first, to: date)
            lastDate = range.last
            for d in range {
                calendar.select(d)
            }
            datesRange = range
            self.configureVisibleCells()
            return
        }

        // both are selected:
        if firstDate != nil && lastDate != nil {
            for d in calendar.selectedDates {
                calendar.deselect(d)
            }
            lastDate = nil
            firstDate = nil
            datesRange = []
            self.configureVisibleCells()
        }
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        for d in calendar.selectedDates {
            calendar.deselect(d)
        }
        lastDate = nil
        firstDate = nil
        datesRange = []
        configureVisibleCells()
    }
    
    func datesRange(from: Date, to: Date) -> [Date] {
        if from > to { return [Date]() }
        var tempDate = from
        var array = [tempDate]
        while tempDate < to {
            if let date = Calendar.current.date(byAdding: .day, value: 1, to: tempDate) {
                tempDate = date
                array.append(tempDate)
            }
        }
        return array
    }

    
    // MARK: - Private functions
    
    private func configureVisibleCells() {
        calendar.visibleCells().forEach { (cell) in
            let date = calendar.date(for: cell)
            let position = calendar.monthPosition(for: cell)
            self.configure(cell: cell, for: date!, at: position)
        }
    }
    
    private func configure(cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        
        let diyCell = (cell as! DIYCalendarCell)
        if position == .current {
            var selectionType = SelectionType.none
            if calendar.selectedDates.contains(date) {
                let previousDate = self.gregorian.date(byAdding: .day, value: -1, to: date)!
                let nextDate = self.gregorian.date(byAdding: .day, value: 1, to: date)!
                if calendar.selectedDates.contains(date) {
                    if calendar.selectedDates.contains(previousDate) && calendar.selectedDates.contains(nextDate) {
                        if getWeekday(date: date) == "월" {
                            selectionType = .leftBorder
                            diyCell.titleLabel.textColor = .black
                        } else if getWeekday(date: date) == "일" {
                            selectionType = .rightBorder
                        } else {
                            selectionType = .middle
                        }
                        diyCell.titleLabel.textColor = .black
                    }
                    else if calendar.selectedDates.contains(previousDate) && calendar.selectedDates.contains(date) {
                        selectionType = .rightBorder
                        diyCell.titleLabel.textColor = UIColor(red: 0 / 255, green: 171 / 255, blue: 182 / 255, alpha: 1.0)
                    }
                    else if calendar.selectedDates.contains(nextDate) {
                        selectionType = .leftBorder
                        diyCell.titleLabel.textColor = UIColor(red: 0 / 255, green: 171 / 255, blue: 182 / 255, alpha: 1.0)
                    }
                    else {
                        selectionType = .single
                    }
                }
            }
            else {
                selectionType = .none
            }
            diyCell.selectionType = selectionType
        } else {
            diyCell.selectionType = .none
        }
    }
    
    // 양 사이드에 날짜가 있을시 둥글게 표현해주기 위함.
    private func getWeekday(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko")
        dateFormatter.dateFormat = "E"
        let date_string = dateFormatter.string(from: date)
        return date_string
    }
}

