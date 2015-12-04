import UIKit

let maxNumOfSets = 3
let π:CGFloat = CGFloat(M_PI)

//Class to create the counter uiView
@IBDesignable class CounterView: UIView {
    
    @IBInspectable var counterTotal: Int = maxNumOfSets
    @IBInspectable var counter: Int = 0 {
        didSet {
            if counter <=  maxNumOfSets {
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let arcWidth: CGFloat = 76

        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4

        let path = UIBezierPath(arcCenter: center,
            radius: radius/2 - arcWidth/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)

        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()

        let angleDifference: CGFloat = 2 * π - startAngle + endAngle
        
        let arcLengthPerSet = angleDifference / CGFloat(maxNumOfSets)

        let outlineEndAngle = arcLengthPerSet * CGFloat(counter) + startAngle

        let outlinePath = UIBezierPath(arcCenter: center,
            radius: bounds.width/2 - 2.5,
            startAngle: startAngle,
            endAngle: outlineEndAngle,
            clockwise: true)
        
        outlinePath.addArcWithCenter(center,
            radius: bounds.width/2 - arcWidth + 2.5,
            startAngle: outlineEndAngle,
            endAngle: startAngle,
            clockwise: false)
        
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
    }
}
