//
//  PostConfessionView.swift
//  AnonymousConfessionApp
//
//  Created by ABHINAV ANAND  on 22/02/25.
//


import SwiftUI

struct PostConfessionView: View {
    @Binding var confessions: [Confession]
    @State private var confessionText = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                TextField("Write your confession...", text: $confessionText)
                    .font(.custom("Avenir", size: 16))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button("Post Confession") {
                    let newConfession = Confession(text: confessionText, timestamp: Date(), reactions: [:])
                    withAnimation(.spring()) {
                        confessions.insert(newConfession, at: 0)
                    }
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.custom("Avenir", size: 16))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .disabled(confessionText.isEmpty)
            }
            .padding()
            .navigationTitle("Post Confession")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}