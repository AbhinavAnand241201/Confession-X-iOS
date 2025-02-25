import SwiftUI

struct SettingsView: View {
    @Binding var confessions: [Confession]
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Appearance").font(.custom("Avenir", size: 18))) {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                        .font(.custom("Avenir", size: 16))
                        .onChange(of: isDarkMode) { newValue in
                            updateAppearance(newValue)
                        }
                }

                Section(header: Text("Actions").font(.custom("Avenir", size: 18))) {
                    Button("Clear All Confessions") {
                        confessions.removeAll()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(.red)
                }

                Section(header: Text("About").font(.custom("Avenir", size: 18))) {
                    Text("Anonymous Confession App")
                        .font(.custom("Avenir", size: 16))
                    Text("Version 1.0")
                        .font(.custom("Avenir", size: 16))
                    Text("Created with ❤️ by You")
                        .font(.custom("Avenir", size: 16))
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }

    private func updateAppearance(_ isDarkMode: Bool) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.forEach { window in
                window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
            }
        }
    }
}