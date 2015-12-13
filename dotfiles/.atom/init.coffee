# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

process.env.PATH = "/Users/Muukii/local/go/bin:/Users/Muukii/go/bin:/Users/Muukii/.pyenv/versions/2.7.8/bin:/Users/Muukii/.pyenv/shims:/Users/Muukii/.pyenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/Muukii/.nvm/versions/node/v0.12.0/bin/"
process.env.GOROOT = process.env.HOME + "/local/go"
process.env.GOPATH = process.env.HOME + "/go"
