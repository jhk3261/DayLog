//
//  OnboardingView.swift
//  DayLog
//
//  Created by 감자의 맥북 on 7/18/24.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var showOnboarding: Bool

    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .padding(.bottom,40)
//            Text("환영합니다!")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundStyle(Color("TitleColor"))
//                .padding(5)
            Text("오늘 얼마나 목표를 향해 달렸는지 데이로그와 함께 알아보아요!")
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("FontColor"))
                .fontWeight(.bold)
            Spacer()
            Button("시작하기") {
                withAnimation {
                    showOnboarding = false
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
    OnboardingView(showOnboarding: .constant(true))
}

