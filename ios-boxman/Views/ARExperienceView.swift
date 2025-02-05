import SwiftUI
import ARKit
import RealityKit

struct ARExperienceView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            RealityKitScene().edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.system(size: 36))
                            .padding(.leading, 32)
                            .padding(.bottom, 12)
                    }
                    
                    Spacer()
                }
                
            }
        }
        .toolbar(.hidden)
    }
}

struct RealityKitScene: UIViewRepresentable {
    static var arView: ARView?

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)
        
        let model = try! Entity.load(named: "boxman")

        // Plane tracking
        let anchor: AnchorEntity = AnchorEntity(
            .plane(
                .horizontal,
                classification: .any,
                minimumBounds: SIMD2<Float>(0.1, 0.1)
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
