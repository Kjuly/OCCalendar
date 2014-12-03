Pod::Spec.new do |s|
  s.name             = "OCCalendar-Ext"
  s.version          = "0.1.8"
  s.summary          = "An extension lib of OCCalendar"
  s.description      = <<-DESC
                       This lib is an extension lib of OCCalendar, and it is a very simple component for iPhone/iPad that provides a 'Popover' date picker controller.
                       DESC
  s.homepage         = "https://github.com/Kjuly/OCCalendar"
  s.license          = 'MIT'
  s.author           = { "Kaijie Yu" => "dev@kjuly.com" }
  s.source           = { :git => "https://github.com/Kjuly/OCCalendar.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'OCCalendarView'

  s.frameworks = 'UIKit', 'CoreGraphics'
end
