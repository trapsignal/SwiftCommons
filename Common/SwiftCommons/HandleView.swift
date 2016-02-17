// ----------------------------------------------------------------------------
//
//  HandleView.swift
//
//  @author     Vasily Ivanov <vasily.ivanov.jukebox@gmail.com>
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

@IBDesignable class HandleView: UIView
{
    // MARK: - Construction
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInitialization()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInitialization()
    }
    
    private func commonInitialization()
    {
        self.gestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        addGestureRecognizer(self.gestureRecognizer)
    }
    
    deinit {
        removeGestureRecognizer(self.gestureRecognizer)
    }
    
    // MARK: - Properties
    
    @IBOutlet weak var constraint: NSLayoutConstraint?
    
    @IBInspectable var imageName: String? {
        didSet {
            guard let name = imageName,
                let image = UIImage(named: name) else {
                    return
            }
            
            if let imageView = self.imageView {
                imageView.image = image
            } else {
                self.imageView = UIImageView(image: image)
            }
        }
    }
    
    // MARK: - Functions
    
    override func intrinsicContentSize() -> CGSize {
        if let imageView = self.imageView {
            return imageView.intrinsicContentSize()
        }
        
        return super.intrinsicContentSize()
    }
    
    // MARK: - Actions
    
    func handlePanGesture(sender: UIPanGestureRecognizer)
    {
        guard let constraint = self.constraint,
            let view = (constraint.firstItem as? UIView)
                ?? (constraint.secondItem as? UIView) else
        {
            return
        }
        
        if sender.state == .Began {
            previousPoint = nil
        }
        
        let currentPoint = sender.translationInView(view)
        if let previousPoint = previousPoint {
            let diff = getDifference(previousPoint, currentPoint)
            constraint.constant += diff
        }
        previousPoint = currentPoint
    }
    
    // MARK: - Private Functions
    
    private func getDifference(firstPoint: CGPoint, _ secondPoint: CGPoint) -> CGFloat
    {
        switch getDirection()
        {
        case .Horizontal:
            return secondPoint.x - firstPoint.x
        case .Vertical:
            return secondPoint.y - firstPoint.y
        default:
            return 0.0
        }
    }
    
    private func getDirection() -> Direction
    {
        guard let constraint = self.constraint else {
            return .Unknown
        }
        
        let firstDirection = HandleView.attributeToDirection(constraint.firstAttribute)
        let secondDirection = HandleView.attributeToDirection(constraint.secondAttribute)
        return firstDirection != .Unknown ? firstDirection : secondDirection
    }
    
    private static func attributeToDirection(attribute: NSLayoutAttribute) -> Direction
    {
        switch attribute
        {
        case .Height:
            return .Vertical
        case .Width:
            return .Horizontal
        default:
            return .Unknown
        }
    }
    
    // MARK: - Inner Types
    
    enum Direction : UInt8
    {
        case Unknown
        case Horizontal
        case Vertical
    }
    
    // MARK: - Variables
    
    private var previousPoint: CGPoint?
    
    private var gestureRecognizer: UIPanGestureRecognizer!
    
    private var imageView: UIImageView? {
        didSet(prevImageView) {
            if let prevImageView = prevImageView {
                prevImageView.removeFromSuperview()
            }
            
            if let imageView = imageView {
                addSubview(imageView)
            }
        }
    }
    
}

// ----------------------------------------------------------------------------
