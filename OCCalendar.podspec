Pod::Spec.new do |s|

s.name              = 'OCCalendar'
s.version           = '0.1.8'
s.summary           = 'OCCalendar is a very simple component for iPhone/iPad that provides a \'Popover\' date picker controller.'
s.homepage          = 'https://github.com/joaomvfsantos/OCCalendar'
s.license           = {
:type => 'BSD',
:file => 'LICENSE'
}
s.author            = {
"Oliver Clark Rickard" => "help@mobileworldsoftware.com"
}
s.source            = {
:git => 'https://github.com/joaomvfsantos/OCCalendar.git',
:tag => s.version.to_s
}
s.platform          = :ios, '6.0'
s.source_files      = 'OCCalendarView/*.{m,h}'
s.requires_arc      = true
s.framework    = 'UIKit'

end