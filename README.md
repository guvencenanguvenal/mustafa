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

call controller which names is Welcome

*http://localhost/welcome/hello*

call controller which names is Welcome and run action(method) which names is "hello"


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

## Controller

Controller name must be capitalized case (first letter is upper, other letters is lower)

Welcomecontroller.cr
```
class Welcomecontroller < Core::Controller
    init Welcomecontroller

    action "index" do
      load_ecr Welcomeview, "Mustafa'ya Hosgeldin"
    end
 end
```

## View

View has a class and an ECR File

Welcomeview.cr
```
class Welcomeview < Core::View
	init "Welcome.ecr", name
end
```
Welcome.ecr
```
Selam, <%= @name %>!
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

Thanks [porras/session](https://github.com/porras/session) for session and encoder class


