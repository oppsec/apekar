require 'json'

$msg = {
    :keys => "\n>> Trying to find sensitive secrets...",
    :perms => "\n>> Gathering the permissions required by the app",
    :serv => "\n>> Gathering third party services used by the app"
}

def extract_data(name)
    
    file = File.read("./src/core/data/#{name}.json")
    data = JSON.parse(file)

    return data
end