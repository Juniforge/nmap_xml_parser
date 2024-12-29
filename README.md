# NMAP XML PARSER

This project provides a simple OCaml script that parses Nmap XML output to extract IPv4 addresses that are marked as "up". It is designed to work with Nmap scan results that list multiple IP addresses along with their status (up or down). The script outputs a comma-separated list of IPs that are currently up.

## Features

- Parses Nmap XML output.
- Extracts only the IPv4 addresses marked as "up".
- Outputs the extracted IPs in a comma-separated list format.

## Requirements

Before running the project, you will need to have the following installed:

- **OCaml**: The language used to write the script.
- **Dune**: The build system used for this project.

You can install OCaml and Dune by following the official instructions:

- [Install OCaml](https://ocaml.org/docs/install.html)
- [Install Dune](https://dune.build/)

### Installing OCaml and Dune

If you're on a Unix-like system (Linux/macOS), you can install OCaml and Dune via `opam` (OCaml's package manager):

```bash
# Install OPAM (if you don't have it)
sudo apt install opam  # On Ubuntu/Debian
brew install opam      # On macOS

# Initialize OPAM
opam init

# Install OCaml and Dune
opam install ocaml dune
```
