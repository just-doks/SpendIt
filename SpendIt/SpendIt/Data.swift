//
//  Data.swift
//  dataTest
//
//  Created by Дмитрий Докукин on 30/07/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct AllInOne: Identifiable {
    
    var id: Int // Нужен для отрисовки списка
    var value: Int // для коррекции списка, хранит индексы элементов
    var money: Float
    var description: String
    var date: Date
    /*
    init(id: Int, value: Int, money: Float, description: String, date: Date) {
        self.id = id
        self.value = value
        self.money = money
        self.description = description
        self.date = date
    } */
}

var Money: [Float] = []
var Description: [String] = []
var fullDate: [Date] = []

var BigArray: [AllInOne] = [] // не работает

var idAmount: Int = 0


// Есть проблема
// Выдаёт ошибку после прекращения использования тестовой функции
// В остальных сценариях проблем нет
func transit(money: [Float], description: [String], date: [Date]) -> ([AllInOne]) {
    var array: [AllInOne] = []
    for i in 0..<date.count {
        array.append(AllInOne(id: i, value: i, money: money[i], description: description[i], date: date[i]))
    }
    idAmount = date.count
    return array;
}

func retransit(array: [AllInOne]) -> () {
    Money = []
    Description = []
    fullDate = []
    
    if (array.count == 0) {return}
    for i in 0..<array.count {
        Money.append(array[i].money)
        Description.append(array[i].description)
        fullDate.append(array[i].date)
    }
}


func saveData(array: [AllInOne]) {
    retransit(array: array)
    UserDefaults.standard.set(Money, forKey: "moneyKey")
    UserDefaults.standard.set(Description, forKey: "descriptionKey")
    UserDefaults.standard.set(fullDate, forKey: "dateKey")
    UserDefaults.standard.synchronize()
}

func loadData() {
    if let array1 = UserDefaults.standard.array(forKey: "moneyKey") as? [Float] {
        Money = array1
    } else { Money = []}
    if let array2 = UserDefaults.standard.array(forKey: "descriptionKey") as? [String] {
        Description = array2
    } else { Description = []}
    if let array3 = UserDefaults.standard.array(forKey: "dateKey") as? [Date] {
        fullDate = array3
    } else { fullDate = []}
}



func reverse(array: [AllInOne]) -> ([AllInOne]) {
    var nestedArray: [AllInOne] = []
    if (array.count == 0) {return [] }
    if (array.count == 1) {return array}
    for i in 1...array.count {
        nestedArray.append(array[(array.count - i)])
    }
    return nestedArray
}

// Не актуально
//--------------------
func restoreID(eArray: [AllInOne]) -> ([AllInOne]) {
    var array: [AllInOne] = eArray
    for i in 0..<eArray.count {
        array[i].id = i
    }
    return array
} //-----------------

func restoreValue(for arr: [AllInOne]) -> ([AllInOne]) {
    var array: [AllInOne] = arr
    for i in 0..<arr.count {
        if (array[i].value == i) { continue } // может вызывать ошибки
        array[i].value = i
    }
    return array
}
// работоспособность не проверена
// News:
// работает
func restoreValue(for arr: [AllInOne], from position: Int) -> ([AllInOne]) {
    var array: [AllInOne] = arr
    if (position == arr.count) { return array }
    for i in position..<arr.count {
        array[i].value = i
    }
    return array
}
//-------------------------

// Только при запуске! Для расчёта использует все значения
func averageSpend(array: [AllInOne]) -> (Float) {
    if (array.count == 0) { return 0.0}
    let amount: Int = array.count
    var number: Int = 0
    for i in 0..<array.count {
        number += Int(array[i].money * 100) / amount
    }
    return Float(number)/100
}

//При изменении, добавлении и удалении элемента
func averageSpend(count: Int, total: Float) -> (Float) {
    if (count == 0) { return 0.0}
    var number: Float = 0
    number = total/Float(count)
    return Float(Int(number*100))/100
}

/*
func averageSpend(count: Int, total: Float, previous value: Float, new x: Float) -> (Float) {
    if (count == 0) { return 0.0}
    let amount: Float = Float(count)
    var number: Float = 0
    
    number = (total - value + x)/(amount-1)
    return number
}

// При удалении элемента
func averageSpend(count: Int, total: Float, value: Float) -> (Float) {
    if (count == 0) { return 0.0}
    let amount: Float = Float(count)
    var number: Float = 0
    
    number = (total - value)/(amount-1)
    return number
}

//При добавлении элемента
func averageSpend(count: Int, total: Float, new x: Float) -> (Float) {
    if (count == 0) { return 0.0}
    let amount: Float = Float(count)
    var number: Float = 0
    
    number = (total + x)/amount
    return number
}
*/

// При изменении
func totalSpend(total: Float, previous: Float, new: Float) -> (Float) {
    return total - previous + new
}
// При добавлении
func totalSpend(total: Float, new_Value: Float) -> (Float) {
    return total + new_Value
}

// При удалении
func totalSpend(total: Float, deleted_value: Float) -> (Float) {
    return total - deleted_value
}

// Только при запуске! Считает по всем значениям, тратит очень много времени.
func totalSpend(array: [AllInOne]) -> (Float) {
    if (array.count == 0) { return 0.0}
    var number: Float = 0
    for i in 0..<array.count {
        number += array[i].money
    }
    return number
}

func makeString(from date: Date, as type: DateType) -> (String) {
    let calendar = Calendar.current
    var str: String = ""
    switch(type) {
    case .date:
        let day = String(calendar.component(.day, from: date))
        let month = String(calendar.component(.month, from: date))
        let year = String(calendar.component(.year, from: date))
        str = day+"/"+month+"/"+year
        break
    case .time:
        let hour = String(calendar.component(.hour, from: date))
        let minute = String(calendar.component(.minute, from: date))
        str = hour + ":" + ((Int(calendar.component(.minute, from: date)) > 9) ? minute : ("0" + minute))
        break
    }
    return str
}

enum DateType {
    case date
    case time
}

//Test func
func initializeFunc(_ x: Int) -> ([AllInOne]) {
    var arr: [AllInOne] = []
    for i in 0..<x {
        arr.append(AllInOne(id: i, value: i, money: Float(i), description: "Трата "+String(i+1), date: Date(timeIntervalSinceNow: TimeInterval(-3600*(x-i)))))
    }
    idAmount = x
    return arr
}

// Не работает
//---------------
func saveDataNEW(array: [AllInOne]) {
    //BigArray = []
    BigArray = array
    //UserDefaults.standard.setValue(BigArray, forKey: "BigArrKey")
    UserDefaults.setValue(BigArray, forKey: "BigKey") //(BigArray, forKey: "BigArrKey")
    //UserDefaults.standard.synchronize()
}

func loadDataNEW() {
    if let barr = UserDefaults.standard.array(forKey: "BigKey") as? [AllInOne] {
        BigArray = barr
    } else { BigArray = [] }
}
//--------------------
