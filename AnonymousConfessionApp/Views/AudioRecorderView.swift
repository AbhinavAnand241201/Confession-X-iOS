//
//  AudioRecorderView.swift
//  AnonymousConfessionApp
//
//  Created by ABHINAV ANAND  on 09/05/25.
//


import SwiftUI
import AVFoundation

struct AudioRecorderView: View {
    @Binding var audioURL: URL?
    @StateObject private var recorder = AudioRecorderViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                // Waveform Visualization
                ZStack {
                    if recorder.amplifiers.isEmpty {
                        Text("Press record to begin")
                            .foregroundColor(.secondary)
                    } else {
                        WaveformView(amplifiers: recorder.amplifiers)
                    }
                }
                .frame(height: 200)
                .padding(.vertical)
                
                // Recording Controls
                HStack(spacing: 40) {
                    Button {
                        recorder.deleteRecording()
                        audioURL = nil
                    } label: {
                        Image(systemName: "trash")
                            .font(.title)
                            .foregroundColor(.red)
                    }
                    .disabled(!recorder.hasRecording)
                    
                    Button {
                        if recorder.isRecording {
                            recorder.stopRecording()
                        } else {
                            recorder.startRecording()
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(recorder.isRecording ? .red : .blue)
                                .frame(width: 70, height: 70)
                            
                            Image(systemName: recorder.isRecording ? "stop.fill" : "mic.fill")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button {
                        if let url = recorder.recordingURL {
                            audioURL = url
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                    .disabled(!recorder.hasRecording)
                }
                
                // Recording Timer
                Text(recorder.formattedTime)
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
            }
            .padding()
            .navigationTitle("Record Audio")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .onDisappear {
                if audioURL == nil {
                    recorder.deleteRecording()
                }
            }
        }
    }
}

struct WaveformView: View {
    let amplifiers: [CGFloat]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let barWidth: CGFloat = 3
            let spacing: CGFloat = 1
            let totalBars = Int(width / (barWidth + spacing))
            let visibleAmps = Array(amplifiers.suffix(totalBars))
            
            HStack(alignment: .center, spacing: spacing) {
                ForEach(0..<visibleAmps.count, id: \.self) { index in
                    let normalizedHeight = visibleAmps[index] * 100
                    
                    RoundedRectangle(cornerRadius: barWidth/2)
                        .fill(LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .top,
                            endPoint: .bottom))
                        .frame(
                            width: barWidth,
                            height: max(2, normalizedHeight)
                        )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}