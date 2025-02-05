import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Boxman!")
                    .font(.system(size: 64))
                    .italic()
                
                Text("Look at him go...")
                
                NavigationLink(destination: ARExperienceView()) {
                    Text("Make Him Go!")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
