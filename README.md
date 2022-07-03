# Hello Cairo

Learning Cairo while following the [official tutorial](https://www.cairo-lang.org/docs/hello_cairo/index.html).

## Setup

1. `git clone <url>`
2. `nix-shell`
3. `poetry shell`

_Optional_: Update the `cairo.cairoFormatPath` property in the `.vscode/settings.json` file. Run `which cairo-format` within a Poetry shell to get the project-specific `cairo-format` path.

_Optional_: Update the `python.formatting.blackPath` property in the `.vscode/settings.json` file. Run `which black` within a Poetry shell to get the project-specific `black` path.

## Useful Commands

```sh
nix-shell

poetry init
poetry shell

cairo-format -i name.cairo

cairo-compile --version
cairo-compile name.cairo --output name_compiled.json

cairo-run --program=name_compiled.json --print_output --print_info --relocate_prints [--layout=small] [--program_input=name.json] [--tracer]
```
