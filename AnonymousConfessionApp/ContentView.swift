import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    @State private var showAudioRecorder = false
    @State private var activeTab: Tab = .home
    
    // Enhanced tab enum
    enum Tab: String, CaseIterable {
        case home, explore, record, notifications, profile
        
        var icon: String {
            switch self {
            case .home: return "house"
            case .explore: return "magnifyingglass"
            case .record: return "plus"
            case .notifications: return "bell"
            case .profile: return "person"
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                // Main Content
                TabView(selection: $activeTab) {
                    HomeView()
                        .tag(Tab.home)
                    
                    ExploreView()
                        .tag(Tab.explore)
                    
                    Color.clear // Placeholder for record tab
                        .tag(Tab.record)
                    
                    NotificationsView()
                        .tag(Tab.notifications)
                    
                    ProfileView()
                        .tag(Tab.profile)
                }
                
                // Custom Floating Tab Bar
                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Button {
                            if tab == .record {
                                showAudioRecorder = true
                            } else {
                                activeTab = tab
                            }
                        } label: {
                            ZStack {
                                if tab == .record {
                                    Circle()
                                        .fill(LinearGradient(
                                            colors: [.purple, .blue],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing))
                                        .frame(width: 56, height: 56)
                                        .offset(y: -15)
                                        .shadow(color: .blue.opacity(0.3), radius: 10)
                                }
                                
                                Image(systemName: tab.icon)
                                    .font(tab == .record ? .title : .body)
                                    .foregroundColor(activeTab == tab ? .primary : .secondary)
                                    .offset(y: tab == .record ? -15 : 0)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(TabButtonStyle(isActive: activeTab == tab))
                    }
                }
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .padding(.horizontal, 24)
                .padding(.bottom, 8)
            }
            .sheet(isPresented: $showAudioRecorder) {
                AudioConfessionView()
            }
        }
        .environmentObject(appState)
    }
}

struct TabButtonStyle: ButtonStyle {
    let isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: configuration.isPressed)
            .foregroundColor(isActive ? .blue : .gray)
    }
}
