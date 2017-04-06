<img src="https://cloud.githubusercontent.com/assets/11555504/21957574/e89ce81e-daa1-11e6-9bde-8b505ac4a5d7.png" width="50" height="75" />

# MustafaVC

Mustafa is MVC Framework for Crystal

# Getting Started :sunglasses:

Download [Visual Studio Code](https://code.visualstudio.com/download) and add [Crystal](https://github.com/g3ortega/vscode-crystal) extension for faster coding with [snippets](https://github.com/guvencenanguvenal/mustafa/blob/master/snippets.md).

Add your `shard.yml` and install lib. Yes it's ready! Build your MVC project.

For more information, you can see [Mustafa Wiki](https://github.com/guvencenanguvenal/mustafa/wiki)

# Installation :star:

Add this to your application's `shards.yml`

```yaml
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

```crystal
Input.params[0] => "param1"
Input.params[1] => "param2"
```

>**Note:** params is not get or post

# Configuration :mag_right:

Configuration file is config.cr on `src/mustafa/config/config.cr`

```crystal
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

`Welcomemodel.cr`

```crystal
class Welcomemodel < Core::Model
  init Welcomemodel, Core::Model::Scope::Singleton

  def hello
    puts "hello"
  end
end
```

## Controller

Controller name must be capitalized case (first letter is upper, other letters is lower)

`Welcomecontroller.cr`

```crystal
class Welcomecontroller < Core::Controller
  init Welcomecontroller

  action "index" do
  
    Core.loader.library(Customlib) do |library|
      library.hello
    end
  
    Core.loader.model(Welcomemodel) do |model|
      model.deneme
    end
  
    Core.loader.view(self, Welcomeview)
  end
end
```

## View

View has a class and an ECR File

`Welcomeview.cr`

```crystal
class Welcomeview < Core::View
  init "Welcome.ecr"
  
  def load
    if (view_params["key"] == "value")
      puts "hello"                      #put hello on terminal
    end
  end
end
```

`Welcome.ecr`

```crystal
Selam, <%= @view_params["key"] %>!      # value
```

## Run, go go go

`Yourproject.cr`

```crystal
require "mustafa"
#And require your controller, view and model files

module Yourproject
  Mustafa.run
end
```

# What's new with the new version:

* Create your custom library
* Select your model scope
* New loader system
* It's now faster than before

# Contribute

Please fork project [MustafaVC](https://github.com/guvencenanguvenal/mustafa/fork)

# Thanks

Thanks [porras/session](https://github.com/porras/session) for session and encoder class.

Thanks [logomakr.com](http://logomakr.com) for logo.


