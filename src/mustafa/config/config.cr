module Mustafa
    module Config
        DEFAULT_CONTROLLER = "Welcomecontroller"
        MODULE_NAME = "Mustafa"
        VIEW_PATH = "src/mustafa/view" # ./Mustafa::Config::VIEW_PATH/ecr_file.ecr -> ./src/mustafa/view/ecr_file.ecr
        CONTROL_PATH = "src/mustafa/view"
        LOG_PATH = "src/#{Config::MODULE_NAME.downcase}/logfiles"

        SYSTEM_LOG_PATH = "lib/mustafa/logfiles"
        
        LOCALHOST_ADDRESS = "127.0.0.1"
    end
end