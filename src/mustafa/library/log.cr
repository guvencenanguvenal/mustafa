require "file_utils.cr"

module Mustafa
    module Library
        enum LogType
            System
            Application
        end

        class Log
            INSTANCE = Log.new

            def initialize
                if !File.directory?(Config::LOG_PATH)
                    FileUtils.mkdir(Config::LOG_PATH)
                end

                if !File.directory?(Config::SYSTEM_LOG_PATH)
                    FileUtils.mkdir(Config::SYSTEM_LOG_PATH)
                end
            end
            
            def add(log_val : String, type = LogType::Application.value)
                time = Time.now
                file_name = "#{time.year}-#{time.month}-#{time.day}|#{time.hour}-#{time.minute}.log"

                File.write(type == LogType::Application.value ? "#{Config::LOG_PATH}/#{file_name}" : "#{Config::SYSTEM_LOG_PATH}/#{file_name}", "Error: #{log_val}\n")
            end

            def clear_system_log
                File.delete(Config::SYSTEM_LOG_PATH)
                rescue ex : Errno 
                    INSTANCE.log("System Error : #{ex.message}", LogType::System.value)
            end

            def clear
                File.delete(Config::LOG_PATH)
                rescue ex : Errno 
                    INSTANCE.log("Application Error : #{ex.message}")
            end
        end

        def self.log
            yield Log::INSTANCE
        end

        def self.log
            Log::INSTANCE
        end
    end
end