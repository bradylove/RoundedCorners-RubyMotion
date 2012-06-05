class RootViewController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor

    @rounded_rect = UIView.alloc.initWithFrame(
      [[view.size.width / 2 - 100, view.size.height / 2 - 100], [200, 200]])
    @rounded_rect.backgroundColor = UIColor.greenColor

    mask_path = UIBezierPath.bezierPathWithRoundedRect(@rounded_rect.bounds,
                                                       byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomRight,
                                                       cornerRadii:       CGSizeMake(40.0, 100.0))
    mask_layer = CAShapeLayer.layer
    mask_layer.frame = @rounded_rect.bounds
    mask_layer.path = mask_path.CGPath
    @rounded_rect.layer.mask = mask_layer

    @non_rounded_subview = UIView.alloc.initWithFrame(@rounded_rect.bounds)
    @non_rounded_subview.backgroundColor = UIColor.colorWithRed(1.0, green: 0.0, blue: 0.0, alpha: 0.5)

    @rounded_rect.addSubview @non_rounded_subview
    view.addSubview @rounded_rect
  end
end
