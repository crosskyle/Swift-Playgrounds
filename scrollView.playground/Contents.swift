//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import MapKit

class TestViewController : UIViewController {
    
    let capitalLabel = UILabel()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    let contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add the scroll view to self.view
        view.addSubview(scrollView)

        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(contentView)

        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        let location = CLLocationCoordinate2D(latitude: 32.7767, longitude: 96.7970)
        let regionRadius: CLLocationDistance = CLLocationDistance(10000)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mapView)
        
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            ])
        
        let guide = contentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
            ])
        
        let constraint = NSLayoutConstraint(item: mapView,
                                            attribute: NSLayoutAttribute.height,
                                            relatedBy: NSLayoutRelation.equal,
                                            toItem: view,
                                            attribute: NSLayoutAttribute.height,
                                            multiplier: 0.5,
                                            constant: 0)
        view.addConstraint(constraint)
        
        
        
        
        
        capitalLabel.text = "Consider now provided laughter boy landlord dashwood. Often voice and the spoke. No shewing fertile village equally prepare up females as an. That do an case an what plan hour of paid. Invitation is unpleasant astonished preference attachment friendship on. Did sentiments increasing particular nay. Mr he recurred received prospect in. Wishing cheered parlors adapted am at amongst matters.\nConsider now provided laughter boy landlord dashwood. Often voice and the spoke. No shewing fertile village equally prepare up females as an. That do an case an what plan hour of paid. Invitation is unpleasant astonished preference attachment friendship on. Did sentiments increasing particular nay. Mr he recurred received prospect in. Wishing cheered parlors adapted am at amongst matters.Consider now provided laughter boy landlord dashwood. Often voice and the spoke. No shewing fertile village equally prepare up females as an. That do an case an what plan hour of paid. Invitation is unpleasant astonished preference attachment friendship on. Did sentiments increasing particular nay. Mr he recurred received prospect in. Wishing cheered parlors adapted am at amongst matters.\nConsider now provided laughter boy landlord dashwood. Often voice and the spoke. No shewing fertile village equally prepare up females as an. That do an case an what plan hour of paid. Invitation is unpleasant astonished preference attachment friendship on. Did sentiments increasing particular nay. Mr he recurred received prospect in. Wishing cheered parlors adapted am at amongst matters.Consider now provided laughter boy landlord dashwood. Often voice and the spoke. No shewing fertile village equally prepare up females as an. That do an case an what plan hour of paid. Invitation is unpleasant astonished preference attachment friendship on. Did sentiments increasing particular nay. Mr he recurred received prospect in. Wishing cheered parlors adapted am at amongst matters.\nConsider now provided laughter boy landlord dashwood. Often voice and the spoke. No shewing fertile village equally prepare up females as an. That do an case an what plan hour of paid. Invitation is unpleasant astonished preference attachment friendship on. Did sentiments increasing particular nay. Mr he recurred received prospect in. Wishing cheered parlors adapted am at amongst matters."
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalLabel.numberOfLines = 0
        
        contentView.addSubview(capitalLabel)
        
        let contentGuide = contentView.readableContentGuide
        capitalLabel.leadingAnchor.constraint(equalTo: contentGuide.leadingAnchor).isActive = true
        capitalLabel.trailingAnchor.constraint(equalTo: contentGuide.trailingAnchor).isActive = true
        capitalLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 0).isActive = true
        capitalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }

    
}


let vc = TestViewController()
PlaygroundPage.current.liveView = vc
