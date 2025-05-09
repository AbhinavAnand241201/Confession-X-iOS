import SwiftUI

enum PrivacyLevel: String, CaseIterable, Identifiable {
    case anonymous, pseudonym, public
    var id: Self { self }
}

struct PostConfessionView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = PostConfessionViewModel()
    @State private var showImagePicker = false
    @State private var showAudioRecorder = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Your Confession") {
                    TextEditor(text: $viewModel.text)
                        .frame(minHeight: 150)
                        .overlay(alignment: .bottomTrailing) {
                            Text("\(viewModel.text.count)/500")
                                .font(.caption)
                                .foregroundColor(viewModel.text.count > 500 ? .red : .gray)
                                .padding(8)
                        }
                }
                
                Section("Add Media") {
                    HStack(spacing: 20) {
                        Button {
                            showImagePicker = true
                        } label: {
                            Image(systemName: "photo")
                                .frame(width: 44, height: 44)
                                .background(Color.blue.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Button {
                            showAudioRecorder = true
                        } label: {
                            Image(systemName: "mic")
                                .frame(width: 44, height: 44)
                                .background(Color.purple.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        if viewModel.hasMedia {
                            MediaPreview(viewModel: viewModel)
                        }
                    }
                    .buttonStyle(.plain)
                }
                
                Section("Privacy Settings") {
                    Picker("Visibility", selection: $viewModel.privacyLevel) {
                        ForEach(PrivacyLevel.allCases) { level in
                            Text(level.rawValue.capitalized).tag(level)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    if viewModel.privacyLevel == .pseudonym {
                        TextField("Choose a pseudonym", text: $viewModel.pseudonym)
                    }
                }
            }
            .navigationTitle("New Confession")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Post") {
                        Task {
                            await viewModel.postConfession()
                            dismiss()
                        }
                    }
                    .disabled(!viewModel.canPost)
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $viewModel.selectedImage)
            }
            .sheet(isPresented: $showAudioRecorder) {
                AudioRecorderView(audioURL: $viewModel.audioURL)
            }
        }
    }
}

struct MediaPreview: View {
    @ObservedObject var viewModel: PostConfessionViewModel
    
    var body: some View {
        Group {
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(alignment: .topTrailing) {
                        Button {
                            viewModel.selectedImage = nil
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .background(Color.black.opacity(0.7).clipShape(Circle()))
                        }
                        .offset(x: 8, y: -8)
                    }
            } else if viewModel.audioURL != nil {
                Image(systemName: "waveform")
                    .frame(width: 44, height: 44)
                    .background(Color.purple.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}
