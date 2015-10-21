# coding: utf-8
class TapController < UIViewController
  def initWithNibName(name, bundle:bundle)
    super

    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemFavorites, tag:1)
    self
  end
  
  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    puts "TapController"

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Taps(#{self.navigationController.viewControllers.count})"
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
    self.view.addSubview @label

    self.title = "Tap(#{self.navigationController.viewControllers.count})"

    right_button = UIBarButtonItem.alloc.initWithTitle("押せ!", style:UIBarButtonItemStyleBordered, target:self, action:'pushbutton')
    self.navigationItem.rightBarButtonItem = right_button
  end

  def pushbutton
    new_controller = TapController.alloc.initWithNibName(nil, bundle:nil)
    self.navigationController.pushViewController(new_controller, animated:true)
  end
end
