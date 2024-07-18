//
//  MainVieq.swift
//  DayLog
//
//  Created by 감자의 맥북 on 7/18/24.
//

import SwiftUI

struct MainView: View {
    @Binding var todayDate: Date
    @Binding var totalGoals: String
    @Binding var achievedGoals: String
    @Binding var diaryEntriesThisMonth: String
    @Binding var showResultView: Bool
    
    var body: some View {
        VStack {
            DatePicker("오늘 날짜", selection: $todayDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            Spacer()
            VStack(alignment: .leading){
                Text("오늘 목표 개수")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom,5)
                TextField("", text: $totalGoals)
                    .frame(width:250)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom,15)
                Text("오늘 달성한 목표 개수")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom,5)
                TextField("", text: $achievedGoals)
                    .frame(width:250)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom,15)
                Text("이번 달 일기 작성 횟수")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom,5)
                TextField("", text: $diaryEntriesThisMonth)
                    .frame(width:250)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom,15)
            }.padding([.leading,.bottom], 10)
            Spacer()
            Button("계산하기") {
                withAnimation {
                    showResultView = true
                }
            }
            .frame(width: 300,height: 40)
            .padding()
            .background(Color("MyColor"))
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.bold)
            .cornerRadius(25)
        }
        .padding()
    }
}


#Preview {
    MainView(
            todayDate: .constant(Date()),
            totalGoals: .constant(""),
            achievedGoals: .constant(""),
            diaryEntriesThisMonth: .constant(""),
            showResultView: .constant(false)
        )
}
