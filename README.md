# chrome-palworld-restapi-extension #

This is a Chromium based browser plugin for the Palworld Dedicated REST API.

The project uses TypeScript, Webpack, jQuery and Boostrap CSS
For making Requests against the Palworld REST API wie use Axios
All other Node based packages can be consultet within the [package.json](./package.json)

## Getting started ##

- open devcontainer or install local

```bash
npm install
```

- use `npm run build` or `npm run watch` to compile and copy all files into the *dist* folder

- load the unpacked dist folder into your chrome browser to use this extension

## Develop ##

- development use webpack in watch mode to compile down changed files to be able to hot reload
```bash
npm run watch
```

run `npm run format` to use prettier preconfigured formatter

### Folder Structure ###
```
|-.devcontainer -> VS Code Devcontainers Configuration
|-.github -> github Configuration
|- dist -> all compiled and copied files for the extension
|- public 
|-- css -> Style Files
|-- icons -> Icons for the Extension
|-- js -> downloaded JavaScript from jQuery, Bootstrap and so on
|-- popup.html, ... -> static html sites
|-- manifest.json -> chrome browser definition file
|- src -> all TypeScript Files
|- tools -> all scripts and toolings to help develop the application (e.g. sematic release versioning script)
|- webpack -> all webpack based Configurationuration
|-.prettierrc -> formatting
|-tsconfig.json -> TypeScript Configuration File
|-.gitignore
|-package.*.json files
|-README
```

TODOS/Roadmap:
- add todos here