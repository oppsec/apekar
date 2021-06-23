require 'colorize'
require 'json'

require_relative 'helper.rb'


# Get XML file name
def initializer()

    print(">> XML File Name: ".red)

    file_name = gets.chomp
    xml_content = File.open(file_name).readlines

    sensitive_analyze(xml_content)
end


# Search for API keys, domains etc... (keys.json)
def sensitive_analyze(xml_content)
    puts $msg[:keys].cyan

    xml_content.each do |line|
        extract_data("keys").each do |key, value|

            if line =~ /#{value}/
                puts ">> #{key} found: #{line.strip()}".green
            end

        end
    end

    permissions_analyze(xml_content)
end


# Check for app required permissions... (permissions.json)
def permissions_analyze(xml_content)
    puts $msg[:perms].cyan

    xml_content.each do |line|
        extract_data("permissions").each do |key, value|
            if line =~ /#{value}/
                puts ">> #{key}".green
            end
        end
    end

    services_analyze(xml_content)
end

# Check for third party services... (services.json)
def services_analyze(xml_content)
    puts $msg[:serv].green

    xml_content.each do |line|
        extract_data("services").each do |key, value|

            if line =~ /#{value}/
                puts ">> #{key}".green
            end

        end
    end
end