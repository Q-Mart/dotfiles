from subprocess import call

url = 'https://github.com/'

#file handling
plugins_file = open('plugins.txt', 'r')
plugins = plugins_file.readlines()
plugins_file.close()

#format and install plugin
for plugin in plugins:
     call(('git clone ' + url + plugin[:len(plugin) - 1] + '.git').split())
