require 'colorize'
require 'json'


# Get XML file name
def initializer()

    print(">> XML File Name: ".red)

    file_name = gets.chomp

    xml_content = File.open(file_name).readlines

    sensitive_analyze(file_name, xml_content)

end


# Search for API keys, domains etc... based on keys.json file
def sensitive_analyze(file_name, xml_content)
    puts "\n>> Checking for sensitive content in: #{file_name}".cyan

    keys_file = File.read('./src/core/data/keys.json')
    keys_json = JSON.parse(keys_file)

    xml_content.each do |line|
        keys_json.each do |key, value|

            if line =~ /#{value}/
                puts ">> #{key} found: #{line.strip()}".green
            end

        end
    end

    permissions_analyze(file_name, xml_content)
end


# Check for app required permissions... based on permissions.json file
def permissions_analyze(file_name, xml_content)
    puts "\n>> Getting app required permissions".cyan

    permissions_file = File.read('./src/core/data/permissions.json')
    permissions_json = JSON.parse(permissions_file)

    xml_content.each do |line|
        permissions_json.each do |key, value|

            if line =~ /#{value}/
                puts ">> #{key}".green
            end

        end
    end
end