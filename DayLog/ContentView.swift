//
//  ContentView.swift
//  DayLog
//
//  Created by 감자의 맥북 on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var todayDate = Date()
    @State private var totalGoals = ""
    @State private var achievedGoals = ""
    @State private var diaryEntriesThisMonth = ""
    @State private var showResultView = false
    @State private var showOnboarding = true
    
    var body: some View {
        NavigationView {
            VStack {
                if showOnboarding {
                    OnboardingView(showOnboarding: $showOnboarding)
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut, value: showOnboarding)
                } else {
                    if showResultView {
                        ResultView(
                            totalGoals: Int(totalGoals) ?? 0,
                            achievedGoals: Int(achievedGoals) ?? 0,
                            diaryEntriesThisMonth: Int(diaryEntriesThisMonth) ?? 0,
                            showResultView: $showResultView,
                            totalGoalsInput: $totalGoals,
                            achievedGoalsInput: $achievedGoals,
                            diaryEntriesInput: $diaryEntriesThisMonth
                        )
                    } else {
                        MainView(
                            todayDate: $todayDate,
                            totalGoals: $totalGoals,
                            achievedGoals: $achievedGoals,
                            diaryEntriesThisMonth: $diaryEntriesThisMonth,
                            showResultView: $showResultView
                        )
                        .animation(.default, value: showResultView)
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
