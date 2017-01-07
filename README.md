# mustafa
Mustafa is MVC Framework For Crystal Language

Route :

http://localhost/welcome

call controller which names is Welcome

http://localhost/welcome/hello

call controller which names is Welcome and run action(method) which names is "hello"


Configuration :

Configuration file is config.cr on src/mustafa/config/config.cr

DEFAULT_CONTROLLER = "your default controller" #this controller is default which response http://localhost/ 
MODULE_NAME = "your module name"
VIEW_PATH = "src/your module name/view" # ./src/mustafa/view/ecr_file.ecr

and choose your localhost

LOCALHOST_ADDRESS = "0.0.0.0"

