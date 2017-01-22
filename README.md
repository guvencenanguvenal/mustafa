<img src="https://cloud.githubusercontent.com/assets/11555504/21957574/e89ce81e-daa1-11e6-9bde-8b505ac4a5d7.png" width="100" height="150" />

# mustafa

Mustafa is MVC Framework For Crystal Language

# Getting Started :sunglasses:

Add your `shard.yml` and install lib. Yes it's ready! Build your MVC project.

# Installation :star:

Add this to your application's `shards.yml`

```
dependencies:
  mustafa:
    github: guvencenanguvenal/mustafa
    branch: master
```

# Route :rocket:

*http://localhost/welcome*

call controller which name is Welcome

*http://localhost/welcome/hello*

call controller which name is Welcome and run action(method) which name is "hello"

*http://localhost/welcome/hello/param1/param2*

call controller which name is Welcome and run action(method) which name is "hello" and.. 

```
Library.input.params 0 => "param1"
Library.input.params 1 => "param2"
```
>**Note:** params is not get or post

# Configuration :mag_right:

Configuration file is config.cr on src/mustafa/config/config.cr
```
DEFAULT_CONTROLLER = "your default controller" #this controller is default which response http://localhost/ 
MODULE_NAME = "your module name"
VIEW_PATH = "src/your module name/view" # ./src/mustafa/view/ecr_file.ecr
```
and choose your localhost
```
LOCALHOST_ADDRESS = "0.0.0.0"
```
# Super Simple :checkered_flag:

## Model

Model name must be capitalized case (first letter is upper, other letters is lower)

Welcomemodel.cr
```
class Welcomemodel < Core::Model
  def hello
    puts "hello"
  end
end
```

## Controller

Controller name must be capitalized case (first letter is upper, other letters is lower)

Welcomecontroller.cr
```
class Welcomecontroller < Core::Controller
  init Welcomecontroller

  load_model "Welcomemodel"

  action "index" do
    welcomemodel.hello  #put terminal hello before load view
    load_view Welcomeview, "Mustafa'ya Hosgeldin"
  end
end
```

## View

View has a class and an ECR File

Welcomeview.cr
```
class Welcomeview < Core::View
  init "Welcome.ecr", name
  
  include MustafaControl
  
  load_custom_control "Panel"
  
  def load
     @panel.panel_type = "success"
  end
  
end
```
Welcome.ecr
```
Selam, <%= @name %>!

<%= @panel.show %> #panel render with default values
<%= @panel.show panel_type: "danger", title: "Panel Title", content: "it is content!" #panel render with initialize values 
```

## Control

You can create your custom control or can use Mustafa's controls with `include MustafaControl` command.

Welcomeview.cr
```
module Yourcustomcontrols
  class Controlname < Core::Control
    init_property example
    init_property type
    
    init " example: \"Default Value\", type: \"submit\" "

    def show(**properties)
      "<button type=\"#{control_property("type")}\">#{control_property("example")}</button>"
    end
  end
end
```

## Run, go go go

Yourproject.cr
```
require "mustafa"
#And require your controller, view and model files

module Yourproject
  Mustafa.run
end
```

#Thanks

Thanks [porras/session](https://github.com/porras/session) for session and encoder class.

Thanks [logomakr.com](http://logomakr.com) for logo.


