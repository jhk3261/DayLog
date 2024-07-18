//
//  ResultView.swift
//  DayLog
//
//  Created by 감자의 맥북 on 7/18/24.
//

import SwiftUI

struct ResultView: View {
    let totalGoals: Int
    let achievedGoals: Int
    let diaryEntriesThisMonth: Int
    
    var todayGoalAchievementRate: Double {
        guard totalGoals > 0 else { return 0.0 }
        return (Double(achievedGoals) / Double(totalGoals)) * 100.0
    }
    
    var thisMonthDiaryEntryRate: Double {
        let daysInMonth = Calendar.current.range(of: .day, in: .month, for: Date())?.count ?? 30
        return (Double(diaryEntriesThisMonth) / Double(daysInMonth)) * 100.0
    }
    
    @Binding var showResultView: Bool
    @Binding var totalGoalsInput: String
    @Binding var achievedGoalsInput: String
    @Binding var diaryEntriesInput: String

    var body: some View {
        VStack {
            Spacer()
            Text("오늘의 목표달성률")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("\(todayGoalAchievementRate, specifier: "%.2f")%")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundStyle(Color("FontColor"))
            
            Text("이 달의 일기 작성률")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top, 30)
            Text("\(thisMonthDiaryEntryRate, specifier: "%.2f")%")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundStyle(Color("FontColor"))
            Spacer()
            Button("다시하기") {
                totalGoalsInput = ""
                achievedGoalsInput = ""
                diaryEntriesInput = ""
                showResultView = false
            }
            .frame(width: 300,height: 40)
            .padding()
            .background(Color("MyColor"))
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.bold)
            .cornerRadius(25)
        }
        .padding(.bottom, 9.5)
    }
}


#Preview {
    ResultView(
            totalGoals: 5,
            achievedGoals: 3,
            diaryEntriesThisMonth: 10,
            showResultView: .constant(true),
            totalGoalsInput: .constant("5"),
            achievedGoalsInput: .constant("3"),
            diaryEntriesInput: .constant("10")
        )
}
