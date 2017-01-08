# mustafa

Mustafa is MVC Framework For Crystal Language

# Getting Started :sunglasses:

Add your shard.yml and install lib. Yes it's ready! Build your MVC project.

# Installation :star:

Add this to your application's 'shards.yml'

```
dependencies:
  mustafa:
    github: guvencenanguvenal/mustafa
    branch: master
```

# Mustafa's Attribute

## Route :rocket:

http://localhost/welcome

call controller which names is Welcome

http://localhost/welcome/hello

call controller which names is Welcome and run action(method) which names is "hello"


 ## Configuration :mag_right:

Configuration file is config.cr on src/mustafa/config/config.cr

DEFAULT_CONTROLLER = "your default controller" #this controller is default which response http://localhost/ 
MODULE_NAME = "your module name"
VIEW_PATH = "src/your module name/view" # ./src/mustafa/view/ecr_file.ecr

and choose your localhost

LOCALHOST_ADDRESS = "0.0.0.0"

# Super Simple :checkered_flag:

## Controller

Welcomecontroller.cr
```
class Welcomecontroller < Controller
    register Welcomecontroller

    action "index" do
      load_ecr Welcomeview, "Mustafa'ya Hosgeldin"
    end

 end
```

## View

View has a class and an ECR File

Welcomeview.cr
```
class Welcomeview < View
    init "Welcome.ecr", name
  end
```
Welcome.ecr
```
Selam, <%= @name %>!
```

## Run, go go go

YourProject.cr
```
require "mustafa"
#And require your controller, view and model files

module Pbg
  Mustafa.run
end
```

