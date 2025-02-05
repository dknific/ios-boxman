import SwiftUI
import RealityKit

struct ARExperienceView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                RealityKitScene().edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct RealityKitScene: UIViewRepresentable {
    static var arView: ARView?

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let model = try! Entity.load(named: "breakdance")

        // Plane tracking
        let anchor: AnchorEntity = AnchorEntity(
            .plane(
                .horizontal,
                classification: .any,
                minimumBounds: SIMD2<Float>(0.2, 0.2)
            )
        )
        anchor.children.append(model)
        arView.scene.anchors.append(anchor)
        
        // Run animations after meshes have been added to anchor
        // Or else they will never start!
        for anim in model.availableAnimations {
            model.playAnimation(
                anim.repeat(duration: .infinity),
                transitionDuration: 1.25,
                startsPaused: false
            )
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
