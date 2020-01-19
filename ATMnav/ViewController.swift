
import UIKit
import ARCL
import CoreLocation
import SceneKit


class ViewController: UIViewController {

    var sceneLocationView = SceneLocationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneLocationView.run()
        view.addSubview(sceneLocationView)
        
        ARINIT()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sceneLocationView.frame = view.bounds
    }
    
    func ARINIT()  {
       
        var location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 43.463690, longitude: -80.521630), altitude: 0)
        let image = UIImage(named: "test")!
        var annotationNode = LocationAnnotationNode(location: location, image: image)
        annotationNode.annotationNode.name = "RBC Uptown Waterloo"
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
        
        location  = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 43.474041, longitude: -80.527809), altitude: 100)
        annotationNode = LocationAnnotationNode(location: location, image: image)
        annotationNode.annotationNode.name = "RBC on Laurier University"
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
        
        location  = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 43.476110, longitude: -80.524550), altitude: 100)
        annotationNode = LocationAnnotationNode(location: location, image: image)
        annotationNode.annotationNode.name = "RBC on King&University"
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
        
        location  = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 43.461150, longitude: -80.536940), altitude: 100)
        annotationNode = LocationAnnotationNode(location: location, image: image)
        annotationNode.annotationNode.name = "RBC on Westmount&Erb"
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
        
        annotationNode = LocationAnnotationNode(location: nil, image: image)
        sceneLocationView.addLocationNodeForCurrentPosition(locationNode:annotationNode) // Current location
        annotationNode.annotationNode.name = "My Location"
        
    }
    
    // Touch events on nodes
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneLocationView)
            
            let hitResults = sceneLocationView.hitTest(touchLocation, options: [.boundingBoxOnly : true])
            for result in hitResults {
                
                print("HIT:-> Name: \(result.node.description)")
                print("HIT:-> description  \(result.node.name)")
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
}

@available(iOS 11.0, *)
extension ViewController: SceneLocationViewDelegate {
    func sceneLocationViewDidAddSceneLocationEstimate(sceneLocationView: SceneLocationView, position: SCNVector3, location: CLLocation) {
        print("add scene location estimate, position: \(position), location: \(location.coordinate), accuracy: \(location.horizontalAccuracy), date: \(location.timestamp)")
    }
    
    func sceneLocationViewDidRemoveSceneLocationEstimate(sceneLocationView: SceneLocationView, position: SCNVector3, location: CLLocation) {
        print("remove scene location estimate, position: \(position), location: \(location.coordinate), accuracy: \(location.horizontalAccuracy), date: \(location.timestamp)")
    }
    
    func sceneLocationViewDidConfirmLocationOfNode(sceneLocationView: SceneLocationView, node: LocationNode) {
        print("7845768")
    }
    
    func sceneLocationViewDidSetupSceneNode(sceneLocationView: SceneLocationView, sceneNode: SCNNode) {
        print("546456")
    }
    
    func sceneLocationViewDidUpdateLocationAndScaleOfLocationNode(sceneLocationView: SceneLocationView, locationNode: LocationNode) {
    }
}
