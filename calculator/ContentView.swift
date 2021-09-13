//
//  ContentView.swift
//  calculator
//
//  Created by ธนัท แสงเพิ่ม on 12/9/2564 BE.
//

import SwiftUI

class ViewModel:ObservableObject{
    @Published var value1 = "0"
    
    @Published var value2 = "0"
    
    @Published var operation = ""
    
    var first = true
    
    func fillNumber(num:Int){
        if first{
            if value1 == "0" || value1 == "-0"{
                value1 = ""
            }
            value1 += String(num)
        }else{
            if value2 == "0" || value2 == "-0"{
                value2 = ""
            }
            value2 += String(num)
        }
    }
    
    func fillDot(){
        if first{
            if value1.split(separator: ".").count == 1{
                value1 += String(".")
            }
        }else{
            if value2.split(separator: ".").count == 1{
                value2 += String(".")
            }
        }
    }
    
    func opera(op:String){
        first = false
        operation = op
        value2 = "0"
    }
    
    func cal(){
        if operation == "+"{
            value1 = String(Double(value1)! + Double(value2)!)
        }else if operation == "-"{
            value1 = String(Double(value1)! - Double(value2)!)
        }else if operation == "X"{
            value1 = String(Double(value1)! * Double(value2)!)
        }else if operation == "/"{
            value1 = String(Double(value1)! / Double(value2)!)
        }
        checkDot()
        first = true
    }
    
    func clear(){
        if first{
            value1 = "0"
        }else{
            value2 = "0"
        }
    }
    
    func minus(){
        if first{
            value1 = String(Double(value1)! * -1)
        }else{
            value2 = String(Double(value2)! * -1)
        }
        checkDot()
    }
    
    func percent(){
        if first {
            value1 = String(Double(value1)! / 100)
        }else{
            value2 = String(Double(value2)! / 100)
        }
        checkDot()
    }
    
    func checkDot(){
        let temp = value2.split(separator: ".")
        if temp.count == 2{
            if temp[1] == "0"{
                value2 = String(temp[0])
            }
        }
        let temp2 = value1.split(separator: ".")
        if temp2.count == 2{
            if temp2[1] == "0"{
                value1 = String(temp2[0])
            }
        }
    }
}

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    var darkgray = Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    if vm.first{
                        Text("\(vm.value1)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding()
                    }else{
                        Text("\(vm.value2)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding()
                    }
                }
                HStack{
                    Button("C",action:vm.clear)
                        .frame(width: 90, height: 90)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("+/-",action:vm.minus)
                        .frame(width: 90, height: 90)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("%",action:vm.percent)
                        .frame(width: 90, height: 90)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("/",action:{vm.opera(op:"/")})
                        .frame(width: 90, height: 90)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                }
                .padding(.all,2)
                HStack{
                    Button("7",action:{vm.fillNumber(num: 7)})
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("8",action:{vm.fillNumber(num: 8)})
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("9",action:{vm.fillNumber(num: 9)})
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("X",action:{vm.opera(op:"X")})
                        .frame(width: 90, height: 90)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                }
                .padding(.all,2)
                HStack{
                    Button("4",action:{vm.fillNumber(num: 4)})
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("5",action:{vm.fillNumber(num: 5)})
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("6",action:{vm.fillNumber(num: 6)})
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("-",action:{vm.opera(op:"-")})
                        .frame(width: 90, height: 90)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                }
                .padding(.all,2)
                HStack{
                    Button("1",action:{vm.fillNumber(num: 1)})
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("2",action:{vm.fillNumber(num: 2)})
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("3",action:{vm.fillNumber(num: 3)})
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("+",action:{vm.opera(op:"+")})
                        .frame(width: 90, height: 90)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                }
                .padding(.all,2)
                HStack{
                    Button("0",action:{vm.fillNumber(num: 0)})
                        .frame(width: 194, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button(".",action:vm.fillDot)
                        .frame(width: 90, height: 90)
                        .background(darkgray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                    Button("=",action:vm.cal)
                        .frame(width: 90, height: 90)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(45)
                }
                .padding(.all,2)
            }
            .background(Color.black)
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
