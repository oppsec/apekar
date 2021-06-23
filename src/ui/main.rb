require 'colorize'


# Get content from banner.txt file
def get_banner()
    file_content = File.open("src/ui/banner.txt").read
    print(file_content.green)
end


# Clear the screen
def clear()
    system("clear || cls")
end
